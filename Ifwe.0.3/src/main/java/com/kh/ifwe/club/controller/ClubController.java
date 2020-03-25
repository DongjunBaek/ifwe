package com.kh.ifwe.club.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.club.model.service.ClubService;
import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubMaster;
import com.kh.ifwe.club.model.vo.ClubMember;
import com.kh.ifwe.common.util.Utils;
import com.kh.ifwe.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/club")
@SessionAttributes(value= {"clubMaster","club"})
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	
	
	//소모임 검색 0325 문보라
	@GetMapping("/clubSearchKeyword.do")
	@ResponseBody
	public List<ClubMaster> clubSearchKeyword(ModelAndView mav,
										    @RequestParam("searchType") String searchType,
									      @RequestParam("clubSearchKeyword")String clubSearchKeyword,
									      @RequestParam(value = "clubLocation", required = false) String clubLocation
										  ) {
		
		log.debug("searchType = {}",searchType);
		log.debug("clubLocation = {}",clubLocation);
		log.debug("clubSearchKeyword = {}",clubSearchKeyword);
		
		
		String keyWord ="%"+clubSearchKeyword+"%";
		
		Map<String,String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyWord", keyWord);
		param.put("clubLocation", clubLocation);
		
		log.debug("param = {}",param);
		
		List<ClubMaster> searchListResult = null;
		
		if(searchType.equals("hashtag")) {
			//해쉬태그 검색
			log.debug("해쉬태그 검색");
			searchListResult = clubService.searchClubByHashtag(param);
			
		}else {
			//모임명 검색
			log.debug("모임명 검색");
			searchListResult = clubService.selectListByName(param);
		}

		
		
		log.debug("list1231321321 ={}",searchListResult);
		
		
		
		return searchListResult;
		
	}
	
	
	@GetMapping("/clubSearch")
	public ModelAndView clubSearch(ModelAndView mav) {
		
		log.debug("소모임 검색");
		
		List<ClubMaster> clubList = clubService.clubSearch();
		log.debug("clubList = {}",clubList);
		
		
		mav.setViewName("main/clubSearch");
		mav.addObject("clubList", clubList);
		
		return mav;
	}
	
	@GetMapping("/clubCreate.do")
	public String clubCreate() {
		return "main/clubCreate";
	};
	
	//0320형철 소모임생성
	@PostMapping("/clubCreate.do")
	public ModelAndView Create(
							   ModelAndView mav,Club club,
							   RedirectAttributes redirectAttributes,
							   @RequestParam(value="upFile",required=false)
							   MultipartFile upFile,
							   HttpServletRequest request) {
		
		int clubMax = Integer.parseInt(request.getParameter("clubMax"));
		club.setClubMax(clubMax);
		log.debug("club1={}",club);
		log.debug("upFile={}",upFile);
		
		try {
	    		
	    		//파일명 재생성 renamedFileName으로 저장하기
	    		String originalFileName = upFile.getOriginalFilename();
	    		String renamedFileName = Utils.getRenamedFileName(originalFileName);
	    		
	    		//파일이동
	    		String saveDirectory = request.getServletContext().getRealPath("/resources/upload/club/maintitleimg");
	    		try {
					upFile.transferTo(new File(saveDirectory,renamedFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	    		
	    		
	    		//실제 파일데이터 originalFfileName, renamedFileName을 db에 저장
	    		//Attachment객체
	    		club.setClubImgOri(originalFileName);
	    		club.setClubImgRe(renamedFileName);
	    		
	    		log.debug("club2={}",club);
	    	
	    	int result = clubService.create(club);
	    	
	    	log.debug("result @ club create {}", result);

    	
    	}catch(Exception e) {
    		e.printStackTrace();
    	}

		mav.setViewName("redirect:/club/clubMain.do?clubCode="+club.getClubCode());
			
		return mav;
	}
	
	//보라,0325형철 메인페이지 출력
	@GetMapping("/clubMain.do")
	public ModelAndView clubMain(@RequestParam("clubCode") int clubCode,ModelAndView mav) {
		
		
		log.debug("clubCode = {}",clubCode);
		
		Club club = clubService.selectOne(clubCode);
		
		log.debug("club = {}",club);
		
		
		Member clubMaster = clubService.selectClubMaster(club.getClubMaster());
		
		List<Member> clubMemberCode = clubService.selectMemberCode(clubCode);
		List<ClubMember> clubMember = null;
		if(!clubMemberCode.isEmpty()) {
			clubMember = clubService.selectClubMember(clubMemberCode);
		}
		
		
		
		
		mav.addObject("club", club);
		mav.addObject("clubMaster", clubMaster);
		mav.setViewName("/club/clubMain");
		
		return mav;
	}

	@RequestMapping("/insert.do")
	public ModelAndView insert(ModelAndView mav) {
		
		mav.setViewName("club/clubEnrollSuccess");
		
		return mav;
	}
	
	@GetMapping("/enroll.do")
	public ModelAndView enroll(ModelAndView mav) {
		
		mav.setViewName("club/clubEnroll");
		
		return mav;
	}
	
	@GetMapping("/calendar.do")
	public String calendar() {
		return "club/clubcalendar";
	}
	
	@GetMapping("/notice.do")
	public String notice() {
		return "club/clubNotice";
	}
	
	@GetMapping("/freeboard.do")
	public String freeboard() {
		return "club/clubFreeBoard";
	}
	
	@GetMapping("/management.do")
	public String management() {
		return "club/clubManagement";
	}
	
	@GetMapping("/mngclubinfo.do")
	public String mngClubinfo() {
		return "club/clubMngClubinfo";
	}
	@GetMapping("/mngmember.do")
	public String mngMember() {
		return "club/clubMngMember";
	}
	@GetMapping("/mngboard.do")
	public String mngBoard() {
		return "club/clubMngBoard";
	}
	@GetMapping("/mngenroll.do")
	public String mngEnroll() {
		return "club/clubMngEnroll";
	}
	@GetMapping("/mngenrollend.do")
	public String mngEnrollEnd() {
		return "club/clubMngEnrollEnd";
	}
	
	
	
}
