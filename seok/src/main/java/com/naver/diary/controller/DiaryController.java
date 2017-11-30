package com.naver.diary.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.naver.diary.service.DiaryService;
import com.naver.repository.domain.Diary;


@Controller
@RequestMapping("/diary")
public class DiaryController {
	@Autowired
		DiaryService diaryService;
	@RequestMapping("/diary.do")
	public String diary(){
		return "/diary/diary";
	}
	
	@ResponseBody
	@RequestMapping("/createDiary.json")
	public List<Diary> createDiary(Diary diary){
		return  diaryService.page(diary);
	}
	
	@ResponseBody
	@RequestMapping("/save.json" /* method=RequestMethod.POST*/)
	public Diary fileSave(Diary diary){
		System.out.println(diary.toString());
		
		return diaryService.save(diary);
	}
	
	
	
}
