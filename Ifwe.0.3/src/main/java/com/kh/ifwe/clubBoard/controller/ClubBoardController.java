package com.kh.ifwe.clubBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.club.controller.ClubController;
import com.kh.ifwe.clubBoard.model.service.ClubBoardService;
import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;
import com.kh.ifwe.common.util.Utils;

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
		
		
		
		//게시판에 맞는 글 목록 
		List<ClubBoard> clubBoardListboard = clubBoardService.selectClubBoardList(clubBoardlistNo);
		
		List<BoardImg> boardNo = clubBoardService.selectClubBoardNo(clubBoardlistNo);
		List<BoardImg> boardImg = null;
		
		if(boardNo!=null && !boardNo.isEmpty() && boardNo.size()!=0) {
			boardImg = clubBoardService.selectClubBoardImg(boardNo);
		}
		
		
		log.debug("cb = {}",cb);
		log.debug("clubBoardList = {}",clubBoardListboard);
		log.debug("boardImg = {}",boardImg);
		
		mav.addObject("boardImg",boardImg);
		mav.addObject("clubBoardListboard", clubBoardListboard);
		mav.addObject("cb", cb);
		mav.setViewName("club/clubFreeBoard");
		
		return mav;
	}
	
	
	@PostMapping("/clubInsertBoardFrm")
	public ModelAndView clubInsertBoardFrm(ModelAndView mav,ClubBoard clubBoard,@RequestParam(value="summernote-images", required = false)String[] summernoteImages,
										   @RequestParam(value="summernote-images-re", required = false) String[] summernoteImagesRe) {
		
		log.debug("board = {}",clubBoard);
//		log.debug("summernote-images = {}",summernoteImages[0]);
		
		
		
		
		int result = clubBoardService.insertBoard(clubBoard);
		
		
		int clubCode = clubBoard.getClubCode();
		Map<String, Object> param  = new HashMap<String, Object>();
		log.debug("boardNp = {}",clubBoard.getBoardNo());
		param.put("clubCode", clubCode);
		param.put("boardNo", clubBoard.getBoardNo());
		
		int imageResult =0;
		
		
		if(summernoteImages != null) {
			
			for(int i = 0; i<summernoteImages.length;i++) {
				param.put("summernoteImagesRe", summernoteImagesRe[i].trim());
				param.put("summernoteImages", summernoteImages[i].trim());
				log.debug("param = {}",param);
				imageResult = clubBoardService.insertBoardImages(param);
			}
			
			if(imageResult >0) {
				int updateresult = clubBoardService.updateBoardImg(clubBoard.getBoardNo());
			}
			
		}
		
		if (result > 0) {
			log.debug("Board @ insertBoard.do : 글 등록 성공");
		}else
			log.debug("Board @ insertBoard.do : 글 등록 실패");
		
		mav.setViewName("redirect:/club/clubMain.do?clubCode="+clubCode); 
		
		return mav;
		
	}
	
	@PostMapping("/insertBoardImg.do")
	@ResponseBody
	public List<String> insertBoardImg(@RequestParam("file") MultipartFile file, HttpServletRequest request){
		
		
		List<String> list = new ArrayList<String>();
		//파일명 재생성
		String originalFileName = file.getOriginalFilename();
		String renamedFileName = Utils.getRenamedFileName(originalFileName);
		
		//파일 이동 경로 /resources/upload/admin/board
		String saveDirectory = request.getServletContext().getRealPath("/resources/upload/club/boardImg");
		
		//파일 생성.
		try {
			file.transferTo(new File(saveDirectory, renamedFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		list.add(originalFileName);
		list.add(renamedFileName);
		list.add("../resources/upload/club/boardImg/"+renamedFileName);
		
		log.debug("insertBoardImg login end {}",list);
		return list;
	}
	
	
	@ResponseBody
	@GetMapping("/selectBoardImg.do")
	public List<BoardImg> selectBoardImg(@RequestParam("boardNo") int boardNo) {
		
		List<BoardImg> boardImg = clubBoardService.selectBoardImgajax(boardNo);
		
		
		return boardImg;
	}
	
	
	

}
