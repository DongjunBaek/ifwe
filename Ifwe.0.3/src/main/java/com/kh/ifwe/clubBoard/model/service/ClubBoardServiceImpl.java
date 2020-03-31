package com.kh.ifwe.clubBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.clubBoard.model.dao.ClubBoardDAO;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;

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


	
	
	
	
}
