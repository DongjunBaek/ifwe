package com.kh.ifwe.club.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.club.model.vo.Club;

@Repository
public class ClubDAOImpl implements ClubDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int create(Club club) {
		return sqlSession.insert("club.clubCreate",club);
	}

	@Override
	public int selectSeq() {
		return sqlSession.selectOne("club.selectSeq");
	}

	@Override
	public List<String> selectCate(String hashtag) {
		return sqlSession.selectList("club.selectCate",hashtag);
	}

	@Override
	public int insertContent(String hashtag) {
		return sqlSession.insert("club.insertContent",hashtag);
	}

	@Override
	public int insertCategory(Map<String, Object> map) {
		return sqlSession.insert("club.insertCategory", map);
	}

	@Override
	public Club selectClub(int clubSeq) {
		return sqlSession.selectOne("club.selectClub", clubSeq);
	}

	public List<Club> clubSearch() {
		return sqlSession.selectList("club.clubSearch");
	}

	
	
	
	
	
	
	
}
