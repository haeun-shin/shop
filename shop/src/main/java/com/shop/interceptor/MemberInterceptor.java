package com.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.shop.domain.MemberVO;

public class MemberInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 세션에 있는 로그인 정보 get
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 로그인 상태가 아니라면 login 페이지로 이동
		if(member == null) {
			response.sendRedirect("/member/signin");
			return false;
		}
		
		// 로그인 시 Controller 호출
		return true;
	}
	
}
