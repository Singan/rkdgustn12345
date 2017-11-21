package com.naver.repository.domain;

//카테고리 카테고리 테이블
public class Category {

 // 카테고리 번호 
 private Integer categoryNo;

 // 카테고리 이름 
 private String categoryName;

 // 카테고리 주소 
 private String categoryUrl;

 public Integer getCategoryNo() {
     return categoryNo;
 }

 public void setCategoryNo(Integer categoryNo) {
     this.categoryNo = categoryNo;
 }

 public String getCategoryName() {
     return categoryName;
 }

 public void setCategoryName(String categoryName) {
     this.categoryName = categoryName;
 }

 public String getCategoryUrl() {
     return categoryUrl;
 }

 public void setCategoryUrl(String categoryUrl) {
     this.categoryUrl = categoryUrl;
 }

 // ToCategory 모델 복사
 public void CopyData(Category param)
 {
     this.categoryNo = param.getCategoryNo();
     this.categoryName = param.getCategoryName();
     this.categoryUrl = param.getCategoryUrl();
 }
}
