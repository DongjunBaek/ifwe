package com.kh.ifwe.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.club.model.vo.Club;
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

	List<Club> selectClubList(String memberCode);

	int insertProfile(Member serchMember);

	int insertProfile(int memberCode);
	
	Member checkId(String memberId);

}

