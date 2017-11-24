package com.naver.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.member.service.MemberService;
import com.naver.repository.domain.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Transactional
	public void selectMember() throws Exception {
		List<Member> list = memberService.selectMember(); 
	}
	
	@Transactional
	public void insertMember(Member member) throws Exception {
		memberService.insertMember(member);
	}
}
