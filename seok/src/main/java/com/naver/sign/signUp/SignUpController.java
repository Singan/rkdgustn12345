package com.naver.sign.signUp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.repository.domain.Member;

@Controller
public class SignUpController {
	@RequestMapping("/sign/signForm")
	public void signForm() {}
	
	
	
	@RequestMapping("/sign/signUp.do")
	public String signUp(Member member, RedirectAttributes attr) {
		attr.addFlashAttribute("msg", "가입이 완료되었습니다. 로그인을 해주세요");
		return "redirect:/sign/login.do";
	}
}

