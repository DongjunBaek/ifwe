package com.kh.ifwe.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.friend.model.vo.SessionFriend;
import com.kh.ifwe.member.model.dao.MemberDAO;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.MemberLoggedIn;
import com.kh.ifwe.member.model.vo.Profile;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

	@Override
	public Member selectOne(String memberId) {
		System.out.println("멤버 서비스 체크");
		return memberDAO.selectOne(memberId);
	}

	@Override
	public int updatePassword(Member member) {
		return memberDAO.updatePassword(member);
	}

	@Override
	public int updatePhone(Member member) {
		return memberDAO.updatePhone(member);
	}

	@Override
	public int updateEamil(Member member) {
		return memberDAO.updateEmail(member);
	}	

	@Override
	public int deleteMember(Member member) {
		return memberDAO.deleteMember(member);
	}

	@Override
	public int updateProfile(Profile profile) {
		return memberDAO.updateProfile(profile);
	}
	
	public Member searchId(Map<String, String> param) {
		return memberDAO.searchId(param);
	}

	@Override
	public int insertPre(Map<String, String> map) {
		return memberDAO.insertPre(map);
	};
	
	@Override
	public Member memberSelectOneCode(int memberCode) {
		return memberDAO.memberSelectOneCode(memberCode);
	}

	@Override
	public int insertProfile(Member member) {
		return memberDAO.insertProfile(member);
	}

	@Override
	public int insertProfile(int memberCode) {
		// TODO Auto-generated method stub
		return 0;
	}
  
  @Override
	public List<Club> selectClubList(int memberCode) {
		return memberDAO.selectClubList(memberCode);
	}
  
  @Override
	public MemberLoggedIn selectMemberLogin(int memberCode) {
		return memberDAO.selectMemberLogin(memberCode);
	}
  	
  @Override
	public Member checkId(String memberId) {
		return memberDAO.checkId(memberId);
	}

	@Override
	public List<Club> selectInterClub(String memberLike) {
		return memberDAO.selectInterClub(memberLike);
	}

	@Override
	public int insertMsgFriend(Map<String, Integer> map) {
		return memberDAO.insertMsgFriend(map);
	}

	@Override
	public List<Member> selectFriendList(int memberCode) {
		return memberDAO.selectFriendList(memberCode);
	}

	@Override
	public int friendYes(int memberFrom) {
		return memberDAO.friendYes(memberFrom);
	}

	@Override
	public Friend selectOneForFriend(int memberFrom) {
		return memberDAO.selectOneForFriend(memberFrom);
	}

	@Override
	public int insertFriends(Friend friend) {
		return memberDAO.insertFriends(friend);
	}

	@Override
	public int insertOtherFriend(Map<String, Object> map) {
		return memberDAO.insertOtherFriend(map);
	}

	@Override
	public int selectMsgCount(int memberCode) {
		return memberDAO.selectMsgCount(memberCode);
	}

	@Override
	public List<SessionFriend> selectMsgFriend(int memberCode) {
		return memberDAO.selectMsgFriend(memberCode);
  }
  
  @Override
  public Profile selectProfileByMemberCode(int clubMaster) {
		return memberDAO.selectProfileByMemberCode(clubMaster);
	}

	@Override
	public int insertLoginRecord(int memberCode) {
		// TODO Auto-generated method stub
		return memberDAO.insertLoginRecord(memberCode);
	}

	@Override
	public int logoutRecordUpdate(int memberCode) {
		// TODO Auto-generated method stub
		return memberDAO.logoutRecordUpdate(memberCode);
	}

	@Override
	public int loginRecordUpdate(int memberCode) {
		// TODO Auto-generated method stub
		return memberDAO.loginRecordUpdate(memberCode);
	}


	
}


