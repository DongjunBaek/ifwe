package com.kh.ifwe.club.model.service;

import com.kh.ifwe.club.model.vo.Club;

public interface ClubService {

	int create(Club club);

	int selectseq();

	Club selectClub(int clubSeq);

}
