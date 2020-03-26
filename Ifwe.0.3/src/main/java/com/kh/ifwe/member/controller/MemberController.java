package com.kh.ifwe.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.member.model.service.MemberService;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;
import com.kh.ifwe.profile.model.service.ProfileService;

import lombok.extern.slf4j.Slf4j;

@SessionAttributes(value = { "memberLoggedIn","profile" })
@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProfileService profileService;

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
	public ModelAndView insertMember(ModelAndView mav, Member member, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));

		String rawPass = member.getMemberPwd();
		String bcryptPassword = bcryptPasswordEncoder.encode(rawPass);

		String birthday = "";
		String strMonth = "";

		if (month < 10) {
			strMonth = "0" + month;
		} else {
			strMonth = "" + month;
		}

		birthday = year + "-" + strMonth + "-" + day;
		Date d = Date.valueOf(birthday);

		member.setMemberPwd(bcryptPassword);
		member.setMemberBirth(d);
		log.debug("member={}", member);

		int result = memberService.insertMember(member);
		log.debug("result@insert=", result);

		String msg = "";
		if (result > 0) {
			msg = "회원가입 성공!! 로그인해주세요";
		} else {
			msg = "회원가입실패";
		}


		
		Member serchMember = memberService.selectOne(member.getMemberId());
		
		
		int insertProfileResult =memberService.insertProfile(serchMember); 
		
		redirectAttributes.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/");

		return mav;
	}

	
	
	
	@PostMapping("/login.do")
	public String login(@RequestParam("memberId") String memberId, @RequestParam("password") String password,
			Model model, RedirectAttributes redirectAttributes,
			@RequestParam(value = "saveid", required = false) String isStored, HttpServletResponse response) {
		try {
			log.debug(password);

			// 0320 dongjun 아이디 저장 구현 코드
			// isStored == true
			if ("on".equals(isStored)) {
				// create cookie
				Cookie storedCookie = new Cookie("storedCookie", memberId);
				// cookie setting
				storedCookie.setPath("/ifwe"); // only in index page
				storedCookie.setMaxAge(60 * 60 * 24 * 30); // 7 days
				response.addCookie(storedCookie);
			} else {
				Cookie storedCookie = new Cookie("storedCookie", "");
				storedCookie.setPath("/ifwe"); // only in index page
				storedCookie.setMaxAge(0); // 7 days
				response.addCookie(storedCookie);
			}

			// 로그인 처리
			// 1.memberId로 member 객체 조회
			Member member = memberService.selectOne(memberId);
			log.debug("member@selectone={}", member);

			// 2.member.password와 사용자가 입력한 password를 비교해서 로그인처리
			// bcryptPasswordEncoder를 이용한 비교
			// 로그인한 경우, session에 member객체 저장
			if (member != null && bcryptPasswordEncoder.matches(password, member.getMemberPwd())) {
				
				model.addAttribute("memberLoggedIn", member);
				Profile profile = profileService.selectOneProfileWithCode(member.getMemberCode());
				log.debug("profile = {}",profile);
				model.addAttribute("profile",profile);
				
				return "main/mainPage";

			} else {
				// 로그인 실패
				redirectAttributes.addFlashAttribute("msg", "입력한 아이디 또는 비밀번호가 일치하지 않습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return "redirect:/";
	}

	// 문보라로그아웃구현
	@GetMapping("/logout.do")
	public String logout(SessionStatus sessionStatus, @ModelAttribute("memberLoggedIn") Member member) {

		log.debug("[" + member.getMemberId() + "]가 로그아웃했습니다.");

		if (!sessionStatus.isComplete())
			sessionStatus.setComplete();

		return "redirect:/";
	}

//	@GetMapping("/mypage.do")
//	public String mypage(@ModelAttribute("memberLoggedIn") Member member) {
//		
//		return "member/mypage";
//	}

	// 문보라
	@GetMapping("/mypage.do")
	public void mypage(@RequestParam("memberId") String memberId) {

	}

	@GetMapping("/profile.do")
	public String profile() {

		return "member/profile";
	}

	
	@GetMapping("/update.do")
	public ModelAndView update(ModelAndView mav) {
		
		
		mav.setViewName("member/update");
		
		return mav;
	}

	@GetMapping("/membership.do")
	public String membership(@RequestParam("memberCode") String memberCode,
								Model model) {
		List<Club> list = memberService.selectClubList(memberCode);
		
		log.debug("list = {}" ,list);
		
		model.addAttribute("list", list);
		
		return "member/membership";

	}

	// 03.21 문보라 프로필 수정 버튼 클릭 -> 프로필수정하는 폼
	@GetMapping("/updateProfile.do")
	public String updateProfile() {
		return "member/profileUpdate";
	}

	// 문보라 비밀번호 변경 뷰단
	@GetMapping("/updatePassword.do")
	public String updatePassword() {

		return "member/updatePassword";

	}

	// 03.21 문보라 비밀번호 변경
	@PostMapping("/updatePasswordFrm.do")
	public String updatePasswordFrm(@RequestParam("password-old") String password_old,
			@RequestParam("password-new") String password_new,
			@RequestParam("password-new-chk") String password_new_chk, @RequestParam("memberId") String memberId,
			RedirectAttributes redirectAttributes) {

		String msg = "";
		Member member = memberService.selectOne(memberId);
		log.debug("member = {}", member);

		// 현재 비밀번호와 입력한 비밀번호가 맞을 때
		if (bcryptPasswordEncoder.matches(password_old, member.getMemberPwd())) {
			String bcryptPassword = bcryptPasswordEncoder.encode(password_new);
			member.setMemberPwd(bcryptPassword);
			int result = memberService.updatePassword(member);

			if (result > 0) {
				msg = "비밀번호가 변경되었습니다.";
			} else {
				msg = "비밀번호가 번경되지않았습니다.";
			}

		} else {
			log.debug("일치하지 않음");
			msg = "현재비밀번호가 일치하지 않습니다.";
		}

		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/member/update.do";
	}

	// 문보라 이메일 전화번호 변경 뷰단
	@GetMapping("/updateEmailPhone.do")
	public String updateEmailPhone() {

		return "member/updateEmailPhone";
	}

	// 핸드폰 번호 변경 POPUP 문보라
	@GetMapping("/updatePhonePUPUP.do")
	public String updatePhonePOPUP() {

		return "member/updatePhonePOPUP";
	}

	// 문보라 핸드폰 번호 변경
	@PostMapping("/updatePhoneFrm.do")
	public ModelAndView updatePhone(@RequestParam("member_phone") String member_phone,
			@RequestParam("memberId") String memberId, ModelAndView mav, String close) {

		log.debug("memberId = {}", memberId);
		log.debug("memberPhone = {}", member_phone);

		String msg = "";
		Member member = memberService.selectOne(memberId);
		log.debug("member = {}", member);

		member.setMemberPhone(member_phone);

		log.debug("member = {}", member);

		int result = memberService.updatePhone(member);

		log.debug("reslt = {}", result);
		if (result > 0) {
			msg = "전화번호가 변경되었습니다.";
			mav.addObject("memberLoggedIn", member);
		} else {
			msg = "전화번호가 번경되지않았습니다.";
		}

		close = "close";
		mav.addObject("msg", msg);
		mav.setViewName("/member/updateEmailPhone");
		mav.addObject("close", close);

		log.debug("mav = {}", mav);
		return mav;
	}

	// 0322 이메일 변경 팝업창 문보라
	@GetMapping("/updateEmailPOPUP.do")
	public String updatEmailPOPUP() {

		return "member/updateEmailPOPUP";
	}

	// 0322 이메일 변경 문보라
	@PostMapping("/updateEmailFrm.do")
	public ModelAndView updateEmail(@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberId") String memberId, RedirectAttributes redirectAttributes, ModelAndView mav,
			String close) {

		log.debug("memberId = {}", memberId);
		log.debug("memberEmail = {}", memberEmail);

		String msg = "";
		Member member = memberService.selectOne(memberId);
		log.debug("member = {}", member);

		member.setMemberEmail(memberEmail);

		log.debug("member = {}", member);

		int result = memberService.updateEamil(member);

		log.debug("reslt = {}", result);
		if (result > 0) {
			msg = "이메일 주소가 변경되었습니다.";
			mav.addObject("memberLoggedIn", member);
		} else {
			msg = "이메일 주소가 번경되지않았습니다.";
		}

		close = "close";
		mav.addObject("msg", msg);
		mav.setViewName("/member/updateEmailPhone");
		mav.addObject("close", close);

		log.debug("mav = {}", mav);
		return mav;
	}

	// 회원탈퇴 문보라
	@GetMapping("/deleteMember.do")
	public String deletMember() {

		return "member/deleteMember";

	}

	// 회원탈퇴처리 문보라
	@PostMapping("/deleteForm.do")
	public ModelAndView deleteForm(@RequestParam("memberId") String memberId, RedirectAttributes redirectAttributes,
			ModelAndView mav) {
		log.debug("memberId = {}", memberId);

		String msg = "";
		Member member = memberService.selectOne(memberId);
		log.debug("member = {}", member);

		member.setMemberRole("d");

		log.debug("member = {}", member);

		int result = memberService.deleteMember(member);

		log.debug("reslt = {}", result);
		if (result > 0) {
			msg = "회원탈퇴가 되었습니다. 그 동안 ifwe를 이용해주셔서 감사합니다.";
		} else {
			msg = "회원탈퇴가 실패하였습니다.";
		}

		redirectAttributes.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/");

		return mav;

	}

	@PostMapping("/profileUpdate.do")
	public String updatetProfile(Profile profile,
			@RequestParam(value = "upFile", required = false) MultipartFile upFile, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		try {
			log.debug("controller@profile={}", profile);

			System.out.println("프로필 카테코드" +
			// profile.getContentsCateCodes()+
					request.getParameterValues("contentsCateCodes")

			);

			if (!upFile.isEmpty()) {

				log.debug("filename={}", upFile.getOriginalFilename());
				log.debug("size={}", upFile.getSize());
				// 파일명 재생성 renamedFileName으로 저장하기
				String originalFileName = upFile.getOriginalFilename();
				String renamedFileName = com.kh.ifwe.common.util.Utils.getRenamedFileName(originalFileName);

				// 파일이동폴더
				String saveDirectory = request.getServletContext().getRealPath("/resources/upload/profile");
				try {
//						File file= new File(saveDirectory, renamedFileName);
//						log.debug("파일={}"+file);
//					file.createNewFile();
					log.debug("세이브디렉토리" + saveDirectory);
					upFile.transferTo(new File(saveDirectory, renamedFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				profile.setProfileImgOri(originalFileName);

				profile.setProfileImgRe(renamedFileName);

			}
			int result = memberService.updateProfile(profile);

			System.out.println(result);
			redirectAttributes.addFlashAttribute("msg", result > 0 ? "등록성공!" : "등록실패!");

		} catch (Exception e) {

			log.error("프로필 등록 오류!", e);

			// throw new BoardException("프로필 등록 오류! 관리자에게 문의하세요", e);
		}
		
		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
		// return "redirect:/member/profile";
		return "member/profileUpdate";
	}

	// 아이디 찾기 처리 문보라
	@PostMapping("/searchId")
	@ResponseBody
	public Member searchId(@RequestParam("memberName") String memberName, @RequestParam("birthday") String birthday,
			@RequestParam("phone") String phone, ModelAndView mav) {

		log.debug("memberName ={}", memberName);
		log.debug("birthday ={}", birthday);
		log.debug("phone ={}", phone);

		log.debug("year = {}", birthday.substring(0, 4));
		log.debug("mouth = {}", birthday.substring(4, 6));
		log.debug("day = {}", birthday.substring(6, 8));
		String birth = birthday.substring(0, 4) + "/" + birthday.substring(4, 6) + "/" + birthday.substring(6, 8);
		String phoneNum = phone + "  ";

		Map<String, String> param = new HashMap<String, String>();
		param.put("memberName", memberName);
		param.put("birth", birth);
		param.put("phone", phoneNum);

		log.debug("param ={}", param);
		Member member = memberService.searchId(param);
		log.debug("member = {}", member);

		return member;
	}

	// 비밀번호 찾기 처리 문보라
	@PostMapping("/searchPwd.do")
	@ResponseBody
	public Member searchPwd(@RequestParam("memberId") String memberId, @RequestParam("memberName_") String memberName,
			@RequestParam("birthday_") String birthday, @RequestParam("phone_") String phone, ModelAndView mav) {

		if (memberId == null)
			return null;

		log.debug("memberId ={}", memberId);
		log.debug("memberName ={}", memberName);
		log.debug("birthday ={}", birthday);
		log.debug("phone ={}", phone);

		Member member = memberService.selectOne(memberId);
		log.debug("member = {}", member);
		mav.addObject("member", member);
		log.debug("mav = {} ", mav);

		return member;

	}

	@PostMapping("/searchPwdAfter")
	public ModelAndView searchPwdAfter(@RequestParam("new-password") String password,
			@RequestParam("memberId") String memberId, RedirectAttributes redirectAttributes, ModelAndView mav) {

		log.debug("mav = {}", mav);

		log.debug("password = {}", password);
		log.debug("memberId = {}", memberId);

		Member member = memberService.selectOne(memberId);
		log.debug("member = {}", member);

		String bcryptPassword = bcryptPasswordEncoder.encode(password);
		member.setMemberPwd(bcryptPassword);
		int result = memberService.updatePassword(member);

		String msg = result > 0 ? "비밀번호가 변경되었습니다.로그인 해주세요!" : "비밀번호 변경이 실패했습니다.";
		log.debug("msg = {}", msg);

		redirectAttributes.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/");

		return mav;

	}

	@GetMapping("/memberSelectOne")
	public Member memberSelectOneCode(Model model, int memberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		Member member = memberService.memberSelectOneCode(memberCode);
		return member;
	}
	
	@PostMapping("/membershipPay.do")
	@ResponseBody
	public int membershipPay(@RequestParam("membershipName") String membershipName ,
								@RequestParam("clubCode") String clubCode,
								@RequestParam("memberCode") String memberCode) {
		log.debug("membershipName = {}",membershipName);
		log.debug("clubName = {}",clubCode);
		log.debug("memberCode = {}",memberCode);
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("membershipName", membershipName);
		map.put("clubCode", clubCode);
		map.put("memberCode", memberCode);
		
		int result = memberService.insertPre(map);
		
		
		return result;
	}


	@Autowired
	ProfileService profileservice;

	// 20200325 김원재 프로필 리다이렉트때 프로필 객체 가져가게 변경
	@GetMapping("/profileUpdate.do")
	public String profileUpdate(Model model, int memberCode, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		System.out.println("memberController 되나");
	 Profile	profile=profileservice.selectOneProfileWithCode(memberCode);
		
		model.addAttribute("profile",profile);
		return "member/profileUpdate";
	}
	
	// 2020326 아이디 중복 검사 
	@GetMapping("/checkId.do")
	@ResponseBody
	public Member checkId(@RequestParam("memberId") String memberId) {
		
		Member member = memberService.checkId(memberId);
		log.debug("member={}",member);
		
		return member;
	}

}
