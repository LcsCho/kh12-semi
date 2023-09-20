package com.kh.basball.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.baseball.error.AuthorityException;

public class MemberInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String memberId = (String) session.getAttribute("name");
		boolean isLogin = memberId != null;
		
		if (isLogin) {
			return true;
		}
		else {
			throw new AuthorityException("로그인 후 이용 가능");
		} 
		
		
	}

}
