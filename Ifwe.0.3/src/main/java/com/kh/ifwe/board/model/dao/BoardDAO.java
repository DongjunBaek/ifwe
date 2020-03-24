package com.kh.ifwe.board.model.dao;

import java.util.List;

import com.kh.ifwe.board.model.vo.Board;

public interface BoardDAO {

	int insertBoard(Board board);

	List<Board> selectOne(String boardCategory);

	Board selectBoardDetail(int boardNo);

}
