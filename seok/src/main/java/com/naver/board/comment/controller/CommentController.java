package com.naver.board.comment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.board.comment.service.CommentService;
import com.naver.repository.domain.Comment;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/board")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/{boardNo}/commentWrite.do")
	public String commentWrite(
			HttpSession session,
			@ModelAttribute("comment") Comment comment,
			@PathVariable("boardNo") int boardNo
		) throws Exception{
		
		Member member = (Member)session.getAttribute("user");
		System.out.println(member.toString());
		comment.setMemberName(member.getMemberName());
		comment.setBoardNo((int)boardNo);
		
		commentService.insertComment(comment);
		
		return "redirect:/board/{boardNo}/freeDetail.do";
	}
}