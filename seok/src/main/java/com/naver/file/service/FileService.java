package com.naver.file.service;

import java.util.List;

import com.naver.repository.domain.File;

public interface FileService {
	public void insertFile(File file);
	public int selectGroupNo();
	public List<File> selectFileList(int groupNo);
}
