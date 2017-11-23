package com.naver.diary.service;

import java.util.Date;
import java.util.List;

import com.naver.repository.domain.Diary;

public interface DiaryService {
	public List<Diary> page(Diary diary);
}
