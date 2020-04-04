package com.kh.ifwe.fullcalendar.model.service;

import java.util.List;

import com.kh.ifwe.fullcalendar.model.vo.Fullcalendar;

public interface FullcalendarService {

	void addFullcalendar(Fullcalendar fullcalendar);

	List<Fullcalendar> selectList();

	int updateFC(Fullcalendar fc);

	int deleteFC(Fullcalendar fc);

}
