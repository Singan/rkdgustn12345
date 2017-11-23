package com.naver.repository.mapper;

import java.util.List;

import com.naver.repository.domain.Member;

public interface MemberMapper {
	
	public List<Member> selectMember() throws Exception;
	
	public Member selectMemberDetail(String id) throws Exception;
	
	public void deleteMember(String id) throws Exception;
	
	public void insertMember(Member member) throws Exception;
	
	public void updateMember(Member member) throws Exception;
}
