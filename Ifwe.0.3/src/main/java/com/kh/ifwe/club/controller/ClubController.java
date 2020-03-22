package com.kh.ifwe.club.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.club.model.service.ClubService;
import com.kh.ifwe.club.model.vo.Club;
import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.common.util.Utils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	

	@GetMapping("/clubSearch.do")
	public String clubSearch() {
		return "main/clubSearch";
	};
	
	@GetMapping("/clubCreate.do")
	public String clubCreate() {
		return "main/clubCreate";
	};
	
	//0320형철 소모임생성
	@PostMapping("/clubCreate.do")
	public ModelAndView Create(@RequestParam("category") String category,
							   ModelAndView mav,Club club,
							   RedirectAttributes redirectAttributes,
							   @RequestParam(value="clubTitleFileUpload",required=false)
							   MultipartFile upFile) {
		
		
		log.debug("club={}",club);
		
		try {
	    		
	    		if(f.isEmpty()) continue;
	    		
	//    	log.debug("filename={}",f.getOriginalFilename());
	//    	log.debug("size={}",f.getSize());
	    		
	    		//파일명 재생성 renamedFileName으로 저장하기
	    		String originalFileName = f.getOriginalFilename();
	    		String renamedFileName = Utils.getRenamedFileName(originalFileName);
	    		
	    		//파일이동
	    		String saveDirectory = request.getServletContext().getRealPath("/resources/upload/board");
	    		try {
					f.transferTo(new File(saveDirectory,renamedFileName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		
	    		
	    		//실제 파일데이터 originalFfileName, renamedFileName을 db에 저장
	    		//Attachment객체
	    		Attachment attach = new Attachment();
	    		attach.setOriginalFileName(originalFileName);
	    		attach.setRenamedFileName(renamedFileName);
	    		
	    		attachList.add(attach);
	    		
	    	log.debug("attachList={}",attachList);
	    	
	    	int result = boardService.insertBoard(board,attachList);
	    	
	    	redirectAttributes.addFlashAttribute("msg",result>0?"등록성공!":"등록실패...");
    	
    	
    	}catch(Exception e) {
    		log.error("게시판등록오류!",e);
    		
    		throw new BoardException("게시판등록오류! 관리자에게문의하세요",e);
    	}
		
		
		
		
		
		
		
		
		return mav;
	}
	
	
	
	
	@GetMapping("/clubMain.do")
	public String clubMain() {
		return "club/clubMain";
	}
	
	@RequestMapping("/insert.do")
	public ModelAndView insert(ModelAndView mav) {
		
		mav.setViewName("club/clubEnrollSuccess");
		
		return mav;
	}
	
	@GetMapping("/enroll.do")
	public ModelAndView enroll(ModelAndView mav) {
		
		mav.setViewName("club/clubEnroll");
		
		return mav;
	}
	
	@GetMapping("/calendar.do")
	public String calendar() {
		return "club/clubcalendar";
	}
	
	@GetMapping("/notice.do")
	public String notice() {
		return "club/clubNotice";
	}
	
	@GetMapping("/freeboard.do")
	public String freeboard() {
		return "club/clubFreeBoard";
	}
	
	
	
}
