<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
		
		var eve;
		
		$(document).ready(function() {
			da = new Date();
			jQuery("#calendar").fullCalendar({
				header : {
					center : "title",
					left : ""
				},
				defaultDate : (da.getYear() + 1900) + "-" + tenLg(da.getMonth() + 1) + "-" + tenLg(da.getDate()),
				editable : false,
				eventLimit : true,
				eventLimitText : "더보기",
				eventLimitClick : "popover",
				allDayDefault : true,
				monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				today : "오늘",
				month : "월별",
				week : "주별",
				day : "일별",
				lang : "ko",
				dayClick : function(date, jsEvent, view,event) {
					var da = date.format();
					dialogCreate(da)
					console.dir(jsEvent);
					currDate = da.split("-")[2];
					currMonth = da.split("-")[1];
					currYear = da.split("-")[0];
				},
				eventAfterRender : function(event, element, view) {
					
					$(".fc-content").children().each(function(a,b){
						$(b).html($(b).html());
					})
					element.children()[0].id = "e" + event.year + "-" + event.month + "-" + event.day;
					element.off("click");
					element.click(function(c) {
						currEvent = event;
						currYear = event.year;
						currMonth = event.month ;
						currDate = event.day;
						dialogCreate(currYear + "-" + currMonth + "-" + currDate,event);
					});
				},
				eventRender : function(event, element) {
					
				},
				 eventClick: function(calEvent, jsEvent, view) {
				       
				    }
			})
			showCalendar(da);
			})
		
		
		function showCalendar(da){
			$.ajax({
				type : "POST",
				url : getContextPath() + "/diary/createDiary.json",
				data : {
					diaryMonth : da.getMonth() + 1,
					diaryYear : da.getYear() + 1900
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					diaryFulling(data, da);
					$(".fc-day").on("click", function() {
						console.log($("#e"+$(this).data("date")));
						dialogCreate($(this).data("date"),$("#e"+$(this).data("date")));
					});
					$("td.fc-day-top").off();
				
					console.log($(".fc-day-top"));
				}
			})
		}
	</script>
</body>
</html>