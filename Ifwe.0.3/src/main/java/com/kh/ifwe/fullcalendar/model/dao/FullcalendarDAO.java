package com.kh.ifwe.fullcalendar.model.dao;

import java.util.List;

import com.kh.ifwe.fullcalendar.model.vo.Fullcalendar;

public interface FullcalendarDAO {

	void addFullcalendar(Fullcalendar fullcalendar);

	List<Fullcalendar> selectList();

	int updateFC(Fullcalendar fc);

	int deleteFC(Fullcalendar fc);

}
