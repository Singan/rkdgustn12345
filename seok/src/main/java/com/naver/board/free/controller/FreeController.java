package com.naver.board.free.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.board.free.service.BoardService;
import com.naver.repository.domain.Board;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/board")
public class FreeController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/freeMain.do")
	public void freeMain() {}
	
	@RequestMapping("/free.do")
	public String free(Model model) {
		List<Board> list=null;
		
		int categoryNo = 1;
		try {
			list = boardService.selectBoard(categoryNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAllAttributes(list);
		return "/freeMain.do";
	}
	
	@RequestMapping("/freeDetailForm.do") 
	public void freeDetailForm() {}
	
	@RequestMapping("/freeWriteForm.do")
	public void freeWriteForm() {}
	
	@RequestMapping("/freeWrite.do")
	public String freeWrite(HttpServletRequest request, HttpSession session,
			@ModelAttribute("board") Board board) {
		
		Member member = (Member)session.getAttribute("user");
		
		System.out.println(board.getBoardName());
		System.out.println(board.getBoardContent());
		System.out.println(board.getBoardImagePath());
		System.out.println(board.getFileGroupNo());

		int categoryNo = 1;
		String boardWriter = member.getMemberName();
		int memberNo = member.getMemberNo();
		
		board.setCategoryNo(categoryNo);
		board.setBoardWriter(boardWriter);
		board.setMemberNo(memberNo);
		
		try {
			boardService.insertBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/free.do";
	}
}
