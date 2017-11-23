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
		for (Diary d : diarymapper.page(diary)) {
			System.out.println("먼스"+d.getDiaryMonth());
			System.out.println("연도"+d.getDiaryYear());
		}
		return diarymapper.page(diary);
	}

}
