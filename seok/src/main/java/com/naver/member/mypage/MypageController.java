package com.naver.member.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.board.comment.service.CommentService;
import com.naver.board.free.service.BoardService;
import com.naver.member.service.MemberService;
import com.naver.repository.domain.Board;
import com.naver.repository.domain.Comment;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/myPage.do")
	public void myPage(){}
	
	@RequestMapping("/profile.do")
	public void profile(Model model, HttpSession session) throws Exception{
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		
		int postcount = boardService.countBoardByMemberNo(memberNo);
		int commentcount = commentService.countCommentByMemberNo(memberNo);
		int viewstotal = boardService.sumViewsByMemberNo(memberNo);
		int votestotal = boardService.sumVotesByMemberNo(memberNo);
		
		List<Board> postlist = boardService.selectBoardByMemberNo(memberNo);
		List<Comment> commentlist = commentService.selectCommentByMemberNo(memberNo);
		
		model.addAttribute("postcount", postcount);
		model.addAttribute("commentcount", commentcount);
		model.addAttribute("viewstotal", viewstotal);
		model.addAttribute("votestotal", votestotal);
		
		model.addAttribute("postlist", postlist);
		model.addAttribute("commentlist", commentlist);
	}
	
	@RequestMapping("/message.do")
	public void message(){}
	
	@RequestMapping("/friend.do")
	public void friend(){}
}
