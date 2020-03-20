package com.kh.ifwe.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggerAspect {

	//AroundAdvice 테스트
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) 
												throws Throwable{
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName();//클래스
		String methodName = signature.getName();
		
		
		Object obj = joinPoint.proceed(); 
		
		
		return obj;
	}
	
}
