package com.kh.ifwe.clubBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.club.controller.ClubController;
import com.kh.ifwe.clubBoard.model.service.ClubBoardService;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/clubboard")
@Controller
@SessionAttributes(value= {"cb"})
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
	public ModelAndView freeboard(@RequestParam(value = "clubBoardlistNo", required=false )int clubBoardlistNo,ModelAndView mav) {
		log.debug("clubBoardlistNo = {}",clubBoardlistNo);
		
		ClubBoard cb = clubBoardService.selectClubBoard(clubBoardlistNo);
		log.debug("cb = {}",cb);
		
		
		
		//게시판에 맞는 글 목록 
		List<ClubBoard> clubBoardListboard = clubBoardService.selectClubBoardList(clubBoardlistNo);
		log.debug("clubBoardList = {}",clubBoardListboard);
		
		mav.addObject("clubBoardListboard", clubBoardListboard);
		mav.addObject("cb", cb);
		mav.setViewName("club/clubFreeBoard");
		
		return mav;
	}
	
	
	@PostMapping("/clubInsertBoardFrm")
	public ModelAndView clubInsertBoardFrm(ModelAndView mav,ClubBoard clubBoard,@RequestParam("summernote-images")String[] summernoteImages,@RequestParam("summernote-images-re") String[] summernoteImagesRe) {
		
		log.debug("board = {}",clubBoard);
		log.debug("summernote-images = {}",summernoteImages[0]);
		
		
		
		
		int result = clubBoardService.insertBoard(clubBoard);
		
		
		int clubCode = clubBoard.getClubCode();
		Map<String, Object> param  = new HashMap<String, Object>();
		log.debug("boardNp = {}",clubBoard.getBoardNo());
		param.put("clubCode", clubCode);
		param.put("boardNo", clubBoard.getBoardNo());
		for(int i = 0; i<summernoteImages.length;i++) {
			param.put("summernoteImagesRe", summernoteImagesRe[i]);
			param.put("summernoteImages", summernoteImages[i]);
			log.debug("param = {}",param);
			int imageResult = clubBoardService.insertBoardImages(param);
		}
		
		if (result > 0) {
			log.debug("Board @ insertBoard.do : 글 등록 성공");
		}else
			log.debug("Board @ insertBoard.do : 글 등록 실패");
		
		mav.setViewName("/club/clubMain"); 
		
		return mav;
		
	}

}
