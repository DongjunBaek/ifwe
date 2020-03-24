package com.kh.ifwe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.admin.model.service.AdminService;
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
	public ModelAndView member(@RequestParam(value="cPage",defaultValue="1")int cPage) {
		log.debug("회원목록 페이지");
		
		ModelAndView mav = new ModelAndView();
		
		final int numPerPage = 10;
		
		//업무로직 처리
		List<Member> list = adminService.selectMemberList(cPage, numPerPage);
		log.debug("list="+list);
		
		mav.addObject("list",list);
		mav.setViewName("admin/adminMember");
		
		return mav;
	}
	
	@GetMapping("/dropMember.do")
	public ModelAndView dropMember(@RequestParam(value="cPage",defaultValue="1")int cPage) {
		
		log.debug("탈퇴회원 페이지");
	
		ModelAndView mav = new ModelAndView();
		
		final int numPerPage = 10;
		
		//업무로직 처리
		List<Member> dropList = adminService.selectDropMemberList(cPage, numPerPage);
		log.debug("dropList{}=",dropList);
		
		mav.addObject("dropList",dropList);
		mav.setViewName("admin/adminMember");
		
		return mav;
	}
	
	@GetMapping("/dormantMember.do")
	public ModelAndView dormantMember(@RequestParam(value="cPage", defaultValue="1")int cPage) {
		log.debug("휴면회원 페이지");
	
		ModelAndView mav = new ModelAndView();
		
		final int numPerPage = 10;
		
		//업무로직 처리
		List<Member> dormantList = adminService.selectDormantMemberList(cPage, numPerPage);
		log.debug("dormantList{}=",dormantList);
		
		mav.addObject("dormantList",dormantList);
		mav.setViewName("admin/adminMember");
			
		return mav;
	}
	
	@GetMapping("/cancel.do")
	public String cancel(@RequestParam("memberCode") int memberCode, RedirectAttributes redirectAttributes) {
		
		Member member = adminService.selectOne(memberCode);
		log.debug("member{}=",member);
		
		int result = adminService.cancelMember(member,memberCode);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"변경성공":"변경실패");
		
		return "/admin/adminMember";
	}
	
	
	@GetMapping("/notice.do")
	public String notice() {
		
		return "admin/adminNotice";
	}
	
	@GetMapping("/event.do")
	public String event() {
		return "admin/adminEvent";
	}
	
}
