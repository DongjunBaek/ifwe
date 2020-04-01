package com.kh.ifwe.mian.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.admin.model.service.AdminService;
import com.kh.ifwe.admin.model.vo.AdminEvent;
import com.kh.ifwe.club.model.service.ClubService;

import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.MemberLoggedIn;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes(value={"msgCount"})
public class Maincontroller {
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/main/mainPage.do")
	public String mainPage(@ModelAttribute("memberLoggedIn") Member member,RedirectAttributes redirectAttributes,
							Model model) {
		
		/*
		 * log.
		 * debug("메인페이지 들어옴 뿌려줄 거  = 내 소모임 목록, 이란 소모임은 어때요 (내 관심사에 맞는 소모임 뿌려주기), 주간베스트 글"
		 * ); log.debug("memberLoggedId = {}", member);
		 */
		//내 소모임 목록
		//List<Club> clubList = clubService.selectClubList();
		MemberLoggedIn memberLoggedIn = memberService.selectMemberLogin(member.getMemberCode());
		int msgCount = memberService.selectMsgCount(member.getMemberCode());
		log.debug("msgCount={}",msgCount);
		
		model.addAttribute("msgCount",msgCount);
		model.addAttribute("memberLoggedIn",memberLoggedIn);
		
		

 

		return "main/mainPage";
	}

	
	@GetMapping("/index/mainpage.do")
	public String index() {
		return "redirect:/";
	}
	
}
