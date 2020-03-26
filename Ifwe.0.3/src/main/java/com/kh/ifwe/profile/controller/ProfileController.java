package com.kh.ifwe.profile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;
import com.kh.ifwe.profile.model.service.ProfileService;

import lombok.extern.slf4j.Slf4j;

@SessionAttributes(value = { "memberLoggedIn" })
@Slf4j
@Controller
@RequestMapping("/profile")
public class ProfileController {
	@Autowired
	ProfileService profileservice;

	@GetMapping("/findProfileList")
	@ResponseBody
	public List<Profile> selectListProfile(Model model, Friend friend, int profileMemberCode,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {

		List<Profile> list = new ArrayList<Profile>();

		list = profileservice.selectListProfile(profileMemberCode);

		model.addAttribute("list", list);
		return list;
	}
	
	
	

	
	
	

	@GetMapping("/findProfile")
	@ResponseBody
	public Profile selectOneProfile(Model model, Friend friend, int profileMemberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		Profile profile = profileservice.selectOneProfile(profileMemberCode);

		return profile;
	}

	
	
	@GetMapping("/profileview.do")
	public String profile(Model model, int profileMemberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		Profile profile =  profileservice.selectOneProfile(profileMemberCode);

		
		model.addAttribute("profile",profile);


		Member member = memberService.memberSelectOneCode(profileMemberCode);
		
		model.addAttribute("member",member);
		
		
		
		
		return "member/profile";
	}
	
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/memberSelectOne")
	public Member memberSelectOne(Model model, int profileMemberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		Member member = memberService.memberSelectOneCode(profileMemberCode);
		return member;
	}
	
	
	
	
	
	
	
	
}

