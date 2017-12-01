package com.naver.lunch.service;

import java.util.List;

import com.naver.repository.domain.Lunch;

public interface LunchService {
	public List<Lunch> selectLunchList();
	public void saveLunch(Lunch lunch);
}
