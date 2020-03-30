package com.kh.ifwe.clubBoard.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.clubBoard.model.dao.ClubBoardDAO;

@Service
public class ClubBoardServiceImpl implements ClubBoardService {
	
	
	@Autowired
	private ClubBoardDAO clubBoardDAO;

	@Override
	public int insertboardList(Map<String, Object> param) {
		return clubBoardDAO.insertboardList(param);
	}
	
	
	
	
}
