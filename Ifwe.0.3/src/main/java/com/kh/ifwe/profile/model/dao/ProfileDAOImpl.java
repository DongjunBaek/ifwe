package com.kh.ifwe.profile.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.member.model.vo.Profile;

@Repository
public class ProfileDAOImpl implements ProfileDAO {

	@Autowired
	SqlSessionTemplate sqlsession;
	
	
	@Override
	public List<Profile> selectListProfile(int profileMemberCode) {
//		return sqlsession.selectList("profile.selectList",profileMemberCode);
	return null;
	}


	@Override
	public Profile selectOneProfile(int profileMemberCode) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("profile.selectOne",profileMemberCode);
	}

	
}