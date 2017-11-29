<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>마이페이지</title>
	<script src="/seok/js/jquery-3.2.1.js"></script>
	<link href="/seok/css/myPage.css" type="text/css" rel="stylesheet">
</head>
	<body>
		<div id="background"></div>
		
		<div id="header">
			<a href="${pageContext.request.contextPath}/main/main.do"
			style="text-decoration: none; font-weight: bolder;">집으로</a>
		</div>
		
		<div id="body"> 
			<div id="menubar">
				<div class="menutab">프로필</div>  
				<div class="menutab">쪽지함</div>
				<div class="menutab">친구</div>
			</div>
		
			<div id="content">
				<!-- 이 안쪽의 내용이 JAVASCRIPT를 이용해서 변경됨 -->
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
				
				<div>div2</div>
				<div id="testtest">!<br></div>
				
				
			</div>
		</div>
		
		<script>
			var $content = $("#content");
			var $import = $("c:import");
			
			var $menutab = $(".menutab");
			$menutab.click(function(){
				$menutab.removeClass("selected");
				$(this).addClass("selected");
				$("#testtest").load("profile.do");
			});
			
			$("#testtest").click(function(){
				$(this).append("!<br>")
			});
		</script>
	</body>
</html>