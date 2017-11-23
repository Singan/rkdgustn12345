package com.naver.repository.domain;

import java.util.Date;

//답변 질문게시판 답변 테이블
public class Answer {

 // 답변 번호 
 private Integer answerNo;

 // 게시글 번호 
 private Integer boardNo;

 // 답변 내용 
 private String answerContent;

 // 답변 날짜 
 private Date answerDate;

 public Integer getAnswerNo() {
     return answerNo;
 }

 public void setAnswerNo(Integer answerNo) {
     this.answerNo = answerNo;
 }

 public Integer getBoardNo() {
     return boardNo;
 }

 public void setBoardNo(Integer boardNo) {
     this.boardNo = boardNo;
 }

 public String getAnswerContent() {
     return answerContent;
 }

 public void setAnswerContent(String answerContent) {
     this.answerContent = answerContent;
 }

 public Date getAnswerDate() {
     return answerDate;
 }

 public void setAnswerDate(Date answerDate) {
     this.answerDate = answerDate;
 }

 // Answer 모델 복사
 public void CopyData(Answer param)
 {
     this.answerNo = param.getAnswerNo();
     this.boardNo = param.getBoardNo();
     this.answerContent = param.getAnswerContent();
     this.answerDate = param.getAnswerDate();
 }
}
