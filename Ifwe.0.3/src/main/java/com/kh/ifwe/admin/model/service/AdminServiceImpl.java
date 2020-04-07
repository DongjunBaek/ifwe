package com.kh.ifwe.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.admin.model.dao.AdminDAO;
import com.kh.ifwe.admin.model.vo.AdminEvent;
import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage, String memberRole) {
		return adminDAO.selectMemberList(cPage,numPerPage, memberRole);
	}

	@Override
	public List<Member> selectDropMemberList(int cPage, int numPerPage) {
		return adminDAO.selectDropMemberList(cPage,numPerPage);
	}

	@Override
	public List<Member> selectDormantMemberList(int cPage, int numPerPage) {
		return adminDAO.selectDormantMemberList(cPage, numPerPage);
	}

	@Override
	public Member selectOne(int memberCode) {
		return adminDAO.selectOne(memberCode);
	}

	@Override
	public int cancelMember(Member member, int memberCode) {
		return adminDAO.cancelMember(member, memberCode);
	}

	@Override
	public int dropMember(Member member, int memberCode) {
		return adminDAO.dropMember(member, memberCode);
	}

	@Override
	public List<Member> selectOne(String memberName) {
		return adminDAO.searchMember(memberName);
	}

	@Override
	public List<Board> selectOneBoard(int cPage, int numPerPage, String boardCategory) {
		return adminDAO.selectOneBoard(cPage, numPerPage, boardCategory);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return adminDAO.selectBoard(boardNo);
	}

	@Override
	public int updateBoard(int boardNo) {
		return adminDAO.updateBoard(boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return adminDAO.deleteBoard(boardNo);
	}

	@Override
	public int insertBoardComment(BoardComment boardComment) {
		return adminDAO.insertBoardComment(boardComment);
	}

	@Override
	public BoardComment selectBoardComment(int boardNo) {
		return adminDAO.selectBoardComment(boardNo);
	}

	@Override
	public int deleteBoardComment(int boardNo) {
		return adminDAO.deleteBoardComment(boardNo);
	}

	@Override
	public int UpdateBoardComment(BoardComment boardComment) {
		return adminDAO.updateBoardComment(boardComment);
	}

	@Override
	public int insertEvent(AdminEvent adminEvent) {
		return adminDAO.insertEvent(adminEvent);
	}

	@Override
	public List<AdminEvent> selectEventList() {
		return adminDAO.selectList();
	}

	@Override
	public int deleteEvent(int eventCode) {
		return adminDAO.deleteEvent(eventCode);
	}

	@Override
	public AdminEvent selectOneEvent(int eventCode) {
		return adminDAO.selectOneEvent(eventCode);
	}

	@Override
	public int updateEvent(AdminEvent adminEvent) {
		return adminDAO.updateEvent(adminEvent);
	}

	@Override
	public List<Member> memberEnrollList() {
		return adminDAO.selctMemberEnrollList();
	}

	@Override
	public int selectMemberCount(String memberRole) {
		return adminDAO.selectMemberCount(memberRole);
	}

	@Override
	public int selectNoticeCount(String boardCategory) {
		return adminDAO.selectNoticeCount(boardCategory);
	}

	@Override
	public int insertDormantNotice(int memberCode) {
		return adminDAO.insertDormantNotice(memberCode);
	}




	
}
