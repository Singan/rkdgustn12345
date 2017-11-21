package com.naver.repository.domain;

//회원 회원 정보 테이블
public class MemberDomain {

 // 회원 번호 
 private Integer memberNo;

 // 회원 아이디 
 private String memberId;

 // 회원 비밀번호 
 private String memberPass;

 // 회원 이메일 
 private String memberEmail;

 // 회원 이름 
 private String memberName;

 public Integer getMemberNo() {
     return memberNo;
 }

 public void setMemberNo(Integer memberNo) {
     this.memberNo = memberNo;
 }

 public String getMemberId() {
     return memberId;
 }

 public void setMemberId(String memberId) {
     this.memberId = memberId;
 }

 public String getMemberPass() {
     return memberPass;
 }

 public void setMemberPass(String memberPass) {
     this.memberPass = memberPass;
 }

 public String getMemberEmail() {
     return memberEmail;
 }

 public void setMemberEmail(String memberEmail) {
     this.memberEmail = memberEmail;
 }

 public String getMemberName() {
     return memberName;
 }

 public void setMemberName(String memberName) {
     this.memberName = memberName;
 }

 // ToMember 모델 복사
 public void CopyData(MemberDomain param)
 {
     this.memberNo = param.getMemberNo();
     this.memberId = param.getMemberId();
     this.memberPass = param.getMemberPass();
     this.memberEmail = param.getMemberEmail();
     this.memberName = param.getMemberName();
 }
}
