<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="form-group">
		<h1>Log in to Seok</h1>
		<div class="form-group">
			<form class="form-horizontal" action="${pageContext.request.contextPath}/sign/login.do"
						method="post">
				<div class="form-group">
					<div>
						<label>ID</label>
						<input type="text" name="id">
					</div>
					<div>
						<label>Password</label>
						<input type="password" name="password">
					</div>
				</div>
				<div>
					<button>로그인</button>
					<span>
						아이디가 없습니까?
						<a href="${pageContext.request.contextPath}/sign/signForm.do">회원가입</a> 
					</span>
				</div>
			</div>
		</form>
	<div>
	
	<script>
		if("${msg}") {
			alert("${msg}");
		}
	</script>
</body>
</html>