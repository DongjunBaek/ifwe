package com.kh.ifwe.clubBoard.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClubBoardDAOImpl implements ClubBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertboardList(Map<String, Object> param) {
		return sqlSession.insert("clubBoard.insertboardList",param);
	}
	
	
	
}
