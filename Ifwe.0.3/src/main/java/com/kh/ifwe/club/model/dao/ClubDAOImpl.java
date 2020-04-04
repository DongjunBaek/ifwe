package com.kh.ifwe.club.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubLoggedIn;
import com.kh.ifwe.club.model.vo.ClubMaster;
import com.kh.ifwe.club.model.vo.ClubMember;
import com.kh.ifwe.club.model.vo.Count;
import com.kh.ifwe.clubBoard.model.vo.BoardImg;
import com.kh.ifwe.clubBoard.model.vo.ClubBoard;
import com.kh.ifwe.clubBoard.model.vo.ClubBoardProfile;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Message;
import com.kh.ifwe.mian.model.vo.SearchKeyword;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public String selectCate(String hashtag) {
		return sqlSession.selectOne("club.selectCate",hashtag);
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
	public List<ClubMaster> clubSearch() {

		return sqlSession.selectList("club.clubSearch");
	}

	
	@Override
	public Club selectOne(int clubCode) {
		return sqlSession.selectOne("club.selectOne",clubCode);
	}

	@Override
	public Member selectClubMaster(int clubMaster) {
		return sqlSession.selectOne("club.selectClubMaster",clubMaster);
	}

	

	@Override
	public List<ClubMaster> searchClubByHashtag(Map<String, Object> param) {
		return sqlSession.selectList("club.searchClubByHashtag", param);
	}

	@Override
	public List<ClubMaster> selectListByName(Map<String, Object> param) {
		return sqlSession.selectList("club.selectListByName", param);
	}

	@Override
	public List<Member> selectMemberCode(int clubCode) {
		return sqlSession.selectList("club.selectMemberCode",clubCode);
	}

	@Override
	public List<ClubMember> selectClubMember(List<Member> clubMemberCode_) {
		return sqlSession.selectList("club.selectClubMember", clubMemberCode_);
	}

	@Override
	public ClubMember selectClubMaster2(Map<String, Object> param2) {
		return sqlSession.selectOne("club.selectClubMaster2",param2);
	}

	@Override
	public int insertMsgEnroll(Map<String, Object> param) {
		return sqlSession.insert("club.insertMsgEnroll", param);
	}

	@Override
	public List<Message> selectMsgList(int clubCode) {
		return sqlSession.selectList("club.selectMsgList", clubCode);
	}

	@Override
	public Message selectMsgOne(int msgCode) {
		return sqlSession.selectOne("club.selectMsgOne", msgCode);
	}

	@Override
	public int insertClubMembers(Map<String, Object> param) {
		return sqlSession.insert("club.insertClubMembers", param);
	}

	@Override
	public int updateMembersGrade(Map<String, Integer> param) {
		return sqlSession.update("club.updateMembersGrade", param);
	}

	@Override
	public int deleteMembers(Map<String, Integer> param) {
		return sqlSession.delete("club.deleteMembers", param);
	}

	@Override
	public int updateMsgView(int msgCode) {
		return sqlSession.update("club.updateMsgView", msgCode);
	}

	@Override
	public int updateClubCurrent(int clubCode) {
		return sqlSession.update("club.updateClubCurrent",clubCode);
	}

	@Override
	public int updateClub(Club newClub) {
		return sqlSession.update("club.updateClub",newClub);
	}

	@Override
	public ClubLoggedIn selectClubLoggedIn(Map<String, Object> param) {
		return sqlSession.selectOne("club.clubLoggedIn",param);
	}

	@Override
	public int deleteClubMember(Map<String, Object> param) {
		return sqlSession.delete("club.deleteClubMember",param);
	}


	public List<ClubBoard> selectBoardList(int clubCode) {
		return sqlSession.selectList("club.selectBoardList", clubCode);

	}

	@Override
	public List<ClubBoardProfile> selectclubBoardProfileList(int clubCode) {
		return sqlSession.selectList("club.selectclubBoardProfileList", clubCode);
	}

	@Override
	public int deleteMsg(Map<String, Object> param) {
		return sqlSession.delete("club.deleteMsg", param);
	}

	@Override
	public int insertSearchKeyword(Map<String, Object> param) {
		return sqlSession.insert("club.insertSearchKeyword", param);
	}

	@Override
	public List<Integer> selectMaleCount(List<Integer> clubMemberCode) {
		return sqlSession.selectList("club.selectMaleCount",clubMemberCode);
	}

	@Override
	public List<Count> selectAge(List<Integer> clubCode) {
		return sqlSession.selectList("club.selectAge",clubCode);
	}

	@Override
	public List<Club> selectClubCateList(String clubCatecode) {
		return sqlSession.selectList("club.selectClubCateList",clubCatecode);
	}

	@Override
	public List<SearchKeyword> selectSearchKeywordList() {
		return sqlSession.selectList("club.selectSearchKeywordList");
	}


	
	
	
	
	
	
}
