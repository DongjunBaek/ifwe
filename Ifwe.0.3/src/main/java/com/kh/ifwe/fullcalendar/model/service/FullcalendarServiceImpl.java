package com.kh.ifwe.fullcalendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.fullcalendar.model.dao.FullcalendarDAO;
import com.kh.ifwe.fullcalendar.model.vo.Fullcalendar;

@Service
public class FullcalendarServiceImpl implements FullcalendarService {

	@Autowired
	FullcalendarDAO fullcalendardao;
	
	@Override
	public void addFullcalendar(Fullcalendar fullcalendar) {

		
		fullcalendardao.addFullcalendar(fullcalendar);
		
	}

	@Override
	public List<Fullcalendar> selectList() {

		
		return fullcalendardao.selectList();
	}

	@Override
	public int updateFC(Fullcalendar fc) {
		// TODO Auto-generated method stub
		return fullcalendardao.updateFC(fc);
	}

	@Override
	public int deleteFC(Fullcalendar fc) {
		// TODO Auto-generated method stub
		return fullcalendardao.deleteFC(fc);
	}

}
