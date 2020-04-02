package com.kh.ifwe.clubBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;

public interface ClubBoardDAO {

	int insertboardList(Map<String, Object> param);

	ClubBoard selectClubBoard(int clubBoardlistNo);

	int insertBoard(ClubBoard clubBoard);

	int insertBoardImages(Map<String, Object> param);

	List<ClubBoard> selectClubBoardList(int clubBoardlistNo);

	List<BoardImg> selectClubBoardNo(int clubBoardlistNo);

	List<BoardImg> selectClubBoardImg(List<BoardImg> boardNo);

	List<BoardImg> selectBoardImgajax(int boardNo);

	int updateBoardImg(int boardNo);

	List<BoardImg> selectClubBoardNoList(int clubCode);
	
	
}
