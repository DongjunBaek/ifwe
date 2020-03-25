package com.kh.ifwe.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Profile;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
	
		 sqlSession.insert("member.insertProfile",member);
		
		return sqlSession.insert("member.insertMember",member);
	}

	@Override
	public Member selectOne(String memberId) {
		return sqlSession.selectOne("member.selectOne",memberId);
	}

	@Override
	public int updatePassword(Member member) {
		return sqlSession.update("member.updatePassword", member);
	}

	@Override
	public int updatePhone(Member member) {
		return sqlSession.update("member.updatePhone",member);
	}

	@Override
	public int updateEmail(Member member) {
		return sqlSession.update("member.updateEmail", member);
	}

	@Override
	public int deleteMember(Member member) {
		return sqlSession.update("member.deleteMember",member);
	}

	@Override
	public int updateProfile(Profile profile) {
		return sqlSession.update("member.updateProfile",profile);
	}
	public Member searchId(Map<String, String> param) {
		return sqlSession.selectOne("member.searchId",param);
	}

	@Override
	public Member memberSelectOneCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneCode",memberCode);
	}
	
	@Override
	public int insertPre(Map<String, String> map) {
		return sqlSession.insert("member.insertPre",map);
	}
	
	
	
}
