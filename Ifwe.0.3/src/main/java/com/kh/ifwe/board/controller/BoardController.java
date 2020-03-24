package com.kh.ifwe.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ifwe.board.model.service.BoardService;
import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.common.util.Utils;

import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.f;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	@GetMapping("/insertBoard.do")
	public String insertBoard() {
		return "board/insertBoard";
	}
	
	
	/**
	 * 0312 동준 작업 게시판 관리
	 * @param board
	 * @param mav
	 * @return
	 */
	@PostMapping("/insertBoard.do")
	public ModelAndView insertBoard( Board board,ModelAndView mav) {
		
		int result = boardService.insertBoard(board);
		
		if (result > 0) {
			log.debug("Board @ insertBoard.do : 글 등록 성공");
		}else
			log.debug("Board @ insertBoard.do : 글 등록 실패");
		
		mav.setViewName("main/mainBoard"); // 게시글 상세 보기로 이동할 예정.
		
		return mav;
	}
	
	
	/**
	 * 0323 동준 작업
	 * 이미지 파일 업로드 메소드 
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	@PostMapping("/insertBoardImg.do")
	@ResponseBody
	public List<String> insertBoardImg(@RequestParam("file") MultipartFile file, HttpServletRequest request){
		
		
		List<String> list = new ArrayList<String>();
		//파일명 재생성
		String originalFileName = file.getOriginalFilename();
		String renamedFileName = Utils.getRenamedFileName(originalFileName);
		
		//파일 이동 경로 /resources/upload/admin/board
		String saveDirectory = request.getServletContext().getRealPath("/resources/upload/admin/board");
		
		//파일 생성.
		try {
			file.transferTo(new File(saveDirectory, renamedFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		list.add(originalFileName);
		list.add(renamedFileName);
		list.add("../resources/upload/admin/board/"+renamedFileName);
		
		log.debug("insertBoardImg login end {}",list);
		return list;
	}
	
	
	
	/**
	 * 0324 동준 작업 게시판 목록 조회
	 * 
	 * @param mav
	 * @return
	 */
	@GetMapping("/mainBoard.do")
	public ModelAndView mainBoard(ModelAndView mav) {
		
		List<Board> boardList = boardService.selectOne("notice");
		
		log.debug("mainBoard @ boardController {}", boardList);
		mav.addObject("boardList", boardList);
		mav.setViewName("main/mainBoard");
		
		return mav;
	}
	
	@GetMapping("/mainBoardList.do")
	@ResponseBody
	public List<Board> mainBoardList(ModelAndView mav, @RequestParam( 
																value = "boardCategory",
																required = false, 
																defaultValue = "notice") String boardCategory) {
		log.debug("boardCategory = ",boardCategory);
		List<Board> boardList = boardService.selectOne(boardCategory);
		
		log.debug("mainBoardList @ boardController {}", boardList);
		
		
		return boardList;
	}
	
	@GetMapping("/boardDetail")
	public ModelAndView boardDetail(ModelAndView mav, @RequestParam(value="boardNo", required= true, defaultValue = "1") int boardNo) {
		log.debug("boardNo {}",boardNo);
		
		Board board = boardService.selectBoardDetail(boardNo);
		/**
		 * 이곳에 이미지 첨부 사용 할 것.
		 */
		mav.addObject("board",board);
		mav.setViewName("board/boardDetail");
		
		return mav;
	}
}
