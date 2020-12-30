package com.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.shop.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 비로그인 상태로 접근 시 로그인 화면으로
		if(member == null) {
			response.sendRedirect("/member/signin");
			
			return false;
		}
		
		// 관리자 상태가 아닐 시 홈으로 
		if(member.getVerify() != 9) {
			response.sendRedirect("/");
			
			return false;
		}
		
		return true;
	}
	
}
