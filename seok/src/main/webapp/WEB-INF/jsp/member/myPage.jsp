<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>마이페이지</title>
	<script src="/seok/js/jquery-3.2.1.js"></script>
	<style>
		body{margin:0;}
	
		#background {
			z-index: 0;
		
			position: fixed;
			left: 0; right: 0; top: 0; bottom: 0;
			
			display: block;
			background: url("/seok/images/rupture1.jpg") no-repeat;
			background-size: 100%;
			
			filter: blur(1px);
		}
		
		#header {
			z-index: 1;
			position: relative;
			
			margin: 0 0 1% 0;
			padding: 7.5px 15px;
			width: 100%-7.5px; height: 50px; 
			background: rgba(0,0,0,0.9);
		}
		
		#content {
			z-index: 1;
			position: relative;
			width: 98%;
			left: 1%;
		}
	
		.table {
			display: table;
			
			border: 2px solid rgba(255,255,255,1);
			border-radius: 5px;
			background: rgba(0,0,0,0.5);
			color: white;
		}
		
		.tbody {display: table-row-group;}
		
		.trow {display: table-row;}
		.trow:hover {background: rgba(0,0,0,0.25);}
		
		.tcell{
			display: table-cell;
			padding: 3px 10px;
			border-bottom: 1px solid rgba(255,255,255,0.25);
		}
		.trow:last-child > .tcell{border-bottom: none;}
		
		.tfield {font-weight: bold;}
		
	</style>
</head>
	<body>
		<div id="background"></div>
		
		<div id="header">
			<a href="${pageContext.request.contextPath}/main/main.do"
			style="color:white; font-size: 2em; text-decoration: none; font-weight: 900;">집으로</a>
		</div>
		
		<div id="content">
			<div class="table">
				<div class="tbody">
					<div class="trow">
						<div class="tfield tcell">회원번호</div>
						<div class="tcell">${user.memberNo}</div>
					</div>
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
		</div>
		
		<script>
		</script>
	</body>
</html>