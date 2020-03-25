package com.kh.ifwe.club.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubMaster;
import com.kh.ifwe.club.model.vo.ClubMember;
import com.kh.ifwe.member.model.vo.Member;

public interface ClubService {

	int create(Club club);

	List<ClubMaster> clubSearch();

	Club selectOne(int clubCode);

	Member selectClubMaster(int clubMaster);

	List<ClubMaster> searchClubByHashtag(Map<String, String> param);

	List<ClubMaster> selectListByName(Map<String, String> param);

	List<Member> selectMemberCode(int clubCode);

	List<ClubMember> selectClubMember(List<Member> clubMemberCode);


}
