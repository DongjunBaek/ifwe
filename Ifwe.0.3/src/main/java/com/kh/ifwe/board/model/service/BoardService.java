package com.kh.ifwe.board.model.service;

import java.util.List;

import com.kh.ifwe.board.model.vo.Board;

public interface BoardService {

	int insertBoard(Board board);

	List<Board> selectOne(String boardCategory);

	Board selectBoardDetail(int boardNo);

	int deleteBoardOne(int boardNo);

	int updateBoardOne(Board board);

	List<Board> selectOne2(String boardCategory, int numPerPage, int cPage);

	int selectBoardTotalContents(String boardCategory);


}
