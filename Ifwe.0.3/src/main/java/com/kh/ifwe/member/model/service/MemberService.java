package com.kh.ifwe.member.model.service;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;

public interface MemberService {

	int insertMember(Member member);

	Member selectOne(String memberId);

	int insertProfile(Profile profile);

}
