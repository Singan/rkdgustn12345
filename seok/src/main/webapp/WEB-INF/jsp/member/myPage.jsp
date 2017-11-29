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
				<div class="menutab">친구목록</div>
			</div>
		
			<div id="content">
				<!--import-->
			</div>
		</div>
		
		<script>
			var url = ["profile", "message", "friend"];
			
			for (let i=0, max=$(".menutab").length; i<max; i++) {
				$(".menutab:eq("+i+")").click(function(){
					$(".menutab").removeClass("selected");
					$(this).addClass("selected");
					$("#content").load(url[i]+".do");
				});
			}
			
			$("document").ready(function (){$(".menutab:first").trigger("click");} );
		</script>
	</body>
</html>