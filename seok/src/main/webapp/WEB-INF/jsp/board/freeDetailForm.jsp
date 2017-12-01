<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://use.fontawesome.com/ea0f14e7b5.js"></script>

<style>
p {
    margin: 0px;
}
</style>
</head>
<body>
<c:if test="${board != null}">
	<br> 
	<div style="width: 100%; padding: 10px;" class="container-fluid">
		<table width=100% class="table table-striped table-bordered">
			<thead>
				<tr>
					<div padding="30px" class="container-fluid">
						<div class="pull-left">
						
							<a href="${pageContext.request.contextPath}/board/free.do">
								<img src="${pageContext.request.contextPath}/images/backlist.jpg" width="100px">
							</a>	
						</div>
						<div class="col-xs-7">
							<div>
							
								<strong>제목: </strong>${board.boardName}
							</div>
							
							<div>
								<strong>작성자: </strong>${board.boardWriter}
								<strong>| 조회수: </strong>${board.boardViews}
								<strong>| 댓글수: </strong>${board.boardContent}						
								<strong>| 추천수: </strong>${board.boardUp}						
							</div>
						</div>
						<div class="pull-right">
							<div>
								<strong>번호: </strong>${board.boardNo}	
							</div>
							
							<div>
								<strong>작성일: </strong>${board.boardDate}
							</div>
						</div>
					</div>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="container-fluid">
							<div>
								<div>${board.boardContent}</div>
								 <c:if test="${imageList != null}">
							 		<c:forEach var='i' items="${imageList}">
								 	<div>
								 		<img width="300" src="${pageContext.request.contextPath}/downimage.do?filePath=${i.filePath}&fileSystemName=${i.fileSystemName}&fileOriginName=${i.fileOriginName}" >
									</div>
									</c:forEach>
								</c:if>
								 <c:if test="${fileList != null}">
							 		<c:forEach var='i' items="${fileList}">
								 	<div>
								 		<a href="${pageContext.request.contextPath}/downimage.do?filePath=${i.filePath}&fileSystemName=${i.fileSystemName}&fileOriginName=${i.fileOriginName}">
								 			${i.fileOriginName}
								 		</a>	
									</div>
									</c:forEach>
								</c:if>
							</div>
							<div  class="pull-right" >
								<button type="button" class="btn btn-default">수정</button>
								<a href="${pageContext.request.contextPath}/board/${board.boardNo}/freeDelete.do" class="btn btn-default">삭제</a>
							</div>
						</div>
					 </td>
				</tr>
				<tr>
					<td colspan="6">
						<div class="container-fluid" style='width:400px;'>
							<div class="col-sm-1 pull-left">
								<i class="fa fa-thumbs-o-up fa-2x " aria-hidden="true"></i>
							</div>
							
							<div class="pull-left col-sm-1">
								<h4><strong id="upCount">${board.boardUp}</strong></h4>
							</div>
							
							<div class="pull-left col-sm-2">
								<button type="button" class="btn btn-default" id="up">추천</button>
							</div>
							<div class="pull-left">
								<button type="button" class="btn btn-default" id="down">비추천</button>
							</div>
							
							<div class="col-sm-1 pull-left">
								<i class="fa fa-thumbs-o-down fa-2x " aria-hidden="true"></i>
							</div>
							
							<div class="pull-left col-sm-1"><h4><strong id="downCount">${board.boardDown}</strong></h4></div>
						</div>
					</td>
				</tr>
				<tr>
				
					<table class="table table-striped table-condensed table-responsive">
						<tbody>
							<div class="form-group container-fluid">
								<c:if test="${commentList != null}">
								 		<c:forEach var='c' items='${commentList}'>
											<c:choose>
												<c:when test="${c.memberNo == board.memberNo}">
													<tr>
														<div class="container-fluid">
															<div class="pull-left">
																<strong>${c.memberName}</strong>
															</div>
															<div class="pull-left col-sm-3">
																${c.commentContent}
															</div>
															<div class="pull-right">
																${c.commentDate} 
																<a href>수정</a> |
																<a href="${pageContext.request.contextPath}/board/commentDelete.do">삭제</a>
															</div>
														</div>
													</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<div class="container-fluid">
														<div class="pull-left">
															<strong>${c.memberName}</strong>
														</div>
														<div class="pull-left col-sm-5">
															${c.commentContent}
														</div>
														<div class="pull-right">
															${c.commentDate} 
														</div>
													</div>
												</tr>
											</c:otherwise>
									</c:choose>
								</c:forEach>
								</c:if>
							</div>
							<tr>
							<table class="table table-striped table-condensed table-responsive">
								<div class="form-group">
									<form class="form-inline" action="${pageContext.request.contextPath}/board/${board.boardNo}/commentWrite.do" method="post">
										<td colspan="2" width="100%">
											<input type="text" name="commentContent" class="form-control">
										</td>
										<td>
											<button class="btn btn-default">글쓰기</button>
										</td>
									</form>
								</div>
								</table>
							</tr>
						</tbody>
					</table>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<br>
	</c:if>
	<script>
		$("#up").click(function () {
			$.ajax ({
				url: "/seok/board/up.do",
				data: "boardNo=" + ${board.boardNo},	
				success: function () {
					
					var i =	parseInt($("#upCount").text()) + 1;
					$("#upCount").html(i);
					
					$("#up").attr("disabled","disabled");
					$("#down").attr("disabled","disabled");
				}
			})
		});
		$("#down").click(function () {
			$.ajax ({
				url: "/seok/board/down.do",
				data: "boardNo=" + ${board.boardNo},
				success: function () {
					var i =	parseInt($("#downCount").text()) - 1;
					$("#downCount").html(i);
					
					$("#up").attr("disabled","disabled");
					$("#down").attr("disabled","disabled");
				}
			})
		});
	</script>
</body>
</html>