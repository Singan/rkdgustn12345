<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<h1>Create a Seok Account</h1>
		<div class="form-group">
			<form class="form-horizontal">
				<div class="form-group">
					<div>
						<label>ID</label>
						<input type="text" name="id">
					</div>
					<div>
						<label>Email</label>
						<input type="email" name="email">
					</div>
					<div>
						<label>Password</label>
						<input type="password" name="password">
					</div>
				</div>
				<div>
					<button>회원가입</button>
					<span>
						아이디가 있습니까?
						<a href="${pageContext.request.contextPath}/sign/login.do">로그인</a> 
					</span>
				</div>
			</div>
		</form>
	<div>
</body>
</html>