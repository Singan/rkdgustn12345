package com.naver.sign.login;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.member.service.MemberService;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/sign")
public class LoginController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/loginForm.do")
	public void loginForm() {} 
	
	@RequestMapping("/login.do")
	public String login(
			@ModelAttribute("member") Member member,
			HttpSession session, 
			RedirectAttributes attr) throws Exception{
		
		
		String id = member.getMemberId();
		List<Member> memberList = memberService.selectMember();
		Iterator<Member> iterator =  memberList.iterator();
		
		while(iterator.hasNext()) {
			if(iterator.next().getMemberId().equals(id)) {
				
				member = memberService.detailMember(id);
				
				session.setAttribute("user", member); 
				attr.addFlashAttribute("msg", member.getMemberId()+ "님이 로그인 되었습니다.");
				return "/main/main";
			}
		}
		
		attr.addFlashAttribute("msg", "없는 아이디 입니다.");
		return "redirect:/sign/loginForm.do";
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/sign/loginForm.do";
	}
}
