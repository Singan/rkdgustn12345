package com.naver.repository.domain;

//쪽지 쪽지 테이블
public class Message {

 // 쪽지 번호 
 private Integer messageNo;

 // 쪽지 내용 
 private String messageContent;

 // 발신자 이름 
 private String senderName;

 // 발신자 아이디 
 private String senderId;

 // 수신자 이름 
 private String receiverName;

 // 수신자 아이디 
 private String receiverId;

 public Integer getMessageNo() {
     return messageNo;
 }

 public void setMessageNo(Integer messageNo) {
     this.messageNo = messageNo;
 }

 public String getMessageContent() {
     return messageContent;
 }

 public void setMessageContent(String messageContent) {
     this.messageContent = messageContent;
 }

 public String getSenderName() {
     return senderName;
 }

 public void setSenderName(String senderName) {
     this.senderName = senderName;
 }

 public String getSenderId() {
     return senderId;
 }

 public void setSenderId(String senderId) {
     this.senderId = senderId;
 }

 public String getReceiverName() {
     return receiverName;
 }

 public void setReceiverName(String receiverName) {
     this.receiverName = receiverName;
 }

 public String getReceiverId() {
     return receiverId;
 }

 public void setReceiverId(String receiverId) {
     this.receiverId = receiverId;
 }

 // Message 모델 복사
 public void CopyData(Message param)
 {
     this.messageNo = param.getMessageNo();
     this.messageContent = param.getMessageContent();
     this.senderName = param.getSenderName();
     this.senderId = param.getSenderId();
     this.receiverName = param.getReceiverName();
     this.receiverId = param.getReceiverId();
 }
}
