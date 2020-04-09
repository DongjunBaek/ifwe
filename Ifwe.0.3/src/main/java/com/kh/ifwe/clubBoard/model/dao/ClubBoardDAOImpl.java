package com.kh.ifwe.clubBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;
import com.kh.ifwe.clubBoard.model.vo.ClubBoardComment;

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

	@Override
	public List<BoardImg> selectClubBoardNoList(int clubCode) {
		return sqlSession.selectList("clubBoard.selectClubBoardNoList",clubCode);
	}

	@Override
	public int insertComment(ClubBoardComment boardComment) {
		return sqlSession.insert("clubBoard.insertComment",boardComment);
	}

	@Override
	public List<ClubBoardComment> selectBoardComment(int clubCode) {
		return sqlSession.selectList("clubBoard.selectBoardCommentMain",clubCode);
	}

	@Override
	public int updateClubBoard(int boardRef) {
		return sqlSession.update("clubBoard.updateClubBoard",boardRef);
	}

	@Override
	public List<ClubBoardComment> selectFreeboardCmt(int clubBoardlistNo) {
		return sqlSession.selectList("clubBoard.selectFreeboardCmt",clubBoardlistNo);
	}

	@Override
	public int reportBoard(int boardNo) {
		return sqlSession.update("clubBoard.reportBoard", boardNo);
	}

	@Override
	public int insertHeart(Map<String, Integer> param) {
		return sqlSession.insert("clubBoard.insertHeart",param);
	}

	@Override
	public int selectBoard(int boardNo) {
		return sqlSession.selectOne("clubBoard.selectBoard",boardNo);
	}

	@Override
	public int deleteHeart(Map<String, Integer> param) {
		return sqlSession.delete("clubBoard.deleteHeart", param);
	}

	@Override
	public List<Integer> selectMyHeartList(int memberCode) {
		return sqlSession.selectList("clubBoard.selectMyHeartList",memberCode);
	}

	@Override
	public List<ClubBoard> selectMyClubBoard(int memberCode) {
		return sqlSession.selectList("clubBoard.selectMyClubBoard", memberCode);
	}


	
	
	
}
