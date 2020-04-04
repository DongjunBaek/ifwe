package com.kh.ifwe.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public List<Board> selectOne(String boardCategory) {
		
		return sqlSession.selectList("admin.selectOneBoard",boardCategory);
	}

	@Override
	public Board selectBoardDetail(int boardNo) {
		return sqlSession.selectOne("admin.selectBoardDetail",boardNo);
	}

	@Override
	public int deleteBoardOne(int boardNo) {
		return sqlSession.delete("admin.deleteBoardOne",boardNo);
	}

	@Override
	public int updateBoardOne(Board board) {
		return sqlSession.update("admin.updateBoardOne", board);
	}


	@Override
	public List<Board> selectOne2(String boardCategory, int numPerPage, int cPage) {
		int offset = ((cPage-1)*numPerPage);
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.selectOneBoard",boardCategory,rowBounds);
	}

	@Override
	public int selectBoardTotalContents(String boardCategory) {
		return sqlSession.selectOne("admin.selectBoardTotalContents",boardCategory);
	}

}
