<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	body {
		background-image: url("${pageContext.request.contextPath}/images/main/ds12.jpg");
	}
	
	#body{
		left: 25%;
		position: relative;
		width: 50vw;
		height: 50vh;
		
	}
	#topMenu{
		width : 100%;
		height: 100px;
	}
	#chatBtn{
		position: relative;
		right : 40px;
		float: right;
	}
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath}/member/myPage.do">마이페이지</a></br>
	<a href="${pageContext.request.contextPath}/sign/signForm.do">회원가입</a></br>
	<a href="${pageContext.request.contextPath}/sign/logout.do">로그아웃</a></br>
	<div id="topMenu">
		<center>
			<div class="page-header">
 				<h1>석성희 외 3명 <small>홈페이지</small></h1>
			</div>
		</center>
	</div>
	
	<div id="body">
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/board/free.do" target="boards">자게</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/board/quiz.do" target="boards">문게</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/board/question.do" target="boards">질게</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/diary/diary.do" target="boards">달력</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/lunch/lunch.do" target="boards">점심</a></li>
		</ul>
	<br>
		<iframe name="boards" src="${pageContext.request.contextPath}/board/free.do"
		style="width:50vw; height:50vh;" frameborder="0"></iframe>
	</div>
	
	<div id="chatBtn">
	<label class="btn btn-danger" id="product-images-add" for="product-images-files" style="float:right">
      <input class="hide" id="product-images-files" type="button" >
                                        <i class="fa fa-file-image-o" aria-hidden="true"></i> 채팅방 이동
                                   </label>
	
	</div>
	<script>
		$(function(){
			if ("${msg}") {
				alert("${msg}");
			}
		});
		$("#product-images-add").click(function () {
			window.open("${pageContext.request.contextPath}/main/chatMove.do","","width=500, height=700, resizable=no");
		});
		
		$("[role=presentation]").click(function () {
			$("[role=presentation]").removeClass("active");
			$(this).addClass("active");
		});
		
		
	</script>
</body>
</html>