package com.kh.ifwe.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.admin.model.service.AdminService;
import com.kh.ifwe.admin.model.vo.AdminEvent;
import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 장여주 2020-03-22 Slf4j / RequestMapping 추가
 * 
 *
 */
@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@GetMapping("/adminPage.do")
	public String adminPage() {
		return "admin/adminStatistics";
	}

	@GetMapping("/statistics.do")
	public String statistics() {
		return "admin/adminStatistics";
	}

	@GetMapping("/member.do")
	public String member() {
		return "/admin/adminMember";
	}

	/**
	 * 
	 * @param cPage
	 * @param memberRole
	 * @return
	 */
	@GetMapping("/memberList.do")
	@ResponseBody
	public Map<Integer, Object> memberList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "memberRole", required = false, defaultValue = "member") String memberRole) {
		log.debug("회원목록 페이지");

		final int numPerPage = 10;
		
		// 업무로직 처리
		
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		
		List<Member> memberlist = adminService.selectMemberList(cPage, numPerPage, memberRole);
		
		int totalContents = adminService.selectMemberCount(memberRole);
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		log.debug("memberlist{}=" + memberlist);
		log.debug("totalContents={}", totalContents);
		
		map.put(0, cPage);
		map.put(1, totalPage);
		map.put(2, memberlist);
		
		return map;
	}

	@GetMapping("/cancel.do")
	public String cancel(@RequestParam("memberCode") int memberCode, RedirectAttributes redirectAttributes) {

		Member member = adminService.selectOne(memberCode);
		log.debug("member{}=", member);

		int result = adminService.cancelMember(member, memberCode);

		int updateReport = adminService.selectReportOne(memberCode);
		
		redirectAttributes.addFlashAttribute("msg", result > 0 ? "변경성공" : "변경실패");

		return "/admin/adminMember";
	}

	@GetMapping("/drop.do")
	public String drop(@RequestParam("memberCode") int memberCode, RedirectAttributes redirectAttributes) {

		Member member = adminService.selectOne(memberCode);
		log.debug("member{}=", member);

		int result = adminService.dropMember(member, memberCode);

		redirectAttributes.addFlashAttribute("msg", result > 0 ? "변경성공" : "변경실패");

		return "/admin/adminMember";
	}

	@GetMapping("/searchMember.do")
	@ResponseBody
	public List<Member> search(@RequestParam(value = "memberName", required = false) String memberName) {

		List<Member> searchList = adminService.selectOne(memberName);
		log.debug("searhList{}=", searchList);

		return searchList;
	}

	@GetMapping("/notice.do")
	public String notice() {
		return "/admin/adminNotice";
	}

	@GetMapping("/adminBoardList.do")
	@ResponseBody
	public Map<Integer, Object> boardList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "boardCategory", required = false, defaultValue = "member") String boardCategory) {
		log.debug("회원목록 페이지");

		final int numPerPage = 10;
		
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		
		// 업무로직 처리
		List<Board> boardList = adminService.selectOneBoard(cPage, numPerPage, boardCategory);

		int totalContents = adminService.selectNoticeCount(boardCategory);
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		log.debug("boardlist{}=" + boardList);
		log.debug("totalContents={}", totalContents);
		
		map.put(0, cPage);
		map.put(1, totalPage);
		map.put(2, boardList);
		
		log.debug("boardList{}=" + boardList);

		return map;
	}

	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "/admin/adminBoardFrm";
	}

	@GetMapping("/adminBoardDetail.do")
	public ModelAndView boardDetail(@RequestParam(value = "boardNo", required = false) int boardNo) {
		log.debug("게시판 상세 페이지");

		ModelAndView mav = new ModelAndView();

		Board board = adminService.selectBoard(boardNo);
		
		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		mav.addObject("member",member);
		mav.addObject("board", board);
		mav.setViewName("/admin/adminBoardDetail");

		return mav;
	}

	@GetMapping("/boardUpdateFrm.do")
	public ModelAndView boardUpdate(@RequestParam(value = "boardNo", required = false) int boardNo) {
		log.debug("공지사항 수정 페이지");

		ModelAndView mav = new ModelAndView();

		Board board = adminService.selectBoard(boardNo);
		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		mav.addObject("member",member);		
		mav.addObject("board", board);
		mav.setViewName("admin/adminBoardUpdateFrm");

		return mav;
	}

	/*
	 * @GetMapping("/adminBoardUpdate.do") public String
	 * boardUpdateOne(@RequestParam(value="boardNo") int boardNo,RedirectAttributes
	 * redirectAttributes) { log.debug("공지사항 수정");
	 * 
	 * int result = adminService.updateBoard(boardNo);
	 * 
	 * redirectAttributes.addFlashAttribute("msg", result>0?"수정 성공!":"수정 실패!");
	 * 
	 * return "redirect:/admin/adminBoardDetail"; }
	 */

	@GetMapping("/boardDelete.do")
	public ModelAndView boardDelete(@RequestParam("boardNo") int boardNo) {
		log.debug("공지사항 삭제");

		ModelAndView mav = new ModelAndView();

		int result = adminService.deleteBoard(boardNo);

		mav.setViewName("admin/adminNotice");

		return mav;

	}

	@GetMapping("/adminBoardAnswer.do")
	public ModelAndView boardAnswerDetail(@RequestParam(value = "boardNo", required = false) int boardNo) {
		log.debug("게시판 상세 페이지");

		ModelAndView mav = new ModelAndView();

		Board board = adminService.selectBoard(boardNo);
		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		mav.addObject("member",member);
		mav.addObject("board", board);
		mav.setViewName("/admin/adminBoardAnswerFrm");

		return mav;
	}

	@PostMapping("/boardRepleInsert.do")
	public ModelAndView boardRepleInsert(@RequestParam("boardNo") int boardNo, BoardComment boardComment,
			ModelAndView mav) {
		/**
		 * 0328 boardComment insert 기능 여주
		 */
		log.debug("boardComment 페이지");

		Board board = adminService.selectBoard(boardNo);
		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		mav.addObject("member",member);	
		int result = adminService.insertBoardComment(boardComment);

		if (result > 0) {
			log.debug("admin@insertBoardComment.do: 글 등록 성공");
		} else {
			log.debug("admin@insertBoardComment.do: 글 등록 실패");
		}

		boardComment = adminService.selectBoardComment(boardNo);

		mav.addObject("board", board);
		mav.addObject("boardComment", boardComment);
		mav.setViewName("/admin/adminBoardAnswer");

		return mav;
	}

	@GetMapping("/boardCommentDelete.do")
	public ModelAndView boardCommentDelete(@RequestParam("boardNo") int boardNo) {
		log.debug("공지사항 삭제");

		ModelAndView mav = new ModelAndView();

		int result = adminService.deleteBoardComment(boardNo);

		if (result > 0) {
			log.debug("admin@deleteBoardComment.do: 글 삭제 성공");
		} else {
			log.debug("admin@deleteBoardComment.do: 글 삭제 실패");
		}
		log.debug("삭제 작업 종료");
		mav.setViewName("/admin/adminNotice");

		return mav;

	}

	@PostMapping("/boardCommentUpdateFrm.do")
	public ModelAndView boardCommentUpdate(@RequestParam(value = "boardNo", required = false) int boardNo,
			BoardComment boardComment) {
		log.debug("답변 수정 페이지");

		ModelAndView mav = new ModelAndView();

		log.debug("boardComment{}=", boardComment);
		Board board = adminService.selectBoard(boardNo);
		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		int result = adminService.UpdateBoardComment(boardComment);
		boardComment = adminService.selectBoardComment(boardNo);

		mav.addObject("member",member);		
		mav.addObject("board", board);
		mav.addObject("boardComment", boardComment);

		mav.setViewName("admin/adminBoardAnswer");

		return mav;
	}

	@GetMapping("/adminBoardReport.do")
	public ModelAndView boardReportDetail(@RequestParam(value = "boardNo", required = false) int boardNo) {
		log.debug("신고 상세 페이지");

		ModelAndView mav = new ModelAndView();

		Board board = adminService.selectBoard(boardNo);

		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		mav.addObject("member",member);
		mav.addObject("board", board);
		mav.setViewName("/admin/adminBoardReport");

		return mav;
	}

	@GetMapping("/adminBoardAnswerDetail.do")
	public ModelAndView adminboardAnswerDetail(@RequestParam(value = "boardNo") int boardNo) {
		ModelAndView mav = new ModelAndView();
		log.debug("답변등록성공 페이지");

		Board board = adminService.selectBoard(boardNo);

		Member member = adminService.selectOne(board.getMemberCode());
		
		log.debug("member{}=",member);
		
		BoardComment boardComment = adminService.selectBoardComment(boardNo);
		
		mav.addObject("member",member);
		mav.addObject("board", board);
		mav.addObject("boardComment", boardComment);
		mav.setViewName("/admin/adminBoardAnswer");
		return mav;
	}

	@GetMapping("/event.do")
	public ModelAndView event(ModelAndView mav) {
		log.debug("이벤트목록페이지");

		List<AdminEvent> eventList = adminService.selectEventList();

		log.debug("eventList{}=", eventList);

		mav.addObject("eventList", eventList);
		mav.setViewName("/admin/adminEvent");

		return mav;

	}

	@GetMapping("/adminEventFrm.do")
	public String eventFrm() {
		return "/admin/adminEventFrm";
	}

	@PostMapping("/eventInsert.do")
	public ModelAndView eventInsert(ModelAndView mav, AdminEvent adminEvent,
			@RequestParam("upFile") MultipartFile upFile, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		if (!upFile.isEmpty()) {
			String originalFileName = upFile.getOriginalFilename();
			String renamedFileName = com.kh.ifwe.common.util.Utils.getRenamedFileName(originalFileName);

			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/admin/event");

			try {
				upFile.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			adminEvent.setEventImgOri(originalFileName);
			adminEvent.setEventImgRe(renamedFileName);
			log.debug("adminEvent{}=", adminEvent);
		}

		int result = adminService.insertEvent(adminEvent);
		redirectAttributes.addFlashAttribute("msg", result > 0 ? "등록성공!" : "등록실패!");

		List<AdminEvent> eventList = adminService.selectEventList();
		
		String viewName = "/admin/adminEvent";
		
		mav.addObject("eventList", eventList);
		mav.setViewName(viewName);

		return mav;
	}


	 @PostMapping("/adminEventDel.do")
	 public ModelAndView eventDel(@RequestParam("eventCode") int eventCode, ModelAndView mav) {
	  log.debug("이벤트 삭제 페이지");
	
	  int result= adminService.deleteEvent(eventCode);
	
	  if(result>0) { log.debug("삭제 성공"); }
	  else { log.debug("삭제 실패"); }
	  List<AdminEvent> eventList = adminService.selectEventList();
		
	  
	  mav.addObject("eventList", eventList);
	  mav.setViewName("/admin/adminEvent");
	  
	  return mav; 
	  }

	 @PostMapping("/adminEventUpdateFrm.do")
	 public ModelAndView eventUpdateFrm(@RequestParam("eventCode") int eventCode, ModelAndView mav) {
		 log.debug("이벤트 업데이트 페이지");
		 
		 AdminEvent adminEvent = adminService.selectOneEvent(eventCode);
		 
		 mav.addObject("adminEvent",adminEvent);
		 mav.setViewName("/admin/adminEventUpdateFrm");
		 return mav;
	 }
	 
	 @PostMapping("/eventUpdate.do")
	 public ModelAndView eventUpdate(@RequestParam("eventCode") int eventCode, ModelAndView mav, 
			 	AdminEvent adminEvent, @RequestParam("upFile") MultipartFile upFile, HttpServletRequest request,
				RedirectAttributes redirectAttributes) {
		 log.debug("이벤트 업데이트 등록 페이지");
		
			if (!upFile.isEmpty()) {
				String originalFileName = upFile.getOriginalFilename();
				String renamedFileName = com.kh.ifwe.common.util.Utils.getRenamedFileName(originalFileName);

				String saveDirectory = request.getServletContext().getRealPath("/resources/upload/admin/event");

				try {
					upFile.transferTo(new File(saveDirectory, renamedFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				adminEvent.setEventImgOri(originalFileName);
				adminEvent.setEventImgRe(renamedFileName);
				log.debug("adminEvent{}=", adminEvent);
			}
		 
		 int result = adminService.updateEvent(adminEvent);
		 adminEvent = adminService.selectOneEvent(eventCode);
		 
		 mav.addObject("adminEvent", adminEvent);
		 mav.setViewName("/admin/adminEventUpdateFrm");
		 
		 return mav;
	 }
	 

	 @GetMapping("/memberEnrollList.do")
	 @ResponseBody
	 public List<Member> memberEnrollList(){
		 log.debug("회원가입 수 목록 페이지");
		 
		 List<Member> memberEnrollList = adminService.memberEnrollList();
		 
		 log.debug("memberEnrollList{}=",memberEnrollList);
		 
		 return memberEnrollList;
	 }

	 @PostMapping("/dormantNotice.do")
	 public ModelAndView dormantNoticeInsert(ModelAndView mav, @RequestParam("memberCode") int memberCode) {
		 log.debug("휴면계정 게시판 insert 페이지");
		 
		 String msg = "";
		 int result = adminService.insertDormantNotice(memberCode);
		 
		 if (result>0) {
			 log.debug("휴면요청 게시글 등록 성공");
			 msg = "휴면 요청이 완료되었습니다. 휴면해지 완료는 2~3일 정도 소요됩니다";
		 }
		 else {
			 log.debug("휴면요청 게시글 등록 실패");
			 msg = "휴면 요청에 실패하였습니다. 재로그인 후 이용해주세요";
		 }
		 
		 mav.addObject("msg",msg);
		 mav.setViewName("redirect:/");
		 
		 return mav;
	 }
	 
	 
}
