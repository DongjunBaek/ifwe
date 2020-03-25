package com.kh.ifwe.profile.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.member.model.vo.Profile;
import com.kh.ifwe.profile.model.dao.ProfileDAO;
@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	ProfileDAO profiledao;
	
	@Override
	public List<Profile> selectListProfile(int profileMemberCode) {
		
		return profiledao.selectListProfile(profileMemberCode);
	}

	@Override
	public Profile selectOneProfile(int profileMemberCode) {
		// TODO Auto-generated method stub
		return profiledao.selectOneProfile(profileMemberCode);
	}

	
	
	
	
}
