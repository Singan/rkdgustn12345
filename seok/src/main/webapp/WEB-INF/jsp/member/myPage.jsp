<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>마이페이지</title>
	<script src="/seok/js/jquery-3.2.1.js"></script>
	<style>
		*{margin:0; color:white;}
	
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
			height: 50px; 
			background: rgba(0,0,0,0.9);
		}
		#content {
			z-index: 1;
			position: relative;
			width: 98%; height: 80vh;
			left: 1%;
		}
	
		.table {
			display: table;
			border: 2px solid rgba(255,255,255,1);
			border-radius: 5px;
			background: rgba(0,0,0,0.5);
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
		
		.menubar{
			width:100%; height:50px;
			border-bottom: 2px solid rgba(255,255,255,1);
			margin: 0 0 5px 0;
		}
		.menutab{
			display:inline-block;
			width:20vh; height:5vh;
			border: 2px solid rgba(0,0,0,0.5);
			border-bottom: 2px solid rgba(255,255,255,1);
			border-radius: 10px 10px 0px 0px;
			background: rgba(0,0,0,0.75);
			font: 1.5em bold;
			text-align: center;
		}
		
	</style>
</head>
	<body>
		<div id="background"></div>
		
		<div id="header">
			<a href="${pageContext.request.contextPath}/main/main.do"
			style="font-size: 2em; text-decoration: none; font-weight: 900;">집으로</a>
		</div>
		
		<div id="content"> 
			<div class="menubar">
				<div class="menutab">프로필</div>
				<div class="menutab">222</div>
				<div class="menutab">333</div>
			</div>
		
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