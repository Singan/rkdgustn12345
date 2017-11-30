package com.naver.sign.login;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void loginForm(String url,Model model) {
		model.addAttribute("url",url);
	} 
	
	
	
	@RequestMapping("/login.do")
	public String login(
			@ModelAttribute("member") Member member,
			HttpSession session, 
			Model model,
			RedirectAttributes attr,
			String url) throws Exception{
		
		
		String id = member.getMemberId();
		List<Member> memberList = memberService.selectMember();
		Iterator<Member> iterator =  memberList.iterator();
		
		
		while(iterator.hasNext()) {
			if(iterator.next().getMemberId().equals(id)) {
				member = memberService.detailMember(id);
				session.setAttribute("user", member); 
				// attr.addFlashAttribute("msg", member.getMemberId()+ "님이 로그인 되었습니다.");
				System.out.println(url);
				if(url.contains("main")) {
					return "redirect:/main/chatMove.do";
				}
				
				model.addAttribute("msg", member.getMemberId()+ "님이 로그인 되었습니다.");
				return "redirect:/main/main.do";
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
