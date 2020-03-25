package com.kh.ifwe.profile.model.service;

import java.util.List;

import com.kh.ifwe.member.model.vo.Profile;

public interface ProfileService {

	List<Profile> selectListProfile(int profileMemberCode);

	Profile selectOneProfile(int profileMemberCode);

}
