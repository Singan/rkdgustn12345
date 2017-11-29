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
</head>
<body>
	<br>
	<div style="width: 100%; padding: 10px;">
		<table width=100% class="table table-striped table-bordered"
			data-toggle="table" data-search="true" data-pagination="true"
			data-advanced-search="true" data-id-table="advancedTable"
			//data-sortable="true" //data-sorter="htmlSorter" data-height="300"
			data-show-refresh="true" data-show-toggle="true"
			data-show-columns="true" data-toolbar="#toolbar">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='b' items='${list}'>
					<tr>
						<td>${b.boardNo}</td>
						<td>
							<a href="${pageContext.request.contextPath}/board/${b.boardNo}/freeDetail.do">
								${b.boardName}</a>
						</td>
						<td>${b.boardName}</td>
						<td>${b.boardDate}</td>
						<td>${b.boardViews}</td>
						<td>${b.boardUp}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" align="center">
						<div id="toolbar" class="btn-group" class="pull-left">
							<div class="pull-left">
								<select class="form-control">
									<option>제목</option>
									<option>이름</option>
								</select>
							</div>
							<div class="pull-left" class="inner-addon left-addon">

								<input class="form-control" type="text">
							</div>
							<div class="pull-left">
								<button type="button" class="btn btn-default">
									<i class="glyphicon glyphicon-search"></i>
									검색
								</button>
							</div>
						</div>
						<div class="pull-right">
							<a href="${pageContext.request.contextPath}/board/freeWriteForm.do" class="btn btn-default">글쓰기</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<br>
</body>
</html>