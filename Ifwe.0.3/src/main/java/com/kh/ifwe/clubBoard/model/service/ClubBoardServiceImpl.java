package com.kh.ifwe.clubBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.clubBoard.model.dao.ClubBoardDAO;
import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;
import com.kh.ifwe.clubBoard.model.vo.ClubBoardComment;

@Service
public class ClubBoardServiceImpl implements ClubBoardService {
	
	
	@Autowired
	private ClubBoardDAO clubBoardDAO;

	@Override
	public int insertboardList(Map<String, Object> param) {
		return clubBoardDAO.insertboardList(param);
	}

	@Override
	public ClubBoard selectClubBoard(int clubBoardlistNo) {
		return clubBoardDAO.selectClubBoard(clubBoardlistNo);
	}

	@Override
	public int insertBoard(ClubBoard clubBoard) {
		return clubBoardDAO.insertBoard(clubBoard);
	}

	@Override
	public int insertBoardImages(Map<String, Object> param) {
		return clubBoardDAO.insertBoardImages(param);
	}

	@Override
	public List<ClubBoard> selectClubBoardList(int clubBoardlistNo) {
		return clubBoardDAO.selectClubBoardList(clubBoardlistNo);
	}

	@Override
	public List<BoardImg> selectClubBoardNo(int clubBoardlistNo) {
		return clubBoardDAO.selectClubBoardNo(clubBoardlistNo);
	}

	@Override
	public List<BoardImg> selectClubBoardImg(List<BoardImg> boardNo) {
		return clubBoardDAO.selectClubBoardImg(boardNo);
	}

	@Override
	public List<BoardImg> selectBoardImgajax(int boardNo) {
		return clubBoardDAO.selectBoardImgajax(boardNo);
	}

	@Override
	public int updateBoardImg(int boardNo) {
		return clubBoardDAO.updateBoardImg(boardNo);
	}

	@Override
	public List<BoardImg> selectClubBoardNoList(int clubCode) {
		return clubBoardDAO.selectClubBoardNoList(clubCode);
	}

	@Override
	public int insertComment(ClubBoardComment boardComment) {
		return clubBoardDAO.insertComment(boardComment);
	}

	@Override
	public List<ClubBoardComment> selectBoardComment(int clubCode) {
		return clubBoardDAO.selectBoardComment(clubCode);
	}

	@Override
	public int updateClubBoard(int boardRef) {
		return clubBoardDAO.updateClubBoard(boardRef);
	}

	@Override
	public List<ClubBoardComment> selectFreeboardCmt(int clubBoardlistNo) {
		return clubBoardDAO.selectFreeboardCmt(clubBoardlistNo);
	}

	@Override
	public int reportBoard(int boardNo) {
		return clubBoardDAO.reportBoard(boardNo);
	}


	
	
	
	
}
