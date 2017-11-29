/**
 * 
 */

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}
;


// 10보다 작은수
function tenLg(i) {
	if (i < 10) {
		return "0" + i;
	}
	return i;
}










var content;
var currYear,
	currMonth;
var currDate;
// 달력채우기
function diaryFulling(data, date) {
	for (var i = 0; i < data.length; i++) {
		var day = {
		}
		day.title = data[i].diaryContent
		day.start = data[i].diaryYear + "-" + tenLg(data[i].diaryMonth) + "-" + tenLg(data[i].diaryDay)
		day.day = tenLg(data[i].diaryDay);
		day.year = data[i].diaryYear;
		day.month = tenLg(data[i].diaryMonth);
		dList[i] = day;
	}
	jQuery("#calendar").fullCalendar({
		header : {
			center : "title",
			left : ""
		},
		defaultDate : (date.getYear() + 1900) + "-" + tenLg(date.getMonth() + 1) + "-" + tenLg(date.getDate()),
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
		dayClick : function(date, jsEvent, view) {
			dialogCreate(date.format())
			console.dir(date.year)
		},
		events : dList,
		eventRender : function(event, element) {
			element.children()[0].id = "e" + event.year + "-" + event.month + "-" + event.day;
			element.off("click");
			element.click(function(c) {
				console.log("이벤트", c)
				currYear = event.year;
				currMonth = event.month ;
				currDate = event.day;
				/*currDate = event.day;*/
				dialogCreate(currYear + "-" + currMonth + "-" + currDate);
			});

		},
	})
}
function dialogCreate(event) {
	content = $("#e" + event).children().html();
	$("#eventInfo").html("");
	$("#eventContent").dialog({
		modal : false,
		width : 350,
		title : event,
		resizable : true,
		close : function() {
			$("#e" + event).children().html(content);
		},
		buttons : {
			"저장" : save
		}
	});
	if ($("#e" + event)) {
		$("#eventInfo").html(content);
	}
}
function save() {
	content = $("#eventInfo").html();
	var fd = new FormData($("#diaryForm")[0]);
	fd.append("diaryMonth",currMonth);
	fd.append("diaryYear",currYear);
	fd.append("diaryDay",currDate);
	fd.append("diaryContent",content);
	$.ajax({
		processData : false,
		contentType : false,
		type : "POST",
		dataType : "json",
		url : getContextPath() + "/diary/save.json",
		data : fd,
		error : function(e) {
			console.log("에러에러에러에러", e);
		},
		success : function(event) {
			console.log("성공")
		}
	})

}
$("#evenContent").click(function() {
	console.log("일단 먹음")

});