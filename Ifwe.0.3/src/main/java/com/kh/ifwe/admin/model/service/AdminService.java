package com.kh.ifwe.admin.model.service;

import java.util.List;

import com.kh.ifwe.admin.model.vo.AdminEvent;
import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.board.model.vo.BoardComment;
import com.kh.ifwe.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMemberList(int cPage, int numPerPage, String memberRole);

	List<Member> selectDropMemberList(int cPage, int numPerPage);

	List<Member> selectDormantMemberList(int cPage, int numPerPage);

	Member selectOne(int memberCode);

	int cancelMember(Member member, int memberCode);

	int dropMember(Member member, int memberCode);

	List<Member> selectOne(String memberName);

	List<Board> selectOneBoard(int cPage, int numPerPage, String boardCategory);

	Board selectBoard(int boardNo);

	int updateBoard(int boardNo);

	int deleteBoard(int boardNo);

	int insertBoardComment(BoardComment boardComment);

	BoardComment selectBoardComment(int boardNo);

	int deleteBoardComment(int boardNo);

	int UpdateBoardComment(BoardComment boardComment);

	int insertEvent(AdminEvent adminEvent);

	List<AdminEvent> selectEventList();

	int deleteEvent(int eventCode);

	AdminEvent selectOneEvent(int eventCode);

	int updateEvent(AdminEvent adminEvent);

	List<Member> memberEnrollList();

	int selectMemberCount(String memberRole);

	int selectNoticeCount(String boardCategory);

	int insertDormantNotice(int memberCode);

	int selectReportOne(int memberCode);

}
