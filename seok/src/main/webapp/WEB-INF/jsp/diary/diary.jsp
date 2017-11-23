<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src='/seok/node_modules/jquery/dist/jquery.min.js?1=100'></script>
<link href='/seok/node_modules/fullcalendar/dist/fullcalendar.min.css' rel='stylesheet' /> 
<link href='/seok/node_modules/fullcalendar/dist/fullcalendar.print.min.css' rel='stylesheet' media='print' /> 
<script src='/seok/node_modules/moment/min/moment.min.js'></script>  
<script src='/seok/node_modules/fullcalendar/dist/fullcalendar.min.js'></script>
	<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width :900px;
        margin : 0 auto;
    }

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

	var da ;
	var dList ;
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	};
	$(document).ready(function(){
		da = new Date();
		$.ajax({
			type : "POST",
			url : getContextPath()+"/diary/createDiary.json",
			data : {diaryMonth:da.getMonth(),diaryYear:da.getYear()+1900} ,
			dataType:"json",
			success:function(data){
				dList = data;
				console.log(dList);
			}
		})
	})
	
	alert("123123")
    jQuery(document).ready(function() {
        jQuery("#calendar").fullCalendar({
              defaultDate : "2016-05-12"
            , editable : false
            , eventLimit : true
            , events: [
             
               {
                   title : "All Day Event"
                 , start : "2016-05-01"
             }
            
            ]
	        ,  eventRender: function (event, element) {
	            element.attr('href', 'javascript:void(1);');
	            element.click(function() {
	            	
	            });
	        }
        });
    });
    
</script>


	<div id="calendar"></div>
</body>
</html>