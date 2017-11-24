package com.naver.member.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.member.service.MemberService;
import com.naver.repository.domain.Member;
import com.naver.repository.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public List<Member> selectMember() throws Exception {
		return mapper.selectMember();
	}

	@Override
	public Member detailMember(String id) throws Exception {
		return mapper.detailMember(id);
	}

	@Override
	public void insertMember(Member member) throws Exception {
		mapper.insertMember(member);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		mapper.deleteMember(id);
	}

	@Override
	public void updateMember(Member member) throws Exception {
		mapper.updateMember(member);
	}
}
