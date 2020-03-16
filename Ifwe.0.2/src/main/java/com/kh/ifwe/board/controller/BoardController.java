package com.kh.ifwe.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@GetMapping("/board/insertBoard.do")
	public String insertBoard() {
		return "board/insertBoard";
	}
}
