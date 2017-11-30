package com.naver.repository.mapper;

import java.util.List;

import com.naver.repository.domain.Diary;
import com.naver.repository.domain.File;

public interface DiaryMapper {
	public List<Diary> page(Diary diary) ;
	public void insertAndUpset(Diary diary);
	public Diary selectOne(Diary diary);
	
}
