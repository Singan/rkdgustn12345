<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='https://code.jquery.com/jquery-2.1.3.min.js'></script>
<script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


<link rel="stylesheet" href="https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.css">
<script src='https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-pt-BR.js'></script>
<script src='http://issues.wenzhixin.net.cn/bootstrap-table/assets/bootstrap-table/src/extensions/toolbar/bootstrap-table-toolbar.js'></script>
<title>Insert title here</title>
</head>
<body>
	<br>
	<form class="form-inline" action="${pageContext.request.contextPath}/board/freeWrite.do">
	<div class="form-group container-fluid">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<div padding="30px" class="container-fluid">
						<div class="pull-left">
							<a href="${pageContext.request.contextPath}/board/free.do">
								<img src="${pageContext.request.contextPath}/css/backlist.jpg" width="100px">
							</a>	
						</div>
						
						<div class="col-xs-7">
							<input type="text" name="boardName" class="form-control" placeholder="제목">
						</div>
						 	
						<div class="pull-right">
							<button class="btn btn-default">작성</button>				
						</div>
					</div>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<div class="pull-right">
								<input type="image" class="form-control" value="이미지">
								<i class="fa fa-picture-o" aria-hidden="true"></i>
							</div>	
							<div class="pull-right">
								<input type="file" class="form-control" value="파일">
								<i class="fa fa-file-o" aria-hidden="true"></i>
							</div>	
						</div>
					 </td>
				</tr>
				<tr>
					<td>
						<div>
							<textarea class="form-control col-sm-5" name="boardContent" rows="10" style='overflow:hidden;'></textarea>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<br>
	<br>
	<br>
</body>
</html>