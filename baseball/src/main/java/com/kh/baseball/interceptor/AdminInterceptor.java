package com.kh.baseball.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.baseball.error.AuthorityException;



@Component
public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String level = (String) session.getAttribute("level");
		boolean isAdmin = level != null && level.equals("관리자");
		
		if(isAdmin) {//관리자라면
			return true;//통과
		}
		else {//관리자가 아니라면(VIP, 일반, 비회원)
			//return false;//차단
			throw new AuthorityException("관리자만 이용 가능합니다");
		}
	}
}
