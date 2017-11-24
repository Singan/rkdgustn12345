package com.naver.sign.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.repository.domain.Member;

@Controller
public class LoginController {
	@RequestMapping("/sign/loginForm") 
	public String loginForm() {
		return "redirect:/loginForm.jsp";
	}

	@RequestMapping("/sign/main") 
	public void sign() {}
	
	@RequestMapping("/sign/login.do")
	public String login(HttpSession session, RedirectAttributes attr) {
		Member member = new Member();
		member.setMemberId("admin");
		member.setMemberPass("1234");
		member.setMemberName("관리자");
		member.setMemberNo(1);
		member.setMemberEmail("standoff@naver.com");
		session.setAttribute("user", member); 
		attr.addFlashAttribute("msg", "로그인 되었습니다.");
		return "redirect:/sign/main.do";
	}
	
	@RequestMapping("/sign/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/sign/loginForm.do";
	}
}
