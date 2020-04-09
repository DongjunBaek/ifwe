package com.kh.ifwe.member.model.service;

import java.util.Map;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.MemberLoggedIn;
import com.kh.ifwe.member.model.vo.Profile;


import java.util.List;
import java.util.Map;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;

public interface MemberService {

	int insertMember(Member member);

	Member selectOne(String memberId);

	int updatePassword(Member member);

	int updatePhone(Member member);

	int updateEamil(Member member);

	int deleteMember(Member member);

	int updateProfile(Profile profile);
	Member searchId(Map<String, String> param);


	int insertPre(Map<String, String> map);

	Member memberSelectOneCode(int memberCode);

	List<Club> selectClubList(int memberCode);

	int insertProfile(Member serchMember);

	int insertProfile(int memberCode);
	
	MemberLoggedIn selectMemberLogin(int memberCode);
	
	Member checkId(String memberId);

	List<Club> selectInterClub(String memberLike);

	int insertMsgFriend(Map<String, Integer> map);

	List<Member> selectFriendList(int memberCode);

	int friendYes(int memberFrom);

	Friend selectOneForFriend(int memberFrom);

	int insertFriends(Friend friend);

	int insertOtherFriend(Map<String, Object> map);

	int selectMsgCount(int memberCode);

	Profile selectProfileByMemberCode(int clubMaster);

	int insertLoginRecord(int memberCode);

	int logoutRecordUpdate(int memberCode);

	int loginRecordUpdate(int memberCode);

}
