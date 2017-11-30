<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="">
	<div class="at_header">기본정보</div>
	<div class="mt_table">
		<div class="mt_body">
			<div class="mt_row">
				<div class="mt_field mt_cell">느그 아이디</div>
				<div class="mt_cell">
					<input class="at_input" type="text" value="${user.memberId}" disabled/>
				</div>
			</div>
			<div class="mt_row">
				<div class="mt_field mt_cell">느그 비밀번호</div>
				<div class="mt_cell">
					<input class="at_input" type="password" value="${user.memberPass}" disabled/>
				</div>
			</div>
			<div class="mt_row">
				<div class="mt_field mt_cell">느그 이름</div>
				<div class="mt_cell">
					<input class="at_input" type="text" value="${user.memberName}" disabled/>
				</div>
			</div>
			<div class="mt_row">
				<div class="mt_field mt_cell">느그 이메일</div>
				<div class="mt_cell">
					<input class="at_input" type="email" value="${user.memberEmail}" disabled/>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="postcount">작성한 글 수 ${postcount}</div>
<div id="commentcount">작성한 댓글 수 ${commentcount}</div>
<div id="postlist">작성한 글 목록 ${postlist}</div>

<div id="testtest">!<br></div>
<script>
	$("#testtest").click(function(){
		$(this).append("!<br>")
	});
	
	$("document").ready(function (){});
</script>