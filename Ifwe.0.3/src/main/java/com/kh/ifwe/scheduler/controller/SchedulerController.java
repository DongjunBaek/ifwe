package com.kh.ifwe.scheduler.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.scheduler.model.service.SchedulerService;
import com.kh.ifwe.scheduler.model.vo.LoginRecord;
import com.kh.ifwe.scheduler.model.vo.SixmonthCheck;

@Controller
@Component
public class SchedulerController {

	@Autowired
	SchedulerService scheduleservice;
	
	 private static final Logger logger = LoggerFactory.getLogger(SchedulerController.class);
	 
	 private static final long RUN_TASK_30_SEC = 10000L;
	
	 
	 //서버 실행될때 시작이 되고
	@PostConstruct
	// 10초마다
	//@Scheduled(fixedDelay = RUN_TASK_30_SEC)
	// 5분마다
	//@Scheduled(cron="* */5 * * * *")
	//매일 5시마다
	@Scheduled(cron="0 0 17 * * *")
	public void scheduleRun() {
	
	
	List<Member> memberList=scheduleservice.selectMemberList();
	
	
	for (int j = 0; j < memberList.size(); j++) {

		
		//최종 로그인 6개월 이상인 회원목록 출력

//		List<SixmonthCheck> sixmonthList = scheduleservice.sixmonthList();
		
		

		List<SixmonthCheck> sixmonthList = scheduleservice.sixmonthList(memberList.get(j).getMemberCode());
		
		
		
		
		
		
		
		
		
		

		//가져온 회원 코드로 member_role H로 변경
		for (int i = 0; i < sixmonthList.size(); i++) {
		
			
			System.out.println(sixmonthList.get(i).toString());
			
			if(Integer.parseInt(sixmonthList.get(i).getSixmonth())>180) {
			
		 int memberCode= Integer.parseInt(sixmonthList.get(i).getMemberCode());
			
		 int result= scheduleservice.sleepChange(memberCode);}
		 
		}
		



		
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
}
