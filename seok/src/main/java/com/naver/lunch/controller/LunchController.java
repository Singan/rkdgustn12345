package com.naver.lunch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.lunch.service.LunchService;

@Controller
@RequestMapping("/lunch")
public class LunchController {
	@Autowired
	LunchService lunchService;

	@RequestMapping("/lunch.do")
	public String lunchSelect(Model model) {
		model.addAttribute("lunchList",lunchService.selectLunchList());
		
		return "/lunch/LoadMap";
	}
	@RequestMapping("/test.do")
	public void diary() {
		return;
	}
}
