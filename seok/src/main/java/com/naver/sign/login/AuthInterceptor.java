package com.naver.sign.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.naver.repository.domain.Member;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		
		if (member != null) {
			return true;
		}
		
		response.sendRedirect("redirect:/sign/login.do");
		return false;
	}
}
