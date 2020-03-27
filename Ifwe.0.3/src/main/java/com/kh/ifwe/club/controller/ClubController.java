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
import com.kh.ifwe.member.model.vo.MemberLoggedIn;
import com.kh.ifwe.member.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/club")
@SessionAttributes(value= {"clubMaster","club","clubMember","memberLoggedIn"})
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
	
	//보라,형철 소모임 메인페이지 출력
	@GetMapping("/clubMain.do")
	public ModelAndView clubMain(@RequestParam("clubCode") int clubCode,ModelAndView mav,
								 @SessionAttribute("memberLoggedIn") MemberLoggedIn member) {
		
		
		log.debug("clubCode = {}",clubCode);
		
		Club club = clubService.selectOne(clubCode);
		
		log.debug("club = {}",club);
		
		
		Member clubMaster2 = clubService.selectClubMaster(club.getClubMaster());
		
		ClubMember clubMaster = clubService.selectClubMaster2(club.getClubMaster());
		ClubMember memberLoggedIn = clubService.selectClubMaster2(member.getMemberCode());
		
		
		
		List<Member> clubMemberCode = clubService.selectMemberCode(clubCode);
		List<ClubMember> clubMember = null;
		
		if(!clubMemberCode.isEmpty()) {
			clubMember = clubService.selectClubMember(clubMemberCode);
		}
		
		log.debug("memberLoggedIn={}",memberLoggedIn);
		log.debug("clubMaster={}",clubMaster);
		log.debug("clubMember={}",clubMember);
		mav.addObject("memberLoggedIn",memberLoggedIn);
		mav.addObject("clubMember",clubMember);
		mav.addObject("club", club);
		mav.addObject("clubMaster", clubMaster);
		mav.setViewName("/club/clubMain");
		
		return mav;
	}

	
	
	
	@RequestMapping("/insert.do")
	public ModelAndView insert(ModelAndView mav,
							   @RequestParam("memberCode") int memberCode,
							   @RequestParam("masterCode") int masterCode,
							   @RequestParam("enrollreason") String enrollreason,
							   @RequestParam("clubCode") int clubCode) {
		
		log.debug("소모임가입신청");
		log.debug("memberCode = {}",memberCode);
		log.debug("masterCode = {}",masterCode);
		log.debug("enrollreason = {}",enrollreason);
		log.debug("clubCode = {}",clubCode);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberCode", memberCode);
		param.put("masterCode", masterCode);
		param.put("enrollreason", enrollreason);
		param.put("clubCode", clubCode);
		
		int result = clubService.insertMsgEnroll(param);
		int membersResult = clubService.insertClubMembers(param);
		
		
		log.debug("result = {}",result);
		
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
	@PostMapping("/mngenroll.do")
	public ModelAndView mngEnroll(@RequestParam("clubCode") int clubCode,
							@RequestParam("clubMasterCode") int clubMasterCode,
							ModelAndView mav) {
		
		log.debug("clubMasterCode={}",clubMasterCode);
		log.debug("clubCode={}",clubCode);
		
		List<Message> msgList = clubService.selectMsgList(clubCode);
		log.debug("msgList = {}",msgList);
		
		mav.addObject("msgList", msgList);
		mav.setViewName("club/clubMngEnroll");
		
		return mav;
	}
	@GetMapping("/mngenrollend.do")
	public ModelAndView mngEnrollEnd(@RequestParam("msg_code") int msgCode,
									ModelAndView mav) {
		log.debug("msgCode = {}", msgCode);
		
		Message msg = clubService.selectMsgOne(msgCode);
		log.debug("msg = {}",msg);
		mav.addObject("msg", msg);
		mav.setViewName("club/clubMngEnrollEnd");
		
		
		return mav;
	}
	
	//0326 문보라 가입수락
	@PostMapping("/enrollYes.do")
	public String enrollYes(@RequestParam("clubCode") int clubCode,
							@RequestParam("memberCode") int memberCode) {
		log.debug("cluc = {}",clubCode);
		log.debug("memberCode = {}",memberCode);
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("clubCode", clubCode);
		param.put("memberCode", memberCode);
		
		int result = clubService.updateMembersGrade(param);
		log.debug("result = {}",result);
		
		return "club/management.do";
	}
	
	//0326 문보라 가입거절
	@PostMapping("/enrollNo.do")
	public String enrollNo(@RequestParam("clubCode") int clubCode,
						   @RequestParam("memberCode") int memberCode) {
		log.debug("cluc = {}",clubCode);
		log.debug("memberCode = {}",memberCode);
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("clubCode", clubCode);
		param.put("memberCode", memberCode);
		
		int result = clubService.deleteMembers(param);
		return "club/management.do";
		
	}
	
	
}
