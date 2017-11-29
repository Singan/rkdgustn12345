package com.naver.repository.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
	// 댓글 댓글 테이블

	// 댓글 번호
	private Integer commentNo;

	// 게시글 번호
	private Integer boardNo;

	// 댓글 내용
	private String commentContent;

	// 댓글 작성일
	private String commentDate;

	// 회원 이름 작성자 이름
	private String memberName;

	public Integer getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:dd:ss");
		String date = sdf.format(commentDate);

		this.commentDate = date;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	// ToComment 모델 복사
	public void CopyData(Comment param) {
		this.commentNo = param.getCommentNo();
		this.boardNo = param.getBoardNo();
		this.commentContent = param.getCommentContent();
		this.commentDate = param.getCommentDate();
		this.memberName = param.getMemberName();
	}
}
