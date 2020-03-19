package com.kh.ifwe.member.model.dao;

import com.kh.ifwe.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	Member selectOne(String memberId);

}
