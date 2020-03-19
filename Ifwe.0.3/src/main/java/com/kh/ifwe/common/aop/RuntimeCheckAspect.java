package com.kh.ifwe.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * memo.controller.MemoController.insertMemo의 실행시간을 구하세요.
 * org.springframework.util.Stopwatch를 사용하세요.
 *
 */
@Component
@Aspect
@Slf4j
public class RuntimeCheckAspect {
	
//	@Pointcut("execution(* com.kh.spring.memo.controller.MemoController.insertMemo(..))")
	@Pointcut("execution(* com.kh..*insert*(..))")
	public void pointcut() {}
	
	
	@Around("pointcut()")
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable{
		//Target메소드 실행전 코드 
		StopWatch sw = new StopWatch();
		sw.start();
		log.debug("시간 측정 시작 {}");
		Object obj = joinPoint.proceed();
		
		sw.stop();
		Long time = sw.getTotalTimeMillis();

		//Target메소드 실행후 코드 
		log.debug("시간 측정 종료 {}millis",time);
		
		return obj;
	}

	
	
	
}
