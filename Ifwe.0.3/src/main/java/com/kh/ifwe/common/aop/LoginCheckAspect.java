package com.kh.ifwe.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class LoginCheckAspect {
	
	@Pointcut("execution(* com.kh.spring.member.controller.MemberController.login(..))")
	public void pointcut() {}
	
	
	@AfterReturning(pointcut="pointcut()", returning="returnObj")
	public void afterReturningAdvice(JoinPoint joinPoint, Object returnObj) {
		//타겟메소드의 리턴 데이터를 다른 용도로 처리할 때 사용함.
		log.debug("리턴값  = "+returnObj);
	}
}
