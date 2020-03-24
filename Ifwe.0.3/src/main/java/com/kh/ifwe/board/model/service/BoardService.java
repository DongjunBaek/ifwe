package com.kh.ifwe.board.model.service;

import java.util.List;

import com.kh.ifwe.board.model.vo.Board;

public interface BoardService {

	int insertBoard(Board board);

	List<Board> selectOne(String boardCategory);

}
