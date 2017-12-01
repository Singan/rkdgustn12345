package com.naver.member.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.board.comment.service.CommentService;
import com.naver.board.free.service.BoardService;
import com.naver.member.service.FriendService;
import com.naver.member.service.MemberService;
import com.naver.member.service.MessageService;
import com.naver.repository.domain.Board;
import com.naver.repository.domain.Comment;
import com.naver.repository.domain.Friend;
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
	
//	@Autowired
//	private MessageService messageService;
	
	@Autowired
	private FriendService friendService;
	
	
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
	
	@RequestMapping("/profileupdate.do")
	@ResponseBody
	public String profileUpdate(HttpServletRequest request, HttpSession session){
		try {
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("no")));
			member.setMemberId(request.getParameter("id"));
			member.setMemberPass(request.getParameter("pass"));
			member.setMemberName(request.getParameter("name"));
			member.setMemberEmail(request.getParameter("email"));
			
			session.setAttribute("user", member);

			memberService.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ok";
	}
	
	@RequestMapping("/profilecancle.do")
	@ResponseBody
	public Member profileCancle(HttpSession session){
		Member member = (Member)session.getAttribute("user");
		return member;
	}
	
	@RequestMapping("/message.do")
	public void message(){}
	
	@RequestMapping("/messagesend.do")
	@ResponseBody
	public String messageSend(HttpServletRequest request) {
		
		return "ok";
	}
	
	@RequestMapping("/messagedelete.do")
	@ResponseBody
	public String messageDelete(HttpServletRequest request) {
		
		return "ok";
	}
	
	@RequestMapping("/friend.do")
	public void friend(Model model, HttpSession session) throws Exception{
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		
		List<Friend> friendlist = friendService.selectFriend(memberNo);
		List<Friend> friendrequestlist = friendService.selectFriendRequest(memberNo);
		List<Friend> friendresponselist = friendService.selectFriendResponse(memberNo);
		
		model.addAttribute("friendlist", friendlist);
		model.addAttribute("friendrequestlist", friendrequestlist);
		model.addAttribute("friendresponselist", friendresponselist);
	}
	
	@RequestMapping("/friendrequest.do")
	@ResponseBody
	public String friendRequest(HttpServletRequest request) {
		Friend friend = new Friend();
		friend.setMemberNo(Integer.parseInt(request.getParameter("memberNo"))); 
		friend.setFriendNo(Integer.parseInt(request.getParameter("friendNo")));
		
		return "ok";
	}
	
	@RequestMapping("/friendaccept.do")
	@ResponseBody
	public String friendAccept(HttpServletRequest request) {
		Friend friend = new Friend();
		friend.setMemberNo(Integer.parseInt(request.getParameter("memberNo"))); 
		friend.setFriendNo(Integer.parseInt(request.getParameter("friendNo")));
		
		return "ok";
	}
	
	@RequestMapping("/frienddelete.do")
	@ResponseBody
	public String friendDelete(HttpServletRequest request) throws Exception {
		Friend friend = new Friend();
		friend.setMemberNo(Integer.parseInt(request.getParameter("memberNo"))); 
		friend.setFriendNo(Integer.parseInt(request.getParameter("friendNo")));
		
		friendService.deleteFriend(friend);
		return "ok";
	}
}
