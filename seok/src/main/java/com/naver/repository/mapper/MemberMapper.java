package com.naver.repository.mapper;

public class MemberMapper {
	private final static String NS = "com.naver.repository.mapper.memberMapper.";

	private static SqlSession session;
	
	public MemberMapper() {
		session = MyAppSqlConfig.getSqlSessionInstance();
	}
	
	
}
