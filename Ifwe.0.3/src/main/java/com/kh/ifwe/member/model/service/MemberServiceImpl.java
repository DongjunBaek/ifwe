package com.kh.ifwe.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.member.model.dao.MemberDAO;
import com.kh.ifwe.member.model.vo.Member;

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
	
	
}
