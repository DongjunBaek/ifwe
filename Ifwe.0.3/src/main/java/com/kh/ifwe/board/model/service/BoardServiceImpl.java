package com.kh.ifwe.board.model.service;

import java.util.List;

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

	@Override
	public List<Board> selectOne(String boardCategory) {
		return boardDAO.selectOne(boardCategory);
	}

	@Override
	public Board selectBoardDetail(int boardNo) {
		return boardDAO.selectBoardDetail(boardNo);
	}

	@Override
	public int deleteBoardOne(int boardNo) {
		return boardDAO.deleteBoardOne(boardNo);
	}

	@Override
	public int updateBoardOne(Board board) {
		return boardDAO.updateBoardOne(board);
	}

	@Override
	public List<Board> selectOne2(String boardCategory,int numPerPage,int cPage) {
		return boardDAO.selectOne2(boardCategory, numPerPage, cPage); 
	}

	@Override
	public int selectBoardTotalContents(String boardCategory) {
		return boardDAO.selectBoardTotalContents(boardCategory);
	}
	
	


	
	
}
