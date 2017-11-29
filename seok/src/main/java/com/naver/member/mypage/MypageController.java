package com.naver.member.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.member.service.MemberService;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/myPage.do")
	public void myPage(){}
	
	@RequestMapping("/profile.do")
	public void profile(){}
	
	@RequestMapping("/message.do")
	public void message(){}
	
	@RequestMapping("/friend.do")
	public void friend(){}
}
