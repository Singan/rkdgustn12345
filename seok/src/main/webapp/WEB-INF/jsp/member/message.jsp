<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
쪽지함!
<div id="messagelist">
	<img src="/seok/images/myPage/nomessage.png"/>
	메세지가 없소
</div>


<div id="testtest">!<br></div>

<script>
	$("#testtest").click(function(){
		$(this).append("!<br>")
	});
</script>