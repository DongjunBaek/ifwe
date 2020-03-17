package com.kh.ifwe.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminStatistics";
	}
	
	@GetMapping("/admin/statistics.do")
	public String statistics() {
		return "admin/adminStatistics";
	}
	
	@GetMapping("/admin/member.do")
	public String member() {
		return "admin/adminMember";
	}
	
	@GetMapping("/admin/notice.do")
	public String notice() {
		return "admin/adminNotice";
	}
	
	@GetMapping("admin/event.do")
	public String event() {
		return "admin/adminEvent";
	}
	
}
