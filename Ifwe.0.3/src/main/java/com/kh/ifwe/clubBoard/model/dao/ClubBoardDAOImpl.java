package com.kh.ifwe.clubBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;

@Repository
public class ClubBoardDAOImpl implements ClubBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertboardList(Map<String, Object> param) {
		return sqlSession.insert("clubBoard.insertboardList",param);
	}

	@Override
	public ClubBoard selectClubBoard(int clubBoardlistNo) {
		return sqlSession.selectOne("clubBoard.selectOne",clubBoardlistNo);
	}

	@Override
	public int insertBoard(ClubBoard clubBoard) {
		return sqlSession.insert("clubBoard.insertBoard",clubBoard);
	}

	@Override
	public int insertBoardImages(Map<String, Object> param) {
		return sqlSession.insert("clubBoard.insertBoardImages",param);
	}

	@Override
	public List<ClubBoard> selectClubBoardList(int clubBoardlistNo) {
		return sqlSession.selectList("clubBoard.selectClubBoardList", clubBoardlistNo);
	}

	@Override
	public List<BoardImg> selectClubBoardNo(int clubBoardlistNo) {
		return sqlSession.selectList("clubBoard.selectClubBoardNo",clubBoardlistNo);
	}

	@Override
	public List<BoardImg> selectClubBoardImg(List<BoardImg> boardNo) {
		return sqlSession.selectList("clubBoard.selectClubBoardImg",boardNo);
	}

	@Override
	public List<BoardImg> selectBoardImgajax(int boardNo) {
		return sqlSession.selectList("clubBoard.selectBoardImgajax",boardNo);
	}

	@Override
	public int updateBoardImg(int boardNo) {
		return sqlSession.update("clubBoard.updateBoardImg",boardNo);
	}


	
	
	
}
