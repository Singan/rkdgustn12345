package com.naver.diary.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.repository.domain.Diary;

public interface DiaryService {
	public List<Diary> page(Diary diary) ;
	public void save(Diary diary);
}
