package com.naver.repository.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

//게시판 게시글 테이블
public class Board {
	String id;
	
	private MultipartFile[] attachFiles;
	private MultipartFile[] imageFiles;
	// 게시글 번호
	private Integer boardNo;

	public MultipartFile[] getAttachFiles() {
		return attachFiles;
	}
	
	

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public void setAttachFiles(MultipartFile[] attachFiles) {
		this.attachFiles = attachFiles;
	}

	public MultipartFile[] getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(MultipartFile[] imageFiles) {
		this.imageFiles = imageFiles;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	// 카테고리 번호
	private Integer categoryNo;

	// 게시글 제목
	private String boardName;

	// 게시글 작성자
	private String boardWriter;

	// 게시글 조회수
	private Integer boardViews;

	// 회원 번호
	private Integer memberNo;

	// 게시글 작성일
	private String boardDate;

	// 게시글 추천
	private Integer boardUp;

	// 게시글 비추천
	private Integer boardDown;

	// 게시글 내용
	private String boardContent;

	// 파일 그룹 번호
	private Integer fileGroupNo;

	// 게시글 사진 경로 게시글 내에 직접 표시할 사진 파일 경로, ;를 구분자로 사용
	private String boardImagePath;

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public Integer getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public Integer getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(Integer boardViews) {
		this.boardViews = boardViews;
	}

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:dd:ss");

		String date = sdf.format(boardDate);
		this.boardDate = date;
	}

	public Integer getBoardUp() {
		return boardUp;
	}

	public void setBoardUp(Integer boardUp) {
		this.boardUp = boardUp;
	}

	public Integer getBoardDown() {
		return boardDown;
	}

	public void setBoardDown(Integer boardDown) {
		this.boardDown = boardDown;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Integer getFileGroupNo() {
		return fileGroupNo;
	}

	public void setFileGroupNo(Integer fileGroupNo) {
		this.fileGroupNo = fileGroupNo;
	}

	public String getBoardImagePath() {
		return boardImagePath;
	}

	public void setBoardImagePath(String boardImagePath) {
		this.boardImagePath = boardImagePath;
	}

	// ToBoard 모델 복사
	public void CopyData(Board param) {
		this.boardNo = param.getBoardNo();
		this.categoryNo = param.getCategoryNo();
		this.boardName = param.getBoardName();
		this.boardWriter = param.getBoardWriter();
		this.boardViews = param.getBoardViews();
		this.memberNo = param.getMemberNo();
		this.boardDate = param.getBoardDate();
		this.boardUp = param.getBoardUp();
		this.boardDown = param.getBoardDown();
		this.boardContent = param.getBoardContent();
		this.fileGroupNo = param.getFileGroupNo();
		this.boardImagePath = param.getBoardImagePath();
	}
}
