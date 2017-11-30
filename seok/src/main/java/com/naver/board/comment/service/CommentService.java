package com.naver.board.comment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.repository.domain.Comment;

public interface CommentService {
	
	public List<Comment> selectComment(int boardNo) throws Exception;
	
	public void insertComment(Comment comment) throws Exception;
	
	public int countComment(int memberNo) throws Exception;
}
