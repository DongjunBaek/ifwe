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
	public Profile selectOneProfile(String profileMemberId) {
		// TODO Auto-generated method stub
		System.out.println("프로필 서비스 작동 확인");
		return profiledao.selectOneProfile(profileMemberId);
	}

	@Override
	public Profile selectOneProfileWithCode(int memberCode) {
		// TODO Auto-generated method stub
		return profiledao.selectOneProfileWithCode(memberCode);
	}

	
	
	
	
}
