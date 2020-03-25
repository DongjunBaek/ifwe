package com.kh.ifwe.friend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.friend.model.service.FriendService;
import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.controller.MemberController;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;

import lombok.extern.slf4j.Slf4j;

@SessionAttributes(value = { "memberLoggedIn" })
@Slf4j
@Controller
@RequestMapping("/friend")
public class FriendController {

	@Autowired
	FriendService friendService;

	@PostMapping("/insertFriendRequest")
	@ResponseBody
	public Model insertFriendRequest(Model model, Friend friend, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

//		friend.setMemberId(memberId);(request.getParameterValues("memberId"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String memberId = request.getParameter("memberId");
		String memberPname = request.getParameter("memberPname");

		friend.setMemberId(memberId);
		friend.setMemberCode(memberCode);
		friend.setMemberPname(memberPname);

		int result = friendService.insertFriendRequest(friend);

		return model;
	}

	@PostMapping("/updateFriendAccept")
	@ResponseBody
	public void updateFriendAccept(Model model, Friend friend, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		/*
		 * int result = 0; // 요청을 받고, 수락일시 업데이트 아니면 딜리트 if
		 * ("Y".equals(friend.getFriendAccept())) { result =
		 * friendService.updateFriendAccept(friend); } else if
		 * ("D".equals(friend.getFriendAccept())) { result =
		 * friendService.DeleteFriendAccetp(friend); }
		 */

		
		
		
	}

//	@PostMapping("/selectFriendList")
	@GetMapping("/selectFriendList")
	@ResponseBody
	public List<Friend> SelectListFriend(Model model, Friend friend, int memberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		List<Friend> list = friendService.selectListFriend(memberCode);

		model.addAttribute("list", list);

		return list;

		
		
		
		
		
		
	}
	
	/*
	 * @GetMapping("/findProfile")
	 * 
	 * @ResponseBody public List<Profile> selectListFindProfile(Model model, Friend
	 * friend, int profileMemberCode, HttpServletRequest request, RedirectAttributes
	 * redirectAttributes){
	 * 
	 * List<Profile> list = new ArrayList<Profile>();
	 * 
	 * // list = friendService.selectListProfile(profileMemberCode);
	 * 
	 * model.addAttribute("list",list); return list; }
	 */
		
}
