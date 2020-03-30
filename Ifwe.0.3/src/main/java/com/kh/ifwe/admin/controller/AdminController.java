package com.kh.ifwe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.admin.model.service.AdminService;
import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 장여주
 * 2020-03-22
 * Slf4j / RequestMapping 추가
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
	public List<Member> memberList(@RequestParam(value="cPage",defaultValue="1")int cPage, @RequestParam(value="memberRole", required=false, defaultValue="member")String memberRole) {
		log.debug("회원목록 페이지");
		
		final int numPerPage = 10;
		
		//업무로직 처리
		List<Member> list = adminService.selectMemberList(cPage, numPerPage, memberRole);		
		
		log.debug("list="+list);
		
		return list;
	}
	

	@GetMapping("/cancel.do")
	public String cancel(@RequestParam("memberCode") int memberCode, RedirectAttributes redirectAttributes) {
		
		Member member = adminService.selectOne(memberCode);
		log.debug("member{}=",member);
		
		int result = adminService.cancelMember(member,memberCode);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"변경성공":"변경실패");
		
		return "/admin/adminMember";
	}
	
	@GetMapping("/drop.do")
	public String drop(@RequestParam("memberCode") int memberCode, RedirectAttributes redirectAttributes) {
		
		Member member = adminService.selectOne(memberCode);
		log.debug("member{}=",member);
		
		int result = adminService.dropMember(member,memberCode);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"변경성공":"변경실패");
		
		return "/admin/adminMember";
	}
	
	@GetMapping("/searchMember.do")	
	@ResponseBody
	public List<Member> search(@RequestParam(value="memberName", required=false) String memberName) {
		
		List<Member> searchList = adminService.selectOne(memberName);
		log.debug("searhList{}=",searchList);
		
		return searchList;
	}
	
	@GetMapping("/notice.do")
	public String notice() {
		return "/admin/adminNotice";
	}
	
	@GetMapping("/adminBoardList.do")
	@ResponseBody
	public List<Board> boardList(@RequestParam(value="cPage",defaultValue="1")int cPage, @RequestParam(value="boardCategory", required=false, defaultValue="member")String boardCategory) {
		log.debug("회원목록 페이지");
		
		final int numPerPage = 10;
		
		//업무로직 처리
		List<Board> boardList = adminService.selectOneBoard(cPage, numPerPage, boardCategory);		
		
		log.debug("boardList{}="+boardList);
		
		return boardList;
	}

	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "/admin/adminBoardFrm";
	}
	
	@GetMapping("/adminBoardDetail.do")
	public ModelAndView boardDetail(@RequestParam(value="boardNo", required=false) int boardNo) {
		log.debug("게시판 상세 페이지");
		
		ModelAndView mav = new ModelAndView();
		
		Board board = adminService.selectBoard(boardNo);
		
		mav.addObject("board",board);
		mav.setViewName("/admin/adminBoardDetail");
		
		return mav;
	}
	@GetMapping("/boardUpdateFrm.do")
	public ModelAndView boardUpdate(@RequestParam(value="boardNo", required=false) int boardNo) {
		log.debug("공지사항 수정 페이지");
		
		ModelAndView mav = new ModelAndView();
		
		Board board = adminService.selectBoard(boardNo);
		
		mav.addObject("board",board);
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
	public ModelAndView boardAnswerDetail(@RequestParam(value="boardNo", required=false) int boardNo) {
		log.debug("게시판 상세 페이지");
		
		ModelAndView mav = new ModelAndView();
		
		Board board = adminService.selectBoard(boardNo);
		
		mav.addObject("board",board);
		mav.setViewName("/admin/adminBoardAnswerFrm");
		
		return mav;
	}
	
	@PostMapping("/boardRepleInsert.do")
	public ModelAndView boardRepleInsert(@RequestParam("boardNo") int boardNo, BoardComment boardComment, ModelAndView mav) {
		/**
		 * 0328 boardComment insert 기능 여주
		 */
		log.debug("boardComment 페이지");
		
		Board board = adminService.selectBoard(boardNo);
		
		
		int result = adminService.insertBoardComment(boardComment);
		
		if(result > 0) {
			log.debug("admin@insertBoardComment.do: 글 등록 성공");
		}else {
				log.debug("admin@insertBoardComment.do: 글 등록 실패");	
			}
		
		boardComment = adminService.selectBoardComment(boardNo);
		
		
		mav.addObject("board",board);
		mav.addObject("boardComment",boardComment);
		mav.setViewName("/admin/adminBoardAnswer");
		
		return mav;
	}
	
	@GetMapping("/boardCommentDelete.do")
	public ModelAndView boardCommentDelete(@RequestParam("boardNo") int boardNo) {
		log.debug("공지사항 삭제");
		
		ModelAndView mav = new ModelAndView();
		
		int result = adminService.deleteBoardComment(boardNo);
		
		if(result > 0) {
			log.debug("admin@deleteBoardComment.do: 글 삭제 성공");
		}else {
				log.debug("admin@deleteBoardComment.do: 글 삭제 실패");	
			}
		log.debug("삭제 작업 종료");	
		mav.setViewName("/admin/adminNotice");
		
		return mav;
		
	}
	@PostMapping("/boardCommentUpdateFrm.do")
	public ModelAndView boardCommentUpdate(@RequestParam(value="boardNo", required=false) int boardNo, BoardComment boardComment) {
		log.debug("답변 수정 페이지");
		
		ModelAndView mav = new ModelAndView();

		log.debug("boardComment{}=",boardComment);
		Board board = adminService.selectBoard(boardNo);
		
		int result = adminService.UpdateBoardComment(boardComment);
		boardComment = adminService.selectBoardComment(boardNo);
		
		
		mav.addObject("board",board);
		mav.addObject("boardComment", boardComment);
		
		mav.setViewName("admin/adminBoardAnswer");
		
		return mav;
	}
	
	@GetMapping("/adminBoardReport.do")
	public ModelAndView boardReportDetail(@RequestParam(value="boardNo", required=false) int boardNo) {
		log.debug("신고 상세 페이지");
		
		ModelAndView mav = new ModelAndView();
		
		Board board = adminService.selectBoard(boardNo);
		
		mav.addObject("board",board);
		mav.setViewName("/admin/adminBoardReport");
		
		return mav;
	}
	

	@GetMapping("/adminBoardAnswerDetail.do") 
	 public ModelAndView adminboardAnswerDetail(@RequestParam(value="boardNo")int boardNo) {
		ModelAndView mav = new ModelAndView();
		log.debug("답변등록성공 페이지");
		
		Board board = adminService.selectBoard(boardNo);
		
		BoardComment boardComment = adminService.selectBoardComment(boardNo);
		
		mav.addObject("board",board);
		mav.addObject("boardComment", boardComment);
		mav.setViewName("/admin/adminBoardAnswer");
		return mav; 
	 }


	@GetMapping("/event.do")
	public String event() {
		return "/admin/adminEvent";
	}
	
	/*
	 * @GetMapping("/adminBoardList.do")
	 * 
	 * @ResponseBody public List<Board>
	 * boardList(@RequestParam(value="cPage",defaultValue="1")int
	 * cPage, @RequestParam(value="boardCategory", required=false,
	 * defaultValue="notice")String boardCategory){ log.debug("회원목록 페이지");
	 * 
	 * final int numPerPage = 10;
	 * 
	 * //업무로직 처리 List<Board> boardList = adminService.selectMemberList(cPage,
	 * numPerPage, boardCategory);
	 * 
	 * log.debug("boardList{}="+boardList);
	 * 
	 * return boardList;
	 * 
	 * }
	 */
	

}
