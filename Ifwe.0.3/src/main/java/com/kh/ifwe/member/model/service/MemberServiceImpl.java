
package com.kh.ifwe.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.member.model.dao.MemberDAO;
import com.kh.ifwe.member.model.vo.Member;
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

	

	
}
