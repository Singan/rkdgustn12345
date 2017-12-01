package com.naver.lunch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.lunch.service.LunchService;
import com.naver.repository.domain.Lunch;

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
	@RequestMapping("/map.do")
	public String diary() {
		return "/lunch/Map";
	}
	@ResponseBody
	@RequestMapping("/save.json")
	public void save(Lunch lunch){
		lunchService.saveLunch(lunch);
		System.out.println(lunch.toString());
	}
}
