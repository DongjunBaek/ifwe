package com.kh.ifwe.scheduler.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.scheduler.model.vo.LoginRecord;
import com.kh.ifwe.scheduler.model.vo.SixmonthCheck;


public interface SchedulerDAO {

	List<Member> selectMemberList();

	List<LoginRecord> selectloginRecord(int memberCode);

	List<SixmonthCheck> sixmonthList();

	int sleepChange(int memberCode);

	List<SixmonthCheck> sixmonthList(int memberCode);


	
}
