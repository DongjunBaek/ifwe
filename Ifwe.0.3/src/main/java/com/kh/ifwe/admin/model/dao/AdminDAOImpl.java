package com.kh.ifwe.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.member.model.vo.Member;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return sqlSession.selectList("admin.selectMemberList", null, rowBounds);
	}

	@Override
	public List<Member> selectDropMemberList(int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.selectDropMemberList", null , rowBounds);
	}

	@Override
	public List<Member> selectDormantMemberList(int cPage, int numPerPage) {
	
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
	
		
		return sqlSession.selectList("admin.selectDormantMemberList", null, rowBounds);
	}

	@Override
	public Member selectOne(int memberCode) {
		return sqlSession.selectOne("admin.selectOne",memberCode);
	}

	@Override
	public int cancelMember(Member member, int memberCode) {
		return sqlSession.update("admin.cancelMember",memberCode);
	}

	
}
