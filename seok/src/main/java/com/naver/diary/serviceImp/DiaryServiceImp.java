package com.naver.diary.serviceImp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naver.diary.service.DiaryService;
import com.naver.repository.domain.Diary;
import com.naver.repository.domain.File;
import com.naver.repository.mapper.DiaryMapper;
import com.naver.repository.mapper.FileMapper;

@Service
public class DiaryServiceImp implements DiaryService {
	@Autowired
	DiaryMapper diarymapper;
	@Autowired
	FileMapper filemapper;
	@Autowired
	ServletContext servletContext;

	@Override
	public List<Diary> page(Diary diary) {
		List<Diary> listDiary = diarymapper.page(diary);
		for (Diary dia : listDiary) {
			dia.setFile(filemapper.selectFileList(dia.getFileGroupNo()));
		}
		return listDiary;
	}

	@Override
	public void save(Diary diary) {
		Integer groupNo =null;
		Date d = new Date();
		String uploadDir = servletContext.getRealPath("/upload/"+d.getYear()+"/"+d.getMonth()+"/"+d.getDate());
		java.io.File ff = new java.io.File(uploadDir);
		
		for(MultipartFile file : diary.getAttach()){
			File f = new File();
			String originName = file.getOriginalFilename();
			if(file.isEmpty()){
				continue;}
			if(!ff.exists()) ff.mkdirs();
			groupNo=diary.getFileGroupNo()==null?filemapper.selectGroupNo():diary.getFileGroupNo();
			f.setFileGroupNo(groupNo); // 그룹넘버
			f.setFileOriginName(originName); // 원래이름
			// 확장자 빼기용
			String ext = "";
			// 뒤쪽에 있는 . 의 위치 
			int index = originName.lastIndexOf(".");
			if (index != -1) {
				// 파일명에서 확장자명(.포함)을 추출
				ext = originName.substring(index);
			}
			f.setFilePath(uploadDir);
			String systemName = UUID.randomUUID().toString() + d.getTime() + ext;
			f.setFileSystemName(systemName);
			filemapper.insertFile(f);
			try {
				file.transferTo(new java.io.File(uploadDir+"/"+systemName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(groupNo);
		diary.setFileGroupNo(groupNo);
		diarymapper.insertAndUpset(diary);
	}
}
