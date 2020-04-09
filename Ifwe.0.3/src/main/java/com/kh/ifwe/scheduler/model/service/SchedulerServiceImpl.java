package com.kh.ifwe.scheduler.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.scheduler.model.dao.SchedulerDAO;
import com.kh.ifwe.scheduler.model.vo.LoginRecord;
import com.kh.ifwe.scheduler.model.vo.SixmonthCheck;

@Service
public class SchedulerServiceImpl implements SchedulerService {

	@Autowired
	SchedulerDAO schedulerdao;

	@Override
	public List<Member> selectMemberList() {
		return schedulerdao.selectMemberList();
	}

	@Override
	public List<LoginRecord> selectloginRecord(int memberCode) {
		// TODO Auto-generated method stub
		return schedulerdao.selectloginRecord(memberCode);
	}

	@Override
	public List<SixmonthCheck> sixmonthList() {
	
		return schedulerdao.sixmonthList();
	}

	@Override
	public int sleepChange(int memberCode) {
		// TODO Auto-generated method stub
		return schedulerdao.sleepChange(memberCode);
	}

	@Override
	public List<SixmonthCheck> sixmonthList(int memberCode) {
		// TODO Auto-generated method stub
		return schedulerdao.sixmonthList(memberCode);
	}
	
}
