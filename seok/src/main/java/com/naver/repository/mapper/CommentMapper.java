package com.naver.repository.mapper;

import java.util.List;

import com.naver.repository.domain.Comment;

public interface CommentMapper {
	public List<Comment> selectComment(int boardNo) throws Exception;
	
	public void insertComment(Comment comment) throws Exception;
	
	public int countComment(int memberNo) throws Exception;
}
