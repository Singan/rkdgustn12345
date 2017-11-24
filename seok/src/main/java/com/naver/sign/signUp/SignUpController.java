package com.naver.sign.signUp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.member.controller.MemberController;
import com.naver.member.service.MemberService;
import com.naver.member.serviceImp.MemberServiceImp;
import com.naver.repository.domain.Member;

@Controller
public class SignUpController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/sign/signForm")
	public void signForm() {}
	
	@RequestMapping("/sign/signUp.do")
	public String signUp(@ModelAttribute("member") Member member, RedirectAttributes attr) {
		String id = member.getMemberId();
		System.out.println(member.getMemberId());
		
		try {
			//memberService.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		attr.addFlashAttribute("msg", "가입이 완료되었습니다. 로그인을 해주세요");
		return "redirect:/sign/loginForm.do";
	}
}

