package com.naver.diary.serviceImp;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.diary.service.DiaryService;
import com.naver.repository.domain.Diary;
import com.naver.repository.mapper.DiaryMapper;
@Service
public class DiaryServiceImp implements DiaryService{
	@Autowired
		DiaryMapper diarymapper;
	
	@Override
	public List<Diary> page(Diary diary) {
		
		return diarymapper.page(diary);
	}

}
