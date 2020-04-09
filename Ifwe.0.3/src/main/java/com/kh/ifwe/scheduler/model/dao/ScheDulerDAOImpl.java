package com.kh.ifwe.scheduler.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.scheduler.model.vo.LoginRecord;
import com.kh.ifwe.scheduler.model.vo.SixmonthCheck;

@Repository
public class ScheDulerDAOImpl implements SchedulerDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Member> selectMemberList() {
		return sqlSession.selectList("schedule.scheduleSelectMemberList");
	}


	@Override
	public List<LoginRecord> selectloginRecord(int memberCode) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<SixmonthCheck> sixmonthList() {
		// TODO Auto-generated method stub
//		return sqlSession.selectList("schedule.sixmonthList");
		return null;
	}


	@Override
	public int sleepChange(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.update("schedule.changeSleep",memberCode);
	}


	@Override
	public List<SixmonthCheck> sixmonthList(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.sixmonthList",memberCode);
	}
}
