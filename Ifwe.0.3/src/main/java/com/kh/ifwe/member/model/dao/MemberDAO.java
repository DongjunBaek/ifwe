package com.kh.ifwe.member.model.dao;

import com.kh.ifwe.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	Member selectOne(String memberId);

	int updatePassword(Member member);

	int updatePhone(Member member);

	int updateEmail(Member member);

	int deleteMember(Member member);

}
