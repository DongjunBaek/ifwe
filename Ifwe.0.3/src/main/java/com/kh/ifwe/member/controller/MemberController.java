package com.kh.ifwe.member.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@SessionAttributes(value = {"memberLoggedIn"})
@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
//	@GetMapping("/member/memberenroll.do")
//	public String memberEnroll() {
//		
//		return "member/memberenroll";
//	}
	
	@GetMapping("/enroll.do")
	public String selectCate() {
		return "member/memberenroll";
	}
	
	@PostMapping("/enroll.do")
	public ModelAndView insertMember(ModelAndView mav,Member member,
							   HttpServletRequest request,
							   RedirectAttributes redirectAttributes) {
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		
		String rawPass = member.getMemberPwd();
		String bcryptPassword = bcryptPasswordEncoder.encode(rawPass);
		
		String birthday = "";
		String strMonth = "";
		
		if(month<10) {
			strMonth = "0"+month;
		}else {
			strMonth = ""+month;
		}
		
		birthday = year+"-"+strMonth+"-"+day;
		Date d = Date.valueOf(birthday);
		
		member.setMemberPwd(bcryptPassword);
		member.setMemberBirth(d);
		log.debug("member={}",member);
		
		int result = memberService.insertMember(member);
		log.debug("result@insert=",result);
		
		String msg = "";
		if(result >0) {
			msg = "회원가입 성공!! 로그인해주세요";
		}else {
			msg = "회원가입실패";
		}
	
		
		
		redirectAttributes.addFlashAttribute("msg",msg);
		mav.setViewName("redirect:/");
		
		
		return mav;
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam("memberId") String memberId,
					    @RequestParam("password") String password,
					    Model model,
					    RedirectAttributes redirectAttributes) {
		try {
			
			log.debug(password);
			
			
			//로그인 처리
			//1.memberId로 member 객체 조회
			Member member = memberService.selectOne(memberId);
			log.debug("member@selectone={}",member);
			
			//2.member.password와 사용자가 입력한 password를 비교해서 로그인처리
			//bcryptPasswordEncoder를 이용한 비교
			//로그인한 경우, session에 member객체 저장
			if(member != null && 
					bcryptPasswordEncoder.matches(password, member.getMemberPwd())) {
				model.addAttribute("memberLoggedIn", member);
				
				return "main/mainPage";
				
			}
			else {
				//로그인 실패
				redirectAttributes.addFlashAttribute("msg", "입력한 아이디 또는 비밀번호가 일치하지 않습니다.");
			}
		
		
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		return "redirect:/";
	}
	
	
	
	
	@GetMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	

	@GetMapping("/profile.do")
	public String profile() {

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
	

	@GetMapping("/membership.do")
	public String membership() {
		return "member/membership";

	}
	
	
	
	
}
