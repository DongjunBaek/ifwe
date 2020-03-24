package com.kh.ifwe.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.board.model.vo.Board;

/**
 * 0321 insert board 
 * 게시판 boardDAO 작성 
 * @author dongjun
 *
 */

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("admin.insertBoard", board);
	}

	@Override
	public List<Board> selectOne(String BoardCategory) {
		return sqlSession.selectList("admin.selectOneBoard",BoardCategory);
	}

	@Override
	public Board selectBoardDetail(int boardNo) {
		return sqlSession.selectOne("admin.selectBoardDetail",boardNo);
	}
}
