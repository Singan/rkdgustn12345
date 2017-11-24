<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='/seok/node_modules/jquery/dist/jquery.min.js?1=1999'></script>
<script src='/seok/node_modules/jquery-ui-1.12.1/jquery-ui.js'></script>

<link href='/seok/node_modules/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet' />
<link
	href='/seok/node_modules/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<!-- <script src='/seok/node_modules/moment/src/locale/ko.js'></script>   -->

<script src='/seok/node_modules/moment/min/moment.min.js'></script>
<script src='/seok/node_modules/fullcalendar/dist/fullcalendar.js'></script>
<script src='/seok/js/diary.js'></script>
<link href='/seok/node_modules/jquery-ui-1.12.1/jquery-ui.css' rel='stylesheet'></link>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "consolas", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
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
	<div id="eventContent" title="" style="display:none;">
  
    <p id="eventInfo"></p>
    <p><strong><a id="eventLink" href="" target="_blank">Read More</a></strong></p>
</div>
	<script type="text/javascript">

	var da ;
	var dList = [] ;
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	};

	
	$(document).ready(function(){
		da = new Date();
		$.ajax({
			type : "POST",
			url : getContextPath()+"/diary/createDiary.json",
			data : {diaryMonth:da.getMonth()+1,diaryYear:da.getYear()+1900} ,
			dataType:"json",
			success:function(data){
				console.log("실행됨")
				diaryFulling(data);
			}
		})
	})
	

    
</script>



</body>
</html>