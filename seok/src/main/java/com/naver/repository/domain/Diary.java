package com.naver.repository.domain;
//달력 스케쥴 테이블
public class Diary {

 // 년 
 private Integer diaryYear;

 // 월 
 private Integer diaryMonth;

 // 일 
 private Integer diaryDay;

 // 스케쥴 내용 
 private String diaryContent;

 // 파일 그룹 번호 
 private Integer fileGroupNo;

 public Integer getDiaryYear() {
     return diaryYear;
 }

 public void setDiaryYear(Integer diaryYear) {
     this.diaryYear = diaryYear;
 }

 public Integer getDiaryMonth() {
     return diaryMonth;
 }

 public void setDiaryMonth(Integer diaryMonth) {
     this.diaryMonth = diaryMonth;
 }

 public Integer getDiaryDay() {
     return diaryDay;
 }

 public void setDiaryDay(Integer diaryDay) {
     this.diaryDay = diaryDay;
 }

 public String getDiaryContent() {
     return diaryContent;
 }

 public void setDiaryContent(String diaryContent) {
     this.diaryContent = diaryContent;
 }

 public Integer getFileGroupNo() {
     return fileGroupNo;
 }

 public void setFileGroupNo(Integer fileGroupNo) {
     this.fileGroupNo = fileGroupNo;
 }

 // ToDiary 모델 복사
 public void CopyData(Diary param)
 {
     this.diaryYear = param.getDiaryYear();
     this.diaryMonth = param.getDiaryMonth();
     this.diaryDay = param.getDiaryDay();
     this.diaryContent = param.getDiaryContent();
     this.fileGroupNo = param.getFileGroupNo();
 }
}