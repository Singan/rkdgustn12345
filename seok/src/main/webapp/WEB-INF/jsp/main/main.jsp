<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
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
	<button id="chat">채팅방이동</button>
	<script>
		$(function(){
			if ("${msg}") {
				alert("${msg}");
			}
		});
		$("#chat").click(function () {
			window.open("${pageContext.request.contextPath}/main/chatMove.do","","width=500, height=700, resizable=no");
		});
	</script>
</body>
</html>