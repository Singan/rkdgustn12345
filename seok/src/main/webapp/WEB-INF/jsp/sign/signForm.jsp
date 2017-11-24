<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* Fonts */
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400);

/* fontawesome */
@import url(http://weloveiconfonts.com/api/?family=fontawesome);

[class*="fontawesome-"]:before {
	font-family: 'FontAwesome', sans-serif;
}

/* Simple Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* body */
body {
	background: #e9e9e9;
	color: #5e5e5e;
	font: 400 87.5%/1.5em 'Open Sans', sans-serif;
}

/* Form Layout */
.form-wrapper {
	background: #fafafa;
	margin: 3em auto;
	padding: 0 1em;
	max-width: 370px;
}

h1 {
	text-align: center;
	padding: 1em 0;
}

form {
	padding: 0 1.5em;
}

.form-item {
	margin-bottom: 0.75em;
	width: 100%;
}

.form-item input {
	background: #fafafa;
	border: none;
	border-bottom: 2px solid #e9e9e9;
	color: #666;
	font-family: 'Open Sans', sans-serif;
	font-size: 1em;
	height: 50px;
	transition: border-color 0.3s;
	width: 100%;
}

.form-item input:focus {
	border-bottom: 2px solid #c0c0c0;
	outline: none;
}

.button-panel {
	margin: 2em 0 0;
	width: 100%;
}

.button-panel .button {
	background: #f16272;
	border: none;
	color: #fff;
	cursor: pointer;
	height: 50px;
	font-family: 'Open Sans', sans-serif;
	font-size: 1.2em;
	letter-spacing: 0.05em;
	text-align: center;
	text-transform: uppercase;
	transition: background 0.3s ease-in-out;
	width: 100%;
}

.button:hover {
	background: #ee3e52;
}

.form-footer {
	font-size: 1em;
	padding: 2em 0;
	text-align: center;
}

.form-footer a {
	color: #8c8c8c;
	text-decoration: none;
	transition: border-color 0.3s;
}

.form-footer a:hover {
	border-bottom: 1px dotted #8c8c8c;
}
</style>
</head>
<body>
	<div class="form-wrapper">
		<h1>Create a Seok Account</h1>
		<form action="${pageContext.request.contextPath}/sign/signUp.json" method="post">
			<div class="form-item">
				<label for="ID"></label> <input type="text" name="name"
					required="required" placeholder="ID"></input>
			</div>
			<div class="form-item">
				<label for="Email"></label> <input type="email" name="email"
					required="required" placeholder="Email"></input>
			</div>
			<div class="form-item">
				<label for="password"></label> <input type="password"
					name="password" required="required" placeholder="Password"></input>
			</div>
			<div class="button-panel">
				<input type="submit" class="button" title="회원가입" value="회원가입"></input>
			</div>
		</form>
		<div class="form-footer">
			<p>
				<span>아이디가 있습니까?</span> <a
					href="${pageContext.request.contextPath}/sign/loginForm.do">로그인</a>
			</p>
		</div>
	</div>
	<script>
		if ("${msg}") {
			alert("${msg}");
		}
	</script>
</body>
</html>