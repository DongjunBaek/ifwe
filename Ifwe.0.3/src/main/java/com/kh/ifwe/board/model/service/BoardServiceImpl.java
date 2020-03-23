package com.kh.ifwe.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.ifwe.board.model.dao.BoardDAO;
import com.kh.ifwe.board.model.vo.Board;

/**
 * 0321 insert board 
 * 게시판 service class 작성. 
 * @author dongjun
 *
 */

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public int insertBoard(Board board) {
		return boardDAO.insertBoard(board);
	}
	
	
}
