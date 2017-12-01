package com.naver.repository.mapper;

import java.util.List;

import com.naver.repository.domain.Lunch;

public interface LunchMapper {
	public List<Lunch> selectLunchList();
	public void insertLunch(Lunch lunch);
	
}
