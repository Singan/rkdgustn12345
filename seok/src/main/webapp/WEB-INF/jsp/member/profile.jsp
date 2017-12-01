<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myinfo" class="at_box at_half">
	<div class="at_header">기본정보</div>
	<div class="mt_table">
		<div class="mt_body">
			<div class="mt_row">
				<div class="mt_field mt_cell">아이디</div>
				<div id="memberId" class="mt_cell">${user.memberId}</div>
			</div>
			<div class="mt_row">
				<div class="mt_field mt_cell">비밀번호</div>
				<div class="mt_cell">
					<input id="memberPass" class="at_input" type="password"
					value="${user.memberPass}" maxlength="20"/>
				</div>
			</div>
			<div class="mt_row">
				<div class="mt_field mt_cell">이름</div>
				<div class="mt_cell">
					<input id="memberName" class="at_input" type="text"
					value="${user.memberName}" maxlength="20"/>
				</div>
			</div>
			<div class="mt_row">
				<div class="mt_field mt_cell">이메일</div>
				<div class="mt_cell">
					<input id="memberEmail" class="at_input" type="email"
					value="${user.memberEmail}" maxlength="50"/>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="postcount" class="at_box at_quarter">
	<div class="at_header">작성한 글 수</div>
	<div class="ft_count">${postcount}</div>
</div>
<div id="commentcount" class="at_box at_quarter">
	<div class="at_header">작성한 댓글 수</div>
	<div class="ft_count">${commentcount}</div>
</div>
<div id="viewstotal" class="at_box at_quarter">
	<div class="at_header">총합 조회수</div>
	<div class="ft_count">${viewstotal}</div>
</div>
<div id="votestotal" class="at_box at_quarter">
	<div class="at_header">총합 추천수</div>
	<div class="ft_count">${votestotal}</div>
</div>

<div id="postlist" class="at_box at_half">
	<div class="at_header">최근 작성한 글</div>
	<div class="mt_table">
		<div class="mt_body">
			<div class="mt_row">
				<div class="mt_field mt_cell">제목</div>
				<div class="mt_field mt_cell">추천수</div>
				<div class="mt_field mt_cell">조회수</div>
				<div class="mt_field mt_cell">작성일</div>
			</div>
			<c:forEach var="post" items="${postlist}">
				<div class="mt_row">
					<div class="mt_cell">${post.boardName}</div>
					<div class="mt_cell">${post.boardUp - post.boardDown}</div>
					<div class="mt_cell">${post.boardViews}</div>
					<div class="mt_cell">${post.boardDate}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div id="commentlist" class="at_box at_half">
	<div class="at_header">최근 작성한 댓글</div>
	<div class="mt_table">
		<div class="mt_body">
			<div class="mt_row">
				<div class="mt_field mt_cell">내용</div>
				<div class="mt_field mt_cell">작성일</div>
			</div>
			<c:forEach var="comment" items="${commentlist}">
				<div class="mt_row">
					<div class="mt_cell">${comment.commentContent}</div>
					<div class="mt_cell">${comment.commentDate}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	var myinfo = function(){
		$("#myinfo").find(".at_input").attr("disabled","");
		$("#infosubmit").remove();
		$("#infocancel").remove();
		$("#myinfo").append('<div id="infoedit" class="bt_box bt_yes">편집</div>');
	};

	$("document").ready(function(){myinfo();});
	
	$("#myinfo").on("click","#infoedit",function(){
		$("#myinfo").find(".at_input").removeAttr("disabled");
		$("#infoedit").remove();
		$("#myinfo").append('<div id="infocancel" class="bt_box bt_no">취소</div>')
					.append('<div id="infosubmit" class="bt_box bt_yes">확인</div>');
	});
	
	$("#myinfo").on("click","#infosubmit",function(){
		$.ajax({
			url: "/seok/member/profileupdate.do",
			data:
				"no=${user.memberNo}"
				+"&id=${user.memberId}"
				+"&pass=" + $("#memberPass").val()
				+"&name=" + $("#memberName").val()
				+"&email=" + $("#memberEmail").val(),
			success: function () {myinfo();}
		});
	});
	
	$("#myinfo").on("click","#infocancel",function(){
		myinfo();
	});
	
</script>