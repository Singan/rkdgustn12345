package com.naver.board.free.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;

import com.naver.board.comment.service.CommentService;
import com.naver.board.free.service.BoardService;
import com.naver.repository.domain.Board;
import com.naver.repository.domain.Comment;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/board")
public class FreeController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/free.do")
	public String free(Model model) throws Exception{
		model.addAttribute("list",boardService.selectBoard(1));
		return "/board/freeMain";
	}
	
	@RequestMapping("/{boardNo}/freeDetail.do") 
	public String freeDetailForm(Model model, 
			@PathVariable int boardNo) throws Exception{
		// boardNo 로 comment 뽑는다.
		List<Comment> commentList = commentService.selectComment((int)boardNo);
		if(!commentList.isEmpty())
			model.addAttribute("commentList", commentList);
		
		model.addAttribute("board",boardService.detailBoard((int)boardNo));
		return "/board/freeDetailForm";
	}
	
	@RequestMapping("/freeWriteForm.do")
	public void freeWriteForm() {}
	
	@RequestMapping("/freeWrite.do")
	public String freeWrite(HttpServletRequest request, HttpSession session,
			@ModelAttribute("board") Board board) throws Exception{
		
		
		Member member = (Member)session.getAttribute("user");
		
		int categoryNo = 1;
		String boardWriter = member.getMemberName();
		int memberNo = member.getMemberNo();
		
		board.setCategoryNo(categoryNo);
		board.setBoardWriter(boardWriter);
		board.setMemberNo(memberNo);
		
		boardService.insertBoard(board);
		
		return "redirect:/board/free.do";
	}
}
