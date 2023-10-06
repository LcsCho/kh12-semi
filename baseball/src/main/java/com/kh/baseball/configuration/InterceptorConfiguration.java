package com.kh.baseball.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.baseball.interceptor.AdminInterceptor;
import com.kh.baseball.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
@Autowired
MemberInterceptor memberInterceptor;

@Autowired
	private AdminInterceptor adminInterceptor;


@Override
	public void addInterceptors(InterceptorRegistry registry) {
//	pathpattern 은 아직 안정해둠 필효하면 추가하세요
	registry.addInterceptor(memberInterceptor).addPathPatterns(		"/member/**",
			"/board/**",
			"/rest/reply/**",
			"/member/**"
	)
	.excludePathPatterns(
			"/member/join*",
			"/member/login",
			"/member/exitFinish",
			"/member/find**",
			"/board/list*",
			"/board/detail",
			"/rest/reply/list"

	);
	
	registry.addInterceptor(adminInterceptor)
	.addPathPatterns(
			"/admin/**");
}
}

