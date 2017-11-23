<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src='/seok/node_modules/jquery/dist/jquery.min.js?1=1'></script>
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
	alert(${dList});
	alert(${test});
    jQuery(document).ready(function() {
        jQuery("#calendar").fullCalendar({
              defaultDate : "2016-05-12"
            , editable : false
            , eventLimit : true
            , events: [
                {
                      title : "All Day Event"
                    , start : "2016-05-01"
                },
                {
                      title : "Long Event"
                    , start : "2016-05-07"
                    , end : "2016-05-10"
                },
                {
                      id : 999
                    , title : "Repeating Event"
                    , start : "2016-05-09T16:00:00"
                },
                {
                      id : 999
                    , title : "Repeating Event"
                    , start : "2016-05-16T16:00:00"
                },
                {
                      title : "Conference"
                    , start : "2016-05-11"
                    , end : "2016-05-13"
                },
                {
                      title : "Meeting"
                    , start : "2016-05-12T10:30:00"
                    , end : "2016-05-12T12:30:00"
                },
                {
                      title : "Lunch"
                    , start : "2016-05-12T12:00:00"
                },
                {
                      title : "Meeting"
                    , start : "2016-05-12T14:30:00"
                },
                {
                      title : "Happy Hour"
                    , start : "2016-05-12T17:30:00"
                },
                {
                      title : "Dinner"
                    , start : "2016-05-12T20:00:00"
                },
                {
                      title : "Birthday Party"
                    , start : "2016-05-13T07:00:00"
                },
                {
                      title : "Click for Google"
                    , url : "http://google.com/"
                    , start : "2016-05-28"
                }
            ]
	        ,  eventRender: function (event, element) {
	            element.attr('href', 'javascript:void(0);');
	            element.click(function() {
	            	alert(${dList})
	            });
	        }
        });
    });
    
</script>


	<div id="calendar"></div>
</body>
</html>