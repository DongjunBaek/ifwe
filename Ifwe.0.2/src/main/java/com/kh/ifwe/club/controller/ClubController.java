package com.kh.ifwe.club.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClubController {

	@GetMapping("/club/clubSearch.do")
	public String clubSearch() {
		return "main/clubSearch";
	};
	
	@GetMapping("/club/clubCreate.do")
	public String clubCreate() {
		return "main/clubCreate";
	};
	
	@GetMapping("/club/clubMain.do")
	public String clubMain() {
		return "club/clubMain";
	}
	
	
	
	
	
	
	
	
	
	
}
