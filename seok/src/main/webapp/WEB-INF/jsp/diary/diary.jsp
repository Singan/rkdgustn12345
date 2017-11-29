<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='/seok/node_modules/jquery/dist/jquery.min.js?1=1991'></script>
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
	<div id="eventInfo" contenteditable="true"></div>
	<form id="diaryForm" action="${pageContext.request.contextPath}/diary/save.json" enctype="multipart/form-data">
	<input name="attach" type="file" multiple="multiple"/>

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