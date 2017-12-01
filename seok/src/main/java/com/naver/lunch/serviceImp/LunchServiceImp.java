package com.naver.lunch.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.lunch.service.LunchService;
import com.naver.repository.domain.Lunch;
import com.naver.repository.mapper.LunchMapper;
@Service
public class LunchServiceImp implements LunchService{
	@Autowired
	LunchMapper lunchMapper;
	@Override
	public List<Lunch> selectLunchList() {
		return lunchMapper.selectLunchList();
	}
	@Override
	public void saveLunch(Lunch lunch) {
		lunchMapper.insertLunch(lunch);
		
	}

}
