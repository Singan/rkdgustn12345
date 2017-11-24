package com.naver.sign.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.member.service.MemberService;
import com.naver.repository.domain.Member;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/sign/loginForm.do") 
	public void loginForm() {
	}

	@RequestMapping("/main/main") 
	public void sign() {}
	
	@RequestMapping("/sign/login.do")
	public String login(
			@ModelAttribute("member") Member member,
			HttpSession session, RedirectAttributes attr) {
		String id = member.getMemberId();
		try {
			member = memberService.detailMember(id);
			if(member == null) {
				attr.addFlashAttribute("msg", "없는 아이디 입니다.");
				return "redirect:/sign/loginForm.do";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	/*	
		member.setMemberId("admin");
		member.setMemberPass("1234");
		member.setMemberName("관리자");
		member.setMemberNo(1);
		member.setMemberEmail("standoff@naver.com");*/
		
		System.out.println(member.getMemberEmail());
		System.out.println(member.getMemberPass());
		System.out.println(member.getMemberName());
		System.out.println(member.getMemberNo());
		System.out.println(member.getMemberId());
		
		session.setAttribute("user", member); 
		attr.addFlashAttribute("msg", member.getMemberId()+ "님이 로그인 되었습니다.");
		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/sign/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/sign/loginForm.do";
	}
}
