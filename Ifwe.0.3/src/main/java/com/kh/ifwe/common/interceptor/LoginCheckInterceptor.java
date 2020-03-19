package com.kh.ifwe.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.ifwe.member.model.vo.Member;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		//로그인여부를 확인후 
		//로그인하지 않았다면 return false처리하기
		//사용자 알림메세지 전달
		
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		if(memberLoggedIn == null) {
			String msg = "로그인 후 이용하실 수 있습니다.";
			session.setAttribute("msg", msg);
			
			response.sendRedirect(request.getContextPath());//localhost:9090/spring
			
			return false;
		}
		
		
		
		
		return super.preHandle(request, response, handler);
	}
	
	
}
