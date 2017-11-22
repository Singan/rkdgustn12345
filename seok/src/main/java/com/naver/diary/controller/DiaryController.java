package com.naver.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	@RequestMapping("/diary.do")
	public String diary(){
		System.out.println("들어왔따");
		return "/diary/diary";
	}
	
}
