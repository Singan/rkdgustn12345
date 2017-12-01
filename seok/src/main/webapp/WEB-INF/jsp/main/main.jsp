<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/member/myPage.do">myPage</a></br>
	<a href="${pageContext.request.contextPath}/sign/signForm.do">signUp</a></br>
	<a href="${pageContext.request.contextPath}/board/free.do">free</a></br>
	<a href="${pageContext.request.contextPath}/board/quiz.do">quiz</a></br>
	<a href="${pageContext.request.contextPath}/board/question.do">question</a></br>
	<a href="${pageContext.request.contextPath}/diary/diary.do">diary</a></br>
	<a href="${pageContext.request.contextPath}/sign/logout.do">로그아웃</a></br>
	<a href="${pageContext.request.contextPath}/main/chatMove.do">채팅창</a>
	<script>
		$(function(){
			if ("${msg}") {
				alert("${msg}");
			}
		});
	</script>
</body>
</html>