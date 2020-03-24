package com.kh.ifwe.club.model.service;

import java.util.List;

import com.kh.ifwe.club.model.vo.Club;

public interface ClubService {

	int create(Club club);

	List<Club> clubSearch();

}
