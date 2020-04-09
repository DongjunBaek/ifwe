package com.kh.ifwe.friend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.friend.model.service.FriendService;
import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.FriendList;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Message;
import com.kh.ifwe.member.model.vo.Profile;
import com.kh.ifwe.profile.model.service.ProfileService;
import com.kh.ifwe.profile.model.vo.FriendProfile;

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
@Autowired
	ProfileService profileservice;
@Autowired	
MemberService memberservice;

//	@PostMapping("/selectFriendList")
	@GetMapping("/selectFriendList")
	@ResponseBody
	public 	List<FriendProfile>  SelectListFriend(Model model, Friend friend, int memberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		List<FriendProfile> FPList= new ArrayList<FriendProfile>();
		List<FriendList> Friendlist = friendService.selectListFriend(memberCode);

		model.addAttribute("FriendList", Friendlist);
		List<Profile> profileList = new ArrayList<Profile>();
		Profile pro = new Profile();

	FriendProfile	FP= new FriendProfile();
		
		
		System.out.println("listSize"+Friendlist.size());
		
		for (int i = 0; i < Friendlist.size(); i++) {
			Member member=	memberservice.selectOne( Friendlist.get(i).getMemberId());
				
				
			pro = profileservice.selectOneProfileWithCode(member.getMemberCode());
			
			
			FP.setMemberCode(Friendlist.get(i).getMemberCode());		
			FP.setMemberId(Friendlist.get(i).getMemberId());	
			FP.setMemberPname(Friendlist.get(i).getMemberPname());
			FP.setProfileAge(pro.getProfileAge());
			FP.setProfileComment(pro.getProfileComment());
			FP.setProfileGender(pro.getProfileGender());
			FP.setProfileImgOri(pro.getProfileImgOri());
			FP.setProfileImgRe(pro.getProfileImgRe());
			FP.setProfilememberCode(pro.getMemberCode());
			FP.setProfileName(pro.getProfileName());
			FPList.add(FP);
		}

		model.addAttribute("FriendProfile", profileList);

		return FPList;

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
	
	//0409형철 메세지기능
	@GetMapping("/msgList.do")
	@ResponseBody
	public List<Message> msgList(@RequestParam("friendCode") int friendCode,
								 @RequestParam("memberCode") int memberCode){
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("friendCode", friendCode);
		param.put("memberCode", memberCode);
		
		List<Message> messageList = friendService.selectMsgList(param);
		
		log.debug("messageList={}",messageList);
		
		return messageList;
	}
	
	@PostMapping("/insertfriendmsg.do")
	@ResponseBody
	public int insertfriendmsg(Message message) {
	
		int result = friendService.insertMsgSend(message);
		log.debug("result=",result);
		
		return result;
	}
	
	@PostMapping("/updatefriendmsg.do")
	@ResponseBody
	public int updatefriendmsg(@RequestParam("msgCode") int msgCode) {
		
		int result = friendService.updateMsg(msgCode);
		
		return result;
	}
	

}
