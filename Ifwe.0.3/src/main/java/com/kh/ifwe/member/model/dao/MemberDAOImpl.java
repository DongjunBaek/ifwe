package com.kh.ifwe.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
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
	
	
	
	
	
}
