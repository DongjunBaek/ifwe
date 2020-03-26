package com.kh.ifwe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.admin.model.service.AdminService;
import com.kh.ifwe.board.model.vo.Board;
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
	
	@GetMapping("/event.do")
	public String event() {
		return "admin/adminEvent";
	}
	
}
