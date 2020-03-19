package com.kh.ifwe.member.model.service;

import com.kh.ifwe.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectOne(String memberId);

}
