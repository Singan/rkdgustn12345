package com.naver.member.service;

import java.util.List;

import com.naver.repository.domain.Member;


public interface MemberService {
	public List<Member> selectMember() throws Exception;
	
	public Member detailMember(String id) throws Exception;
	
	public void deleteMember(String id) throws Exception;
	
	public void insertMember(Member member) throws Exception;
	
	public void updateMember(Member member) throws Exception;
}

