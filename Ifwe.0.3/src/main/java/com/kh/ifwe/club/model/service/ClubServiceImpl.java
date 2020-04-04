package com.kh.ifwe.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.board.model.vo.Board;
import com.kh.ifwe.club.model.dao.ClubDAO;
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
@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO clubDAO;

	@Override
	public int create(Club club) {
		
		int result =0;
		result = clubDAO.create(club);
		
		int clubseq = clubDAO.selectSeq();
		
		String[] clubcate = club.getCateCode();
		Map<String , Object> map = new HashMap<String, Object>();
		for(int i=0; i<clubcate.length; i++) {
			String selectCate = null;
			selectCate = clubDAO.selectCate(clubcate[i]); 
			map.put("clubseq", clubseq);
			map.put("clubcate", clubcate[i]);
			log.debug("selectCate={}",selectCate);
			
			if(selectCate == null) {
				result = clubDAO.insertContent(clubcate[i]);
			}
	
			result = clubDAO.insertCategory(map);
			
		}
		
		
		return result;
		
	}


	//0324 문보라 소모임목록 뿌려주기 
	@Override
	public List<ClubMaster> clubSearch() {
		return clubDAO.clubSearch();
	}

	//소모임 자세히 보기
	@Override
	public Club selectOne(int clubCode) {
		return clubDAO.selectOne(clubCode);
	}

	@Override
	public Member selectClubMaster(int clubMaster) {
		return clubDAO.selectClubMaster(clubMaster);
	}


	//소모임 검색 해쉬태그로 0325
	@Override
	public List<ClubMaster> searchClubByHashtag(Map<String, Object> param) {
		return clubDAO.searchClubByHashtag(param);
	}


	@Override
	public List<ClubMaster> selectListByName(Map<String, Object> param) {
		return clubDAO.selectListByName(param);
	}

	
	@Override
	public List<Member> selectMemberCode(int clubCode) {
		return clubDAO.selectMemberCode(clubCode);
	}


	@Override
	public List<ClubMember> selectClubMember(List<Member> clubMemberCode) {
		return clubDAO.selectClubMember(clubMemberCode);
	}

	//0326문보라 가입요청 메세지 보내기
	@Override
	public int insertMsgEnroll(Map<String, Object> param) {
		return clubDAO.insertMsgEnroll(param);
	}

	//0326문보라 가입요청 메세지 뿌려주기 
	@Override
	public List<Message> selectMsgList(int clubCode) {
		return clubDAO.selectMsgList(clubCode);
	}


	//0326문보라 가입요청 메세지 뿌려주기 
	@Override
	public Message selectMsgOne(int msgCode) {
		return clubDAO.selectMsgOne(msgCode);
	}


	@Override
	public int insertClubMembers(Map<String, Object> param) {
		return clubDAO.insertClubMembers(param);
	}


	//0326 문보라
	@Override
	public int updateMembersGrade(Map<String, Integer> param) {
		return clubDAO.updateMembersGrade(param);
	}


	@Override
	public int deleteMembers(Map<String, Integer> param) {
		return clubDAO.deleteMembers(param);
	}


	@Override
	public int updateMsgView(int msgCode) {
		return clubDAO.updateMsgView(msgCode);
	}



	public ClubMember selectClubMaster2(Map<String, Object> param2) {
		return clubDAO.selectClubMaster2(param2);
	}


	@Override
	public int updateClub(Club newClub) {
		return clubDAO.updateClub(newClub);
	}


	@Override
	public ClubLoggedIn selectClubLoggedIn(Map<String, Object> param) {
		return clubDAO.selectClubLoggedIn(param);
	}


	@Override
	public int deleteClubMember(Map<String, Object> param) {
		return clubDAO.deleteClubMember(param);
	}



	public List<ClubBoard> selectBoardList(int clubCode) {
		return clubDAO.selectBoardList(clubCode);
	}


	@Override
	public List<ClubBoardProfile> selectclubBoardProfileList(int clubCode) {
		return clubDAO.selectclubBoardProfileList(clubCode);
	}


	@Override
	public int deleteMsg(Map<String, Object> param) {
		return clubDAO.deleteMsg(param);
	}


	@Override
	public int insertSearchKeyword(Map<String, Object> param) {
		return clubDAO.insertSearchKeyword(param);
	}


	@Override
	public List<Integer> selectMaleCount(List<Integer> clubCode) {
		return clubDAO.selectMaleCount(clubCode);
	}


	@Override
	public List<Count> selectAge(List<Integer> clubCode) {
		return clubDAO.selectAge(clubCode);
	}


	@Override
	public List<ClubBoardProfile> selectclubBoardSearch(Map<String, Object> param) {
		return clubDAO.selectclubBoardSearch(param);
	}
	
	@Override
	public List<Club> selectClubCateList(String clubCatecode) {
		return clubDAO.selectClubCateList(clubCatecode);
	}

	@Override
	public List<SearchKeyword> selectSearchKeywordList() {
		return clubDAO.selectSearchKeywordList();
	}

}	



	
	
	
