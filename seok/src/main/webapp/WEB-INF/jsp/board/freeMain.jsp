<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-2.1.3.min.js'></script>
<script
	src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.css">
<style type="text/css">
	body {
		background-color: none;
	}
</style>
</head>
<body>
	<br>
	<div style="width: 100%; padding: 10px;">
		<table width=100% class="table table-striped table-bordered" id="user-table">
			<thead>
				<tr>
					<th>번호</th>
					<th  width="30%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='b' items='${list}'>
					<tr>
						<div class="container-fluid" id="content">
						<td>
							<div class="pull-left">
								${b.boardNo}
							</div>
						</td>
						<td>
							<div class="pull-left">
								<a href="${pageContext.request.contextPath}/board/${b.boardNo}/freeDetail.do">${b.boardName}</a>
							</div>
						</td>
						<td>
							<div>
								${b.boardWriter}
							</div>
						</td>
						<td>
							<div>
								${b.boardDate}
							</div>
						</td>
						<td>
							<div>
								${b.boardViews}
							</div>
						</td>	
						<td>
							<div>
								${b.boardUp}
							</div>
						</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<table  width=100% class="table table-striped">
				<tr>
					<td align="center">
						<div id="toolbar" class="btn-group">
							<div class="pull-left">
								<select class="form-control">
									<option>제목</option>
									<option>이름</option>
								</select>
							</div>
							<div class="pull-left" class="inner-addon left-addon">

								<input class="form-control" id="keyword" type="text">
							</div>
							<div class="pull-left">
								<button type="button" id="search" class="btn btn-default">
									<i class="glyphicon glyphicon-search"></i>
									<strong>검색</strong>
								</button>
							</div>
						</div>
						<div class="pull-right">
							<a href="${pageContext.request.contextPath}/board/freeWriteForm.do" class="btn btn-default">글쓰기</a>
						</div>
					</td>
				</tr>
			</table>
		
	</div>
	<br>
	<br>
	<br>
	
	<script>
	$(document).ready(function() {
        $("#search").click(function() {
			var k = $("#keyword").val();
			$("#user-table > tbody > tr").hide();
			var temp = $("#user-table > tbody > tr > td:contains('" + k + "')");
			
			$(temp).parent().show();
        })
    });
	</script>
</body>
</html>