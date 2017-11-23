package com.naver.diary.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.diary.service.DiaryService;
import com.naver.repository.domain.Diary;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	@Autowired
		DiaryService diaryService;
	@RequestMapping("/diary.do")
	public String diary(Diary diary,Model model){
		
		model.addAttribute("dList", diaryService.page(diary));
		model.addAttribute("test", 123123123);
		return "/diary/diary";
	}
	
}
