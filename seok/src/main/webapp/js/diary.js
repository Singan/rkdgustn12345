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
var currEvent;
// 달력채우기
var dList = [];
function dataSetting(data){
	
	for (var i = 0; i < data.length; i++) {
		var day = {}
		day.title = data[i].diaryContent
		day.start = data[i].diaryYear + "-" + tenLg(data[i].diaryMonth) + "-" + tenLg(data[i].diaryDay)
		day.day = tenLg(data[i].diaryDay);
		day.year = data[i].diaryYear;
		day.month = tenLg(data[i].diaryMonth);
		day.fileList = data[i].file;
		day.fileGroupNo = data[i].fileGroupNo;
		dList[i] = day;
	}
	
}
function diaryFulling(data, date) {
	dataSetting(data);
	$("#calendar").fullCalendar('removeEvents')
	$("#calendar").fullCalendar('addEventSource',dList);
	
	jQuery("button.fc-prev-button").off("click",prev);
	jQuery("button.fc-next-button").off("click",next);
	jQuery("button.fc-prev-button").click(prev);
	jQuery("button.fc-next-button").click(next);
}
function prev(){   
	da.setMonth(da.getMonth()-1);
    showCalendar(da);
}
function next(){   
	da.setMonth(da.getMonth()-1);
    showCalendar(da);
}
function dialogCreate(event,eveObj) {
	content = $("#e" + event).children().text();
	console.log("asdasdasdas");
	$("#eventInfo").html("");
	$("#filezone").html("");
	$("#eventContent").dialog({
		modal : false,
		width : 350,
		title : event,
		resizable : true,
		close : function() {},
		open:function(){
			console.log("ㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴ")
			if ($("#e" + event)) {
				$("#eventInfo").html(content);
			}
			if(eveObj){
			for(var key in eveObj.fileList){
			$("#filezone").html($("#filezone").html()+"<div><a href='"+getContextPath()+eveObj.fileList[key].filePath+"/"+
			eveObj.fileList[key].fileSystemName+"'download>"+eveObj.fileList[key].fileOriginName+"</a></div>");
			}}
		},
		buttons : {
			"저장" : function save() {
				content = $("#eventInfo").html();
				var fd = new FormData($("#diaryForm")[0]);
				fd.append("diaryMonth", currMonth);
				fd.append("diaryYear", currYear);
				fd.append("diaryDay", currDate);
				fd.append("diaryContent", content);
				if(eveObj){
				fd.append("fileGroupNo", eveObj.fileGroupNo);
				}
				$.ajax({
					processData : false,
					contentType : false,
					type : "POST",
					url : getContextPath() + "/diary/save.json",
					data : fd,
					dataType:"json",
					error : function(e) {
						console.log("에러다이개")
					},
					success : function(data) {
						alert("저장 하였습니다.")
						if(eveObj){
							console.log(eveObj._id);
							$('#calendar').fullCalendar('removeEvents', eveObj._id);
						}
						$("#calendar").fullCalendar('addEventSource',
							[ {
								title : content,
								start : currYear + "-" + currMonth + "-" + currDate,
								year : currYear,
								month : currMonth,
								day : currDate,
								fileList : data.file
							} ])
						$(".fc-content").children().each(function(a,b){
							$(b).html($(b).html());
						})
						$("#eventContent").dialog("close");
						$("#eventContent").dialog("open");
					}
				}
				)

			}
		}
	});
	
}


$("#evenContent").click(function() {
	console.log("일단 먹음")

});