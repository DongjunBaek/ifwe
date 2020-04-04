package com.kh.ifwe.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.admin.model.vo.AdminEvent;
import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.member.model.vo.Member;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage, String memberRole) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.selectMemberList", memberRole, rowBounds);
	
	}

	@Override
	public List<Member> selectDropMemberList(int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.selectDropMemberList", null , rowBounds);
	}

	@Override
	public List<Member> selectDormantMemberList(int cPage, int numPerPage) {
	
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
	
		
		return sqlSession.selectList("admin.selectDormantMemberList", null, rowBounds);
	}

	@Override
	public Member selectOne(int memberCode) {
		return sqlSession.selectOne("admin.selectOne",memberCode);
	}

	@Override
	public int cancelMember(Member member, int memberCode) {
		return sqlSession.update("admin.cancelMember",memberCode);
	}

	@Override
	public int dropMember(Member member, int memberCode) {
		return sqlSession.update("admin.dropMember",memberCode);
	}

	@Override
	public List<Member> searchMember(String memberName) {
		return sqlSession.selectList("admin.searchMember", memberName);
	}

	@Override
	public List<Board> selectOneBoard(int cPage, int numPerPage, String boardCategory) {
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.selectOneBoard", boardCategory, rowBounds);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("admin.selectBoardDetail", boardNo);
	}

	@Override
	public int updateBoard(int boardNo) {
		return sqlSession.update("admin.updateBoard", boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.update("admin.deleteBoard",boardNo);
	}

	@Override
	public int insertBoardComment(BoardComment boardComment) {
		return sqlSession.insert("admin.insertBoardComment", boardComment);
	}

	@Override
	public BoardComment selectBoardComment(int boardNo) {
		return sqlSession.selectOne("admin.selectBoardComment",boardNo);
	}

	@Override
	public int deleteBoardComment(int boardNo) {
		return sqlSession.delete("admin.deleteBoardComment",boardNo);
	}

	@Override
	public int updateBoardComment(BoardComment boardComment) {
		return sqlSession.update("admin.updateBoardComment", boardComment);
	}

	@Override
	public int insertEvent(AdminEvent adminEvent) {
		return sqlSession.insert("admin.EventInsert", adminEvent);
	}

	@Override
	public List<AdminEvent> selectList() {
		return sqlSession.selectList("admin.EventList");
	}

	@Override
	public int deleteEvent(int eventCode) {
		return sqlSession.update("admin.EventDel",eventCode);
	}

	@Override
	public AdminEvent selectOneEvent(int eventCode) {
		return sqlSession.selectOne("admin.EventSelectOne",eventCode);
	}

	@Override
	public int updateEvent(AdminEvent adminEvent) {
		return sqlSession.update("admin.EventUpdate", adminEvent);
	}

	@Override
	public List<Member> selctMemberEnrollList() {
		return sqlSession.selectList("admin.MemberEnrollList");
	}



	
}
