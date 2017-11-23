package com.naver.repository.domain;

import java.util.Date;

//친구 친구정보 테이블
public class Friend {

 // 회원 번호 
 private Integer memberNo;

 // 친구 번호 상대 번호
 private Integer friendNo;

 // 친구 날짜 친구 등록 일시
 private Date friendDate;

 public Integer getMemberNo() {
     return memberNo;
 }

 public void setMemberNo(Integer memberNo) {
     this.memberNo = memberNo;
 }

 public Integer getFriendNo() {
     return friendNo;
 }

 public void setFriendNo(Integer friendNo) {
     this.friendNo = friendNo;
 }

 public Date getFriendDate() {
     return friendDate;
 }

 public void setFriendDate(Date friendDate) {
     this.friendDate = friendDate;
 }

 // Friend 모델 복사
 public void CopyData(Friend param)
 {
     this.memberNo = param.getMemberNo();
     this.friendNo = param.getFriendNo();
     this.friendDate = param.getFriendDate();
 }
}
