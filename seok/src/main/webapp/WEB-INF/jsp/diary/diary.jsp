<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src='/seok/node_modules/jquery/dist/jquery.min.js?1=11'></script>
<script src='/seok/node_modules/jquery-ui-1.12.1/jquery-ui.js'></script>

<link href='/seok/node_modules/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet' />
<link href='/seok/node_modules/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<!-- <script src='/seok/node_modules/moment/src/locale/ko.js'></script>   -->

<script src='/seok/node_modules/moment/min/moment.min.js'></script>
<script src='/seok/node_modules/fullcalendar/dist/fullcalendar.js'></script>
<script src='/seok/js/diary.js'></script>
<link href='/seok/node_modules/jquery-ui-1.12.1/jquery-ui.css'
	rel='stylesheet'></link>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "consolas", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}
html,body{
	height:100%;
}
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
#eventInfo{
	height: 100%;
}
.fc-content {
	height: 60px;
}
span.fc-title{
	display: inline-block;
	height: 100%;
}
.fc-sat {
	color: #0000FF;
} /* 토요일 */
.fc-sun {
	color: #FF0000;
}
</style>
</head>
<body>

	<div id="calendar"></div>
	<div id="eventContent" title="" style="display: none;">
	<div id="eventInfo" contenteditable="true"></div><div id="filezone"></div>
	<form id="diaryForm" action="${pageContext.request.contextPath}/diary/save.json" enctype="multipart/form-data">
	<label class="btn btn-danger" id="product-images-add" for="product-images-files" style="float:right">
      <input class="hide" id="product-images-files" type="file" name="attach" accept="image/*" multiple="multiple">
                                        <i class="fa fa-file-image-o" aria-hidden="true"></i> 이미지 추가
                                   </label>
	</form>
	</div>
	<script type="text/javascript">
		var da;
		var dList = [];
		var eve;
		
		$(document).ready(function() {
			da = new Date();
			$.ajax({
				type : "POST",
				url : getContextPath() + "/diary/createDiary.json",
				data : {
					diaryMonth : da.getMonth() + 1,
					diaryYear : da.getYear() + 1900
				},
				dataType : "json",
				success : function(data) {
					diaryFulling(data, da);
					$(".fc-day").on("click", function() {
						console.log($("#e"+$(this).data("date")));
						dialogCreate($(this).data("date"),$("#e"+$(this).data("date")));
					});
					$("td.fc-day-top").off();
				
					console.log($(".fc-day-top"));
				}
			})
		})
	</script>
</body>
</html>