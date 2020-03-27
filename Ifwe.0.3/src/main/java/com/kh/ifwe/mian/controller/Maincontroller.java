package com.kh.ifwe.mian.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kh.ifwe.club.model.service.ClubService;
import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.member.controller.MemberController;
import com.kh.ifwe.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Maincontroller {
	
	@Autowired
	private ClubService clubService;
	
	@GetMapping("/main/mainPage.do")
	public String mainPage(@ModelAttribute("memberLoggedIn") Member member) {
		
		log.debug("메인페이지 들어옴 뿌려줄 거  = 내 소모임 목록, 이란 소모임은 어때요 (내 관심사에 맞는 소모임 뿌려주기), 주간베스트 글");
		log.debug("memberLoggedId = {}", member);
		//내 소모임 목록
		//List<Club> clubList = clubService.selectClubList();
		
		
		
		
		
		return "main/mainPage";
	}

	
	@GetMapping("/index/mainpage.do")
	public String index() {
		return "redirect:/";
	}
	
}
