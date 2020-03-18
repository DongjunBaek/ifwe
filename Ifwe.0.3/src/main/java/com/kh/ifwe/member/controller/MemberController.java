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
	
<<<<<<< HEAD
	@GetMapping("/profile.do")
	public String frofile() {
=======
	@GetMapping("/member/profile.do")
	public String profile() {
>>>>>>> master
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
	
<<<<<<< HEAD
	@GetMapping("/membeoswib.do")
	public String membeoswib() {
		return "member/membeoswib";
=======
	@GetMapping("/member/membership.do")
	public String membership() {
		return "member/membership";
>>>>>>> master
	}
	
	
	
	
}
