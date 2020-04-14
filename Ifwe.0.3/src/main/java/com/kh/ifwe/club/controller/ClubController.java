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

import com.kh.ifwe.club.model.service.ClubService;
import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubLoggedIn;
import com.kh.ifwe.club.model.vo.ClubMaster;
import com.kh.ifwe.club.model.vo.ClubMember;
import com.kh.ifwe.club.model.vo.Count;
import com.kh.ifwe.club.model.vo.Heart;
import com.kh.ifwe.clubBoard.model.service.ClubBoardService;
import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;
import com.kh.ifwe.clubBoard.model.vo.ClubBoardComment;
import com.kh.ifwe.clubBoard.model.vo.ClubBoardProfile;
import com.kh.ifwe.common.util.Utils;
import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.MemberLoggedIn;
import com.kh.ifwe.member.model.vo.Message;
import com.kh.ifwe.member.model.vo.MsgPro;
import com.kh.ifwe.member.model.vo.Profile;
import com.kh.ifwe.mian.model.vo.SearchKeyword;

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
	public Map<Integer,Object> clubSearchKeyword(ModelAndView mav,
										    @RequestParam("searchType") String searchType,
									      @RequestParam("clubSearchKeyword")String clubSearchKeyword,
									      @RequestParam(value = "clubLocation", required = false) String clubLocation,
										  @RequestParam("memberCode")int memberCode,
										  @RequestParam(value="cPage", required = false, defaultValue = "1")int cPage) {
		
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
		
		final int numPerPage = 9;
		int totalContents = 0;
		
		if(searchType.equals("hashtag")) {
			//해쉬태그 검색
			log.debug("해쉬태그 검색");
			totalContents = clubService.searchClubByHashtag(param).size();
			searchListResult = clubService.searchClubByHashtag(param,numPerPage,cPage);
			result = clubService.insertSearchKeyword(param);
			
		}else {
			//모임명 검색
			log.debug("모임명 검색");
			totalContents = clubService.selectListByName(param).size();
			searchListResult = clubService.selectListByName(param,numPerPage,cPage);
			result = clubService.insertSearchKeyword(param);
		}

		
		String showKeyword = clubSearchKeyword;
		log.debug("list1231321321 ={}",searchListResult);
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		/**
		 * 0407 dongjun 소모임 장 프로필 사진불러오기
		 */
		List<Profile> clubmasterProfile = new ArrayList<Profile>();
		if(searchListResult != null) {
			for(int i=0; i<searchListResult.size();i++) {
				Profile profile = memberService.selectProfileByMemberCode(searchListResult.get(i).getClubMaster());
				clubmasterProfile.add(profile);
			}
		}
		
		/**
		 * 0407 dongjun 소모임 별 남녀 비율 및 평균 나이
		 */
		List<Integer> clubCode = new ArrayList<Integer>();
		
		if(searchListResult != null) {
			for(int i=0; i<searchListResult.size();i++) {
				clubCode.add(searchListResult.get(i).getClubCode());
			}
		}
		
		//남녀비율
		List<Integer> maleList = clubService.selectMaleCount(clubCode);
		log.debug("maleList = {}",maleList);
		
		//평균나이 가져오기
		List<Count> ageList = clubService.selectAge(clubCode);
		log.debug("ageList = {}",ageList);
		Map<Integer,Integer> ageMap = new HashMap<Integer, Integer>();
		if(searchListResult != null) {
			for(int i=0; i<searchListResult.size();i++) {
				ageMap.put(i,clubService.selectAgeAvg(searchListResult.get(i).getClubCode()));
			}
		}
		
		/* List<ClubMaster> */
		Map<Integer, Object> resultMapClub = new HashMap<Integer, Object>();
		resultMapClub.put(1, searchListResult);
		resultMapClub.put(2, totalPage);
		resultMapClub.put(3, cPage);
		resultMapClub.put(4, showKeyword);
		resultMapClub.put(5, clubLocation);
		resultMapClub.put(6, clubmasterProfile);
		resultMapClub.put(7, maleList);//남자비율
		resultMapClub.put(8, ageMap);//평균나이
		
		return resultMapClub;
		
	}
	
	
	@GetMapping("/clubSearch")
	public ModelAndView clubSearch(ModelAndView mav, @RequestParam(value="cPage", required = false, defaultValue = "1")int cPage) {
		
		log.debug("소모임 검색");
		
		final int numPerPage = 9;
		log.debug("cPage {}",cPage);
		List<ClubMaster> clubList = clubService.clubSearch(cPage,numPerPage);
		log.debug("clubList = {}",clubList);

		int totalContents = clubService.clubSearch().size();
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
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
		
		/**
		 * 0407 dongjun 소모임 장 프로필 사진불러오기
		 */
		List<Profile> clubmasterProfile = null;
		if(clubList != null) {
			clubmasterProfile = new ArrayList<Profile>();
			for(int i=0; i<clubList.size();i++) {
				
				Profile profile = memberService.selectProfileByMemberCode(clubList.get(i).getClubMaster());
				clubmasterProfile.add(profile);
			}
		}
		
		
		mav.addObject("ageList",ageList);
		mav.addObject("maleList", maleList);
		mav.setViewName("main/clubSearch");
		mav.addObject("clubList", clubList);
		mav.addObject("cPage", cPage);
		mav.addObject("tPage", totalPage);
		mav.addObject("profile", clubmasterProfile);
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
		
		
		Map<String, Object> param2 = new HashMap<String, Object>();
		param2.put("clubCode", clubCode);
		param2.put("masterCode", club.getClubMaster());
		
		ClubMember clubMaster = clubService.selectClubMaster2(param2);
		
		List<ClubBoard> clubBoardList = clubService.selectBoardList(clubCode);
		List<Heart> heartMember = clubService.selectHeartMember();
		log.debug("heartMember = {}",heartMember);
		int msgCount = memberService.selectMsgCount(memberLoggedIn.getMemberCode());
		
		
		//전체 게시글 
		List<ClubBoardProfile> clubBoardProfileList = clubService.selectclubBoardProfileList(clubCode);
	
		List<Member> clubMemberCode = clubService.selectMemberCode(clubCode);
		List<ClubMember> clubMember = null;
		param2.put("clubMemberCode", clubMemberCode);
		
		if(!clubMemberCode.isEmpty()) {
			clubMember = clubService.selectClubMember(param2);
		}
		
		List<BoardImg> boardNo = clubBoardService.selectClubBoardNoList(clubCode);
		List<BoardImg> boardImg = null;
		
		if(boardNo!=null && !boardNo.isEmpty() && boardNo.size()!=0) {
			boardImg = clubBoardService.selectClubBoardImg(boardNo);
		}
		
		//메인페이지 게시물 댓글리스트
		List<ClubBoardComment> clubBoardComment = clubBoardService.selectBoardComment(clubCode);
		
		
		
		log.debug("club={}",club);
		log.debug("clubMaster={}",clubMaster);
		log.debug("clubMember={}",clubMember);
		log.debug("clubLoggedIn={}",clubLoggedIn);
		log.debug("clubBoardList={}",clubBoardList);
		log.debug("clubBoardProfileList={}",clubBoardProfileList);
		log.debug("boardImg={}",boardImg);
		log.debug("clubBoardComment={}",clubBoardComment);
		
		
		mav.addObject("clubBoardComment",clubBoardComment);
		mav.addObject("clubBoardList",clubBoardList);
		mav.addObject("clubLoggedIn",clubLoggedIn);
		mav.addObject("clubMember",clubMember);
		mav.addObject("club", club);
		mav.addObject("clubMaster", clubMaster);
		mav.addObject("msgCount",msgCount);
		mav.addObject("clubBoardProfileList", clubBoardProfileList);
		mav.addObject("boardImg",boardImg);
		mav.addObject("heartMember",heartMember);
		
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
		
		MsgPro msg = clubService.selectMsgOne(msgCode);
		//메서지 확인여부를 update
		int result = clubService.updateMsgView(msgCode);
		Profile profile = memberService.selectProfileByMemberCode(msg.getMemberCode());
		
		
		log.debug("profile = {}",profile);
		log.debug("result = {}",result);
		log.debug("msg = {}",msg);
		mav.addObject("msg", msg);
		mav.addObject("profile", profile);
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
		return "club/clubManagement";
		
	}
	
	//0327형철 소모임정보수정
	@PostMapping("/mngclubinfo.do")
	public ModelAndView mngClubInfo(ModelAndView mav,
							        @RequestParam(value="upFile",required=false) MultipartFile upFile,
							        Club newClub,
							        HttpServletRequest request,
							        @SessionAttribute("club") Club oldClub,
							        @RequestParam("clubMax")int clubMax) {
		
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
		
		newClub.setClubMax(clubMax);
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
		
		param.put("clubMemberCode", clubMemberCode);
		
		if(!clubMemberCode.isEmpty()) {
			clubMember = clubService.selectClubMember(param);
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
	
	//0403형철 소모임검색
	@GetMapping("/searchBoard.do")
	public ModelAndView searchBoard(ModelAndView mav,@RequestParam("clubCode") int clubCode,
									@RequestParam("search") String searchTag) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubCode", clubCode);
		param.put("searchTag", searchTag);
		
		List<ClubBoardProfile> clubBoardProfileList = clubService.selectclubBoardSearch(param);
		
		List<BoardImg> boardNo = clubBoardService.selectClubBoardNoList(clubCode);
		List<BoardImg> boardImg = null;
		
		if(boardNo!=null && !boardNo.isEmpty() && boardNo.size()!=0) {
			boardImg = clubBoardService.selectClubBoardImg(boardNo);
		}
		
		//메인페이지 게시물 댓글리스트
		List<ClubBoardComment> clubBoardComment = clubBoardService.selectBoardComment(clubCode);
		
		mav.addObject("clubBoardComment",clubBoardComment);
		mav.addObject("clubBoardProfileList", clubBoardProfileList);
		mav.addObject("boardImg",boardImg);
		
		
		mav.setViewName("club/clubSearchBoard");
		
		return mav;
	}
	
	
	
	
	
	/** 20200403 풀캘린더 insert 김원재
	 */
	@GetMapping("/calendar.do")
	public String calendar() {
		return "club/fc";
	}
	
	
	/**
	 * 0402 clubCateCode List 가져오기
	 * 여주
	 */
	@GetMapping("/clubCateList.do")
	@ResponseBody
	public List<Club> clubCateList(@RequestParam("clubCatecode") String clubCatecode){
		
		log.debug("소모임 카테고리 별 리스트 페이지");
		
		List<Club> clubCateList  = clubService.selectClubCateList(clubCatecode);
		
		log.debug("clubCateList{}=",clubCateList);
		
		return clubCateList;
	}
	

	@GetMapping("/searchKeywordList.do")
	@ResponseBody
	public List<SearchKeyword> searchKeywordList(){
		log.debug("검색어 키워드 리스트");
		
		List<SearchKeyword> searchkeywordList = clubService.selectSearchKeywordList();
		
		log.debug("searchKeywordList{}=",searchkeywordList);
		
		return searchkeywordList;
	}
	
	
	//신고된 게시글 보기
	@GetMapping("/mngreport.do")
	public ModelAndView mngReport(@RequestParam("clubCode")int clubCode,ModelAndView mav) {
		List<ClubBoard> list = clubService.selectReportBoardList(clubCode);
		log.debug("clubList = {}",list);
		
		mav.setViewName("club/clubMngReport");
		mav.addObject("reportList", list);
		return mav;
	}
	
	@PostMapping("/blind.do")
	public String blind(@RequestParam("clubCode")int clubCode,@RequestParam("boardNo")int boardNo,RedirectAttributes redirectAttributes) {
		log.debug("boardNo = {}",boardNo);
		log.debug("clubCode = {}",clubCode);
		
		int result = clubService.blindBoard(boardNo);
		String msg = result>0?"블라인드처리되었습니다":"실패";
		redirectAttributes.addFlashAttribute("msg", msg);
		
		return "redirect:mngreport.do?clubCode="+clubCode;
	}
}

