<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>마이페이지</title>
	<script src="/seok/js/jquery-3.2.1.js"></script>
	<style>
		.table {display: table;}
		
		.tbody {display: table-row-group;}
		
		.row {display: table-row;}
		
		.cell {
			border: 1px solid black;
			border-collapse: collapse;
			
			display: table-cell;
		}
		
	</style>
</head>
	<body>
		<div class="table">
			<div class="tbody">
				<div class="row">
					<div class="cell">회원번호</div>
					<div class="cell">${user.memberNo}</div>
				</div>
				<div class="row">
					<div class="cell">느그 아이디</div>
					<div class="cell">${user.memberId}</div>
				</div>
				<div class="row">
					<div class="cell">느그 이름</div>
					<div class="cell">${user.memberName}</div>
				</div>
				<div class="row">
					<div class="cell">느그 이메일</div>
					<div class="cell">${user.memberEmail}</div>
				</div>
			</div>
		</div>
	</body>
</html>