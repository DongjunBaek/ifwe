package com.kh.ifwe.profile.model.dao;

import java.util.List;

import com.kh.ifwe.member.model.vo.Profile;

public interface ProfileDAO {

	List<Profile> selectListProfile(int profileMemberCode);

	Profile selectOneProfile(String profileMemberId);

	Profile selectOneProfileWithCode(int memberCode);

}
