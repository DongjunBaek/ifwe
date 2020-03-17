package com.kh.ifwe.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@GetMapping("/member/memberenroll.do")
	public String memberEnroll() {
		
		return "member/memberenroll";
	}
	
	@GetMapping("/member/selectcate.do")
	public String selectCate() {
		return "member/selectCategory";
	}
	
	@GetMapping("/member/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@GetMapping("/member/profile.do")
	public String frofile() {
		return "member/profile";
	}
	
	@GetMapping("/member/profileUpdate.do")
	public String profileUpdate() {
		return "member/profileUpdate";
	}
	
	
	
	@GetMapping("/member/update.do")
	public String update() {
		return "member/update";
	}
	
	@GetMapping("/member/membeoswib.do")
	public String membeoswib() {
		return "member/membeoswib";
	}
	
	
	
	
}
