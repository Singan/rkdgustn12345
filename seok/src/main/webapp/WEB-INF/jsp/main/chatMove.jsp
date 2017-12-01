<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
</head>
<body>
<form name="chatMove" action="http://192.168.0.138:3000/main" method="post">
	<input type="hidden" name="id" value="${user.memberId}" />
	<input type="hidden" name="pass" value="${user.memberPass}" />
</form>
<script type="text/javascript">
	$("form").submit();
</script>
</body>
</html>