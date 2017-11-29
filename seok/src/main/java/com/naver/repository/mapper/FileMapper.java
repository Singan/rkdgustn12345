package com.naver.repository.mapper;

import java.util.List;

import com.naver.repository.domain.File;

public interface FileMapper {
	public void insertFile(File file);
	public int selectGroupNo();
	public List<File> selectFileList(int groupNo);
}
