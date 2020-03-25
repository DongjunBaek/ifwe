package com.kh.ifwe.club.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubMaster;
import com.kh.ifwe.member.model.vo.Member;

public interface ClubDAO {

	int create(Club club);

	int selectSeq();

	List<String> selectCate(String hashtag);

	int insertContent(String hashtag);

	int insertCategory(Map<String, Object> map);

	List<ClubMaster> clubSearch();

	Club selectOne(int clubCode);

	Member selectClubMaster(int clubMaster);

	List<ClubMaster> searchClubByHashtag(Map<String, String> param);

	List<ClubMaster> selectListByName(Map<String, String> param);


}
