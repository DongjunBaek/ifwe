package com.kh.ifwe.club.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.club.model.service.ClubService;
import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubLoggedIn;
import com.kh.ifwe.club.model.vo.ClubMaster;
import com.kh.ifwe.club.model.vo.ClubMember;
import com.kh.ifwe.club.model.vo.Count;
import com.kh.ifwe.clubBoard.model.service.ClubBoardService;
import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;
import com.kh.ifwe.clubBoard.model.vo.ClubBoardProfile;
import com.kh.ifwe.common.util.Utils;
import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.MemberLoggedIn;
import com.kh.ifwe.member.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/club")
@SessionAttributes(value= {"clubMaster","club","clubMember","clubLoggedIn","clubBoardList","msgCount"})
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private MemberService memberService;	
	
	@Autowired
	private ClubBoardService clubBoardService;
	
	
	//소모임 검색 0325 문보라
	@GetMapping("/clubSearchKeyword.do")
	@ResponseBody
	public List<ClubMaster> clubSearchKeyword(ModelAndView mav,
										    @RequestParam("searchType") String searchType,
									      @RequestParam("clubSearchKeyword")String clubSearchKeyword,
									      @RequestParam(value = "clubLocation", required = false) String clubLocation,
										  @RequestParam("memberCode")int memberCode) {
		
		log.debug("searchType = {}",searchType);
		log.debug("clubLocation = {}",clubLocation);
		log.debug("clubSearchKeyword = {}",clubSearchKeyword);
		
		
		String keyWord ="%"+clubSearchKeyword+"%";
		
		Map<String,Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyWord", keyWord);
		param.put("clubLocation", clubLocation);
		param.put("memberCode",memberCode);
		param.put("clubSearchKeyword",clubSearchKeyword);
		
		log.debug("param = {}",param);
		
		List<ClubMaster> searchListResult = null;
		//검색했을때 검색어를 검색어 테이블에 insert
		int result = 0;
		
		if(searchType.equals("hashtag")) {
			//해쉬태그 검색
			log.debug("해쉬태그 검색");
			searchListResult = clubService.searchClubByHashtag(param);
			result = clubService.insertSearchKeyword(param);
			
		}else {
			//모임명 검색
			log.debug("모임명 검색");
			searchListResult = clubService.selectListByName(param);
			result = clubService.insertSearchKeyword(param);
		}

		
		
		log.debug("list1231321321 ={}",searchListResult);
		
		
		
		return searchListResult;
		
	}
	
	
	@GetMapping("/clubSearch")
	public ModelAndView clubSearch(ModelAndView mav) {
		
		log.debug("소모임 검색");
		
		List<ClubMaster> clubList = clubService.clubSearch();
		log.debug("clubList = {}",clubList);
		
		List<Integer> clubCode = new ArrayList<Integer>();
		
		if(clubList != null) {
			for(int i=0; i<clubList.size();i++) {
				clubCode.add(clubList.get(i).getClubCode());
			}
		}
		
		log.debug("clubCode = {}",clubCode);
		//남녀비율
		List<Integer> maleList = clubService.selectMaleCount(clubCode);
		log.debug("maleList = {}",maleList);
		
		//평균나이
		List<Count> ageList = clubService.selectAge(clubCode);
		log.debug("ageList = {}",ageList);
		
		for(int i=0;i<ageList.size();i++) {
			 log.debug(" = {}",ageList.get(i).getAge());
		}
		
		mav.addObject("ageList",ageList);
		mav.addObject("maleList", maleList);
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
								 @SessionAttribute("memberLoggedIn") MemberLoggedIn memberLoggedIn,
								 HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("clubMember");
		session.removeAttribute("clubLoggedIn");
		session.removeAttribute("clubBoardList");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubCode", clubCode);
		param.put("memberCode", memberLoggedIn.getMemberCode());
		
		
		Club club = clubService.selectOne(clubCode);
		
		ClubLoggedIn clubLoggedIn = clubService.selectClubLoggedIn(param);
		
		Member clubMaster2 = clubService.selectClubMaster(club.getClubMaster());
		
		ClubMember clubMaster = clubService.selectClubMaster2(club.getClubMaster());
		
		List<ClubBoard> clubBoardList = clubService.selectBoardList(clubCode);
		
		List<Member> clubMemberCode = clubService.selectMemberCode(clubCode);
		List<ClubMember> clubMember = null;
		int msgCount = memberService.selectMsgCount(memberLoggedIn.getMemberCode());
		log.debug("msgCount={}",msgCount);
		
		//전체 게시글 
		List<ClubBoardProfile> clubBoardProfileList = clubService.selectclubBoardProfileList(clubCode);
	
		
		if(!clubMemberCode.isEmpty()) {
			clubMember = clubService.selectClubMember(clubMemberCode);
		}
		
		log.debug("club={}",club);
		log.debug("clubMaster={}",clubMaster);
		log.debug("clubMember={}",clubMember);
		log.debug("clubLoggedIn={}",clubLoggedIn);
		log.debug("clubBoardList={}",clubBoardList);
		
		
		
		mav.addObject("clubBoardList",clubBoardList);
		mav.addObject("clubLoggedIn",clubLoggedIn);
		mav.addObject("clubMember",clubMember);
		mav.addObject("club", club);
		mav.addObject("clubMaster", clubMaster);
<<<<<<< HEAD
		mav.addObject("msgCount",msgCount);
=======
		mav.addObject("clubBoardProfileList", clubBoardProfileList);
>>>>>>> branch 'master' of https://github.com/DongjunBaek/ifwe.git
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
	
//	@GetMapping("/notice.do")
//	public String notice() {
//		return "club/clubNotice";
//	}
	
//	@GetMapping("/freeboard.do")
//	public String freeboard() {
//		
//		return "club/clubFreeBoard";
//	}
	
	@GetMapping("/management.do")
	public String management() {
		return "club/clubManagement";
	}
	
	@GetMapping("/mngclubinfo.do")
	public ModelAndView mngClubinfo(@RequestParam("clubCode") int clubCode,
									ModelAndView mav) {
		
		Club club = clubService.selectOne(clubCode);
		
		mav.addObject("club",club);
		mav.setViewName("club/clubMngClubinfo");
		
		return mav;
	}
	
	//0327형철 클럽회원관리
	@GetMapping("/mngmember.do")
	public ModelAndView mngMember(ModelAndView mav) {
		
		
		mav.setViewName("club/clubMngMember");
		
		return mav;
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
		//메서지 확인여부를 update
		int result = clubService.updateMsgView(msgCode);
		
		log.debug("result = {}",result);
		log.debug("msg = {}",msg);
		mav.addObject("msg", msg);
		mav.setViewName("club/clubMngEnrollEnd");
		
		
		return mav;
	}
	
	//0326 문보라 가입수락
	@PostMapping("/enrollYes.do")
	public String enrollYes(@RequestParam("clubCode") int clubCode,
							@RequestParam("memberCode") int memberCode,
							@RequestParam("msgCode")int msgCode) {
		log.debug("cluc = {}",clubCode);
		log.debug("memberCode = {}",memberCode);
		log.debug("msgCode = {}",msgCode);
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("clubCode", clubCode);
		param.put("memberCode", memberCode);
		param.put("msgCode",msgCode);
		
		int result = clubService.updateMembersGrade(param);
		//가입수락을 누르면 club_current +1 update
		int plusResult = clubService.updateClubCurrent(clubCode);
		
		log.debug("result = {}",result);
		
		return "club/clubManagement";
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
		log.debug("result = {}",result);
		return "club/clubManagementt";
		
	}
	
	//0327형철 소모임정보수정
	@PostMapping("/mngclubinfo.do")
	public ModelAndView mngClubInfo(ModelAndView mav,
							        @RequestParam(value="upFile",required=false) MultipartFile upFile,
							        Club newClub,
							        HttpServletRequest request,
							        @SessionAttribute("club") Club oldClub) {
		
			log.debug(upFile.getName());
		
		try {
			
			if(!upFile.isEmpty()) {
				
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
	    		
		    	//기존파일삭제
	    		String deletename = request.getParameter("clubImgReName");
	    		String deleteFile = saveDirectory+"/"+deletename;    		
	    		
	    		File oldFile = new File(deleteFile);
	    		
	    		if(oldFile.exists()) {
	    			oldFile.delete();
	    		}
	    		
		    		
    			newClub.setClubImgOri(originalFileName);
    			newClub.setClubImgRe(renamedFileName);
    		
    			log.debug("newClub={}",newClub);
    			
			}else {
				
				newClub.setClubImgOri(oldClub.getClubImgOri());
    			newClub.setClubImgRe(oldClub.getClubImgRe());
				
				
				
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		int result = clubService.updateClub(newClub);
		
		log.debug("result @ updateClub= {}", result);
		
		
		mav.setViewName("redirect:/club/mngclubinfo.do?clubCode="+newClub.getClubCode());
		
		
		return mav;
	}
	
	//0329 형철 회원탈퇴페이지
	@GetMapping("/secession.do")
	public ModelAndView secession(ModelAndView mav) {
		
		
		mav.setViewName("club/clubSecession");
		
		return mav;
	}
	
	@RequestMapping("/secessionEnd.do")
	public ModelAndView secession(ModelAndView mav,
								  @SessionAttribute("clubLoggedIn") ClubLoggedIn clubLoggedIn,
								  @RequestParam("clubCode") int clubCode) {
		
		int memberCode = clubLoggedIn.getMemberCode();
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberCode", memberCode);
		param.put("clubCode", clubCode);
		
		int result = clubService.deleteClubMember(param);
		//메세지보기전에 탈퇴하면 delete
		int msgResult = clubService.deleteMsg(param);
		log.debug("msgResult = {}",msgResult);
		
		mav.setViewName("redirect:/club/clubMain.do?clubCode="+clubCode);
		
		return mav;
	}
	
	@RequestMapping("/memberDelete.do")
	public ModelAndView memberDelete(ModelAndView mav,
									 @RequestParam("memberCode") int memberCode,
									 @SessionAttribute("club") Club club,
									 HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("clubMember");
		
		int clubCode = club.getClubCode();
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberCode", memberCode);
		param.put("clubCode", clubCode);
		
		int result = clubService.deleteClubMember(param);
		
		List<Member> clubMemberCode = clubService.selectMemberCode(clubCode);
		List<ClubMember> clubMember = null;
		
		if(!clubMemberCode.isEmpty()) {
			clubMember = clubService.selectClubMember(clubMemberCode);
		}
		
		mav.addObject("clubMember",clubMember);
		mav.setViewName("redirect:/club/mngmember.do");
		
		
		return mav;
	}
	
	
	@GetMapping("/clubInsertBoard")
	public String clubInsertBoard() {
		return "club/clubInsertBoard";
	}

	@GetMapping("/clubInsertBoardFree")
	public String clubInsertBoardFree() {
		return "club/clubInsertBoardFree";
	}
	
	
	
	
	/**
	 * 0331 membership 구매 기능 관련. 
	 * 동준
	 */
	
	@GetMapping("/selectOneClub")
	@ResponseBody
	public Club selectOneClub(@RequestParam(value="clubCode") int clubCode) {
		
		Club club = clubService.selectOne(clubCode);
		
		return club;
	}
}
