package com.kh.ifwe.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
//	@GetMapping("/member/memberenroll.do")
//	public String memberEnroll() {
//		
//		return "member/memberenroll";
//	}
	
	@GetMapping("/enroll.do")
	public String selectCate() {
		return "member/memberenroll";
	}
	
	@GetMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@GetMapping("/profile.do")
	public String frofile() {
		return "member/profile";
	}
	
	@GetMapping("/profileUpdate.do")
	public String profileUpdate() {
		return "member/profileUpdate";
	}
	
	
	
	@GetMapping("/update.do")
	public String update() {
		return "member/update";
	}
	
	@GetMapping("/membeoswib.do")
	public String membeoswib() {
		return "member/membeoswib";
	}
	
	
	
	
}
