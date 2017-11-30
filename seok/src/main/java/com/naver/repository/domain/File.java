package com.naver.repository.domain;

import org.springframework.web.multipart.MultipartFile;

//파일 파일 정보 테이블
public class File {
	
	private MultipartFile[] attachFiles;
	private MultipartFile[] imageFiles;
	
	public MultipartFile[] getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(MultipartFile[] imageFiles) {
		this.imageFiles = imageFiles;
	}

	public MultipartFile[] getAttachFiles() {
		return attachFiles;
	}

	public void setAttachFiles(MultipartFile[] attachFiles) {
	
	}
	
// 파일 번호 
 private Integer fileNo;
 

// 파일 그룹 번호 
 private Integer fileGroupNo;

 // 파일 경로 첨부 파일 경로, ;를 구분자로 사용
 private String filePath;

 // 파일 원본 이름 업로더 기준 파일의 본래 이름
 private String fileOriginName;

 public Integer getFileNo() {
     return fileNo;
 }
 public String fileSystemName;

 public String getFileSystemName() {
	return fileSystemName;
}

public void setFileSystemName(String fileSystemName) {
	this.fileSystemName = fileSystemName;
}

public void setFileNo(Integer fileNo) {
     this.fileNo = fileNo;
 }

 public Integer getFileGroupNo() {
     return fileGroupNo;
 }

 public void setFileGroupNo(Integer fileGroupNo) {
     this.fileGroupNo = fileGroupNo;
 }

 public String getFilePath() {
     return filePath;
 }

 public void setFilePath(String filePath) {
     this.filePath = filePath;
 }

 public String getFileOriginName() {
     return fileOriginName;
 }

 public void setFileOriginName(String fileOriginName) {
     this.fileOriginName = fileOriginName;
 }

 // File 모델 복사
 public void CopyData(File param)
 {
     this.fileNo = param.getFileNo();
     this.fileGroupNo = param.getFileGroupNo();
     this.filePath = param.getFilePath();
     this.fileOriginName = param.getFileOriginName();
 }
}
