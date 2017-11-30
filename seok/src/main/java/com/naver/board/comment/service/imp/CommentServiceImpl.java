package com.naver.board.comment.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.board.comment.service.CommentService;
import com.naver.repository.domain.Comment;
import com.naver.repository.mapper.CommentMapper;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	public CommentMapper commentMapper;
	
	@Override
	public List<Comment> selectComment(int boardNo) throws Exception {
		return commentMapper.selectComment(boardNo);
	}
	@Override
	public List<Comment> selectCommentByMemberNo(int memberNo) throws Exception {
		return commentMapper.selectCommentByMemberNo(memberNo);
	}


	@Override
	public void insertComment(Comment comment) throws Exception {
		commentMapper.insertComment(comment);
	}

	@Override
	public int countCommentByMemberNo(int memberNo) throws Exception {
		return commentMapper.countCommentByMemberNo(memberNo);
	}
	
	
}
