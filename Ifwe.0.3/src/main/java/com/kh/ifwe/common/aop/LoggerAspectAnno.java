package com.kh.ifwe.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LoggerAspectAnno {

	@Pointcut("execution(* com.kh.spring.memo..*(..))")
	public void pointcut() {}
	//이곳에서 적용할 곳을 찾아낸 것이다. 메소드명이 중요하지 않은 이유! 어노테이션에서 내용을 선언하기때문이다.
	//( 즉 스프링프레임워크에서 제공되는 경로추적이라고 볼 수 있다.)
	
	//첫번째 * 의 의미 : 어떤 식으로 접근한지 여부를 가리지 않겠다. 
	//원래는 접근제어자(public, protected, private), 리턴타입(string, int 등)을 구분한다.
	
	
	
	
	//AroundAdvice 테스트
	@Around("pointcut()")
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) 
												throws Throwable{
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName();//클래스
		String methodName = signature.getName();
		
		
		Object obj = joinPoint.proceed(); 
		
		
		return obj;
	}
	
}
