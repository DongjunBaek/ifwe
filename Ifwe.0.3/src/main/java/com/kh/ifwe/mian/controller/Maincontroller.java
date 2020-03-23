package com.kh.ifwe.mian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Maincontroller {
	
	@GetMapping("/main/mainPage.do")
	public String mainPage() {
		return "main/mainPage";
	}

	
	@GetMapping("/index/mainpage.do")
	public String index() {
		return "redirect:/";
	}
	
}
