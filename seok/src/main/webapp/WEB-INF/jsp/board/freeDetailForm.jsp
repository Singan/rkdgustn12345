<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<br>
	<div style="width: 100%; padding: 10px;" class="container-fluid">
		<table width=100% class="table table-striped table-bordered">
			<thead>
				<tr>
					<div padding="30px" class="container-fluid">
						<div class="pull-left">
						
							<a href="${pageContext.request.contextPath}/board/free.do">
								<img src="${pageContext.request.contextPath}/css/backlist.jpg" width="100px">
							</a>	
						</div>
						<div class="col-xs-7">
							<div>
								제목: 제목
							</div>
							
							<div>
								작성자: 석성희 | 조회수: 70 | 댓글수: 5 | 추천수: 7						
							</div>
						</div>
						<div class="pull-right">
							<div>
								번호: 2
							</div>
							
							<div>
								작성일: 2017-01-01 12:00:00						
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
								<div>	
									내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용
							 	</div>
							 	<div>
									이미지
								</div>
							</div>
							<div  class="pull-right" >
								<button type="button" class="btn btn-default">수정</button>
								<button type="button" class="btn btn-default">삭제</button>
							</div>
						</div>
					 </td>
				</tr>
				<tr>
					<td colspan="6">
						<div class="container-fluid" style='width:400px;'>
							<div class="col-sm-1 pull-left">
								<i class="fa fa-thumbs-o-up fa-2x" aria-hidden="true"></i>
							</div>
							
							<div class="pull-left col-sm-1"><strong>10</strong></div>
							
							<div class="pull-left col-sm-2">
								<button type="button" class="btn btn-default">추천</button>
							</div>
							<div class="pull-left col-sm-3">
								<button type="button" class="btn btn-default">비추천</button>
							</div>
							
							<div class="col-sm-1 pull-left">
								<i class="fa fa-thumbs-o-down fa-2x" aria-hidden="true"></i>
							</div>
							
							<div class="pull-left col-sm-1"><strong>-10</strong></div>
						</div>
					</td>
				</tr>
				<tr>
			
					<table class="table table-striped table-condensed table-responsive">
						<tbody>
							<div class="form-group container-fluid">
							<tr>
								<th>이름</th>
								<td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
								<td>2017-01-01 12:00:00 수정 | 삭제</td>
							
							<tr>
							<tr>
								<th>이름</th>
								<td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
								<td>2017-01-01 12:00:00</td>
							<tr>
							<tr>
								<th>이름</th>
								<td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
								<td>2017-01-01 12:00:00</td>
							<tr/>
							</div>
							<tr>
							<table class="table table-striped table-condensed table-responsive">
								<div class="form-group">
									<form class="form-inline">
										<td colspan="2" width="100%">
											<input type="text" class="form-control">
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/board/freeWriteForm.do" class="btn btn-default">글쓰기</button>
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
</body>
</html>