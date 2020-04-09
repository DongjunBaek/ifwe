package com.kh.ifwe.scheduler.model.service;

import java.util.List;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.scheduler.model.vo.LoginRecord;
import com.kh.ifwe.scheduler.model.vo.SixmonthCheck;

public interface SchedulerService {

	List<Member> selectMemberList();

	List<LoginRecord> selectloginRecord(int i);

	List<SixmonthCheck> sixmonthList();

	int sleepChange(int memberCode);

	List<SixmonthCheck> sixmonthList(int memberCode);

}
