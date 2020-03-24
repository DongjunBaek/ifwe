package com.kh.ifwe.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.club.model.dao.ClubDAO;
import com.kh.ifwe.club.model.vo.Club;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO clubDAO;

	@Override
	public int create(Club club) {
		
		int result =0;
		result = clubDAO.create(club);
		
		int clubseq = clubDAO.selectSeq();
		
		String[] clubcate = club.getCateCode();
		Map<String , Object> map = new HashMap<String, Object>();
		for(int i=0; i<clubcate.length; i++) {
			List<String> selectCate = new ArrayList<>();
			selectCate = clubDAO.selectCate(clubcate[i]); 
			map.put("clubseq", clubseq);
			map.put("clubcate", clubcate[i]);
			log.debug("selectCate={}",selectCate);
			
			if(selectCate == null) {
				result = clubDAO.insertContent(clubcate[i]);
			}
	
			result = clubDAO.insertCategory(map);
			
		}
		
		
		return result;
		
	}

	@Override
	public int selectseq() {
		return clubDAO.selectSeq();
	}

	@Override
	public Club selectClub(int clubSeq) {
		return clubDAO.selectClub(clubSeq);
	}

	//0324 문보라 소모임목록 뿌려주기 
	@Override
	public List<Club> clubSearch() {
		return clubDAO.clubSearch();
	}
	
	
	
}
