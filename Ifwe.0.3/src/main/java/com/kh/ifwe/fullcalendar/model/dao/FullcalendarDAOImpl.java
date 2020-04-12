package com.kh.ifwe.fullcalendar.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.club.model.vo.Club;
import com.kh.ifwe.club.model.vo.ClubMember;
import com.kh.ifwe.fullcalendar.model.vo.Fullcalendar;

@Repository
public class FullcalendarDAOImpl implements FullcalendarDAO {
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;

	@Override
	public void addFullcalendar(Fullcalendar fullcalendar) {

		System.out.println("dao" + fullcalendar);
		sqlsessiontemplate.insert("fullcalendar.insertFullcalendar", fullcalendar);

	}

	@Override
	public List<Fullcalendar> selectList(String clubCode) {
		// TODO Auto-generated method stub
		return sqlsessiontemplate.selectList("fullcalendar.selectFcList",clubCode);
	}

	@Override
	public int updateFC(Fullcalendar fc) {
		// TODO Auto-generated method stub
		return sqlsessiontemplate.update("fullcalendar.updateFC",fc);
	}

	@Override
	public int deleteFC(Fullcalendar fc) {
		// TODO Auto-generated method stub
		return sqlsessiontemplate.delete("fullcalendar.deleteFC",fc);
	}

	@Override
	public Club checkMaster(String clubCode) {
		// TODO Auto-generated method stub
		return sqlsessiontemplate.selectOne("fullcalendar.checkMaster",clubCode);
	}


	@Override
	public int selectClubMember(Map<String, String> clubMemberCheck) {
		
		
		
		ClubMember clubMember= sqlsessiontemplate.selectOne("fullcalendar.selectClubMember",clubMemberCheck);
		
		if(clubMember!=null) {
			return 1;
			
		}
		else {
			return 0;
		}
	}

}
