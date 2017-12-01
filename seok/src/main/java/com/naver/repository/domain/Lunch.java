package com.naver.repository.domain;

// 점심 식당 정보 테이블
public class Lunch {

    // 점심 번호 
    private Integer lunchNo;

    // 회원 이름 식당 정보 작성자의 회원번호
    private String memberName;
    // 위도 
    private Float lng;

    @Override
	public String toString() {
		return "Lunch [lunchNo=" + lunchNo + ", memberName=" + memberName + ", lng=" + lng + ", lat=" + lat
				+ ", lunchReview=" + lunchReview + ", lunchAddr=" + lunchAddr + ", lunchRate=" + lunchRate
				+ ", lunchName=" + lunchName + "]";
	}

	// 경도 
    private Float lat;

    // 점심 리뷰 식당 리뷰
    private String lunchReview;

    // 점심 주소 식당 주소
    private String lunchAddr;

    // 점심 별점 식당 별점
    private Integer lunchRate;

    // 식당 이름 
    private String lunchName;

    public Integer getLunchNo() {
        return lunchNo;
    }

    public void setLunchNo(Integer lunchNo) {
        this.lunchNo = lunchNo;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public String getLunchReview() {
        return lunchReview;
    }

    public void setLunchReview(String lunchReview) {
        this.lunchReview = lunchReview;
    }

    public String getLunchAddr() {
        return lunchAddr;
    }

    public void setLunchAddr(String lunchAddr) {
        this.lunchAddr = lunchAddr;
    }

    public Integer getLunchRate() {
        return lunchRate;
    }

    public void setLunchRate(Integer lunchRate) {
        this.lunchRate = lunchRate;
    }

    public String getLunchName() {
        return lunchName;
    }

    public void setLunchName(String lunchName) {
        this.lunchName = lunchName;
    }

    // ToLunch 모델 복사
    public void CopyData(Lunch param)
    {
        this.lunchNo = param.getLunchNo();
        this.memberName = param.getMemberName();
        this.lng = param.getLng();
        this.lat = param.getLat();
        this.lunchReview = param.getLunchReview();
        this.lunchAddr = param.getLunchAddr();
        this.lunchRate = param.getLunchRate();
        this.lunchName = param.getLunchName();
    }
}