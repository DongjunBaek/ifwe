package com.kh.ifwe.club.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.club.model.vo.Club;

public interface ClubDAO {

	int create(Club club);

	int selectSeq();

	List<String> selectCate(String hashtag);

	int insertContent(String hashtag);

	int insertCategory(Map<String, Object> map);

	List<Club> clubSearch();

}
