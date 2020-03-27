package com.kh.ifwe.member.model.dao;

import java.util.Map;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.MemberLoggedIn;
import com.kh.ifwe.member.model.vo.Profile;


import java.util.List;
import java.util.Map;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;

public interface MemberDAO {

	int insertMember(Member member);

	Member selectOne(String memberId);

	int updatePassword(Member member);

	int updatePhone(Member member);

	int updateEmail(Member member);

	int deleteMember(Member member);

	int updateProfile(Profile profile);

	Member searchId(Map<String, String> param);

	Member memberSelectOneCode(int memberCode);
	
	int insertPre(Map<String, String> map);


	List<Club> selectClubList(int memberCode);

	int insertProfile(Member member);
	
	MemberLoggedIn selectMemberLogin(int memberCode);
	
	Member checkId(String memberId);

	List<Club> selectInterClub(String memberLike);

}
