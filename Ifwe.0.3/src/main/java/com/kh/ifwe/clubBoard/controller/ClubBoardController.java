package com.kh.ifwe.clubBoard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ifwe.club.controller.ClubController;
import com.kh.ifwe.clubBoard.model.service.ClubBoardService;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/clubboard")
@Controller
public class ClubBoardController {

	@Autowired
	private ClubBoardService clubBoardService;
	
	@PostMapping("/insertlist.do")
	public ModelAndView insertList(ModelAndView mav,
								   @RequestParam("clubCode") int clubCode,
								   @RequestParam("boardTitleList") String[] boardTitleList,
								   HttpServletRequest request) {
		
		
		if(boardTitleList[0]!=null) {
			for(int i=0; i<boardTitleList.length; i++) {
				
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("clubCode", clubCode);
				param.put("boardTitleList", boardTitleList[i]);
				
				int result = clubBoardService.insertboardList(param);
			}
		}
			
		
		mav.setViewName("redirect:/club/clubMain.do?clubCode="+clubCode);
		
		
		return mav;
	}
	
	
	@GetMapping("/freeboard.do")
	public String freeboard() {
		return "club/clubFreeBoard";
	}
	
	
}
