package com.bitcamp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bitcamp.member.model.MemberDto;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");

	if (memberDto==null) {
//		request.setAttribute("msg", "로그인을 해주세요.");
		response.sendRedirect(request.getContextPath() + "/badmin/main.bit");
		return false;
	}else {
		return true;
	} 
	
	}}
