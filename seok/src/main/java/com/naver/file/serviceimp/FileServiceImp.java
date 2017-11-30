package com.naver.file.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.file.service.FileService;
import com.naver.repository.domain.File;
import com.naver.repository.mapper.FileMapper;

@Service("fileService")
public class FileServiceImp implements FileService{

	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public void insertFile(File file) {
		fileMapper.insertFile(file);
	}

	@Override
	public int selectGroupNo() {
		return fileMapper.selectGroupNo();
	}

	@Override
	public List<File> selectFileList(int groupNo) {
		return fileMapper.selectFileList(groupNo);
	}
}
