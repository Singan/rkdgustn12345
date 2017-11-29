<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="table">
	<div class="tbody">
		<div class="trow">
			<div class="tfield tcell">느그 아이디</div>
			<div class="tcell">${user.memberId}</div>
		</div>
		<div class="trow">
			<div class="tfield tcell">느그 이름</div>
			<div class="tcell">${user.memberName}</div>
		</div>
		<div class="trow">
			<div class="tfield tcell">느그 이메일</div>
			<div class="tcell">${user.memberEmail}</div>
		</div>
	</div>
</div>

<div id="testtest">!<br></div>
<script>
	$("#testtest").click(function(){
		$(this).append("!<br>")
	});
</script>