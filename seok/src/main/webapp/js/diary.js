/**
 * 
 */




	// 10보다 작은수
	function tenLg(i){
		if(i<10){
			return "0"+i;
		}
		return i;
	}












// 달력채우기
function diaryFulling(data,date){
		for(var i = 0;i<data.length;i++){
			var day = {	
			}
			day.title = data[i].diaryContent
			day.start=data[i].diaryYear+"-"+tenLg(data[i].diaryMonth)+"-"+tenLg(data[i].diaryDay)
			day.day=data[i].diaryDay;
			day.year = data[i].diaryYear;
			day.month = data[i].diaryMonth;
			dList[i]=day;
		}
			 jQuery("#calendar").fullCalendar({
			 	header:{
			 		center:"title",
			 		left:""
			 	},
	             defaultDate :  (date.getYear()+1900)+"-"+tenLg(date.getMonth()+1)+"-"+tenLg(date.getDate()),
	             editable : false,
	             eventLimit : true,
	             eventLimitText:"더보기",
	             eventLimitClick:"popover",
	           allDayDefault:true,
	            monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	            monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	            dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	            dayNamesShort: ["일","월","화","수","목","금","토"],
	            today : "오늘",
	            month : "월별",
	            week : "주별",
	            day : "일별",
	            lang:"ko"
	            , events: dList
		        ,  eventRender: function (event, element) {
		        	console.log("언제실행되지")
		            element.click(function() {
		            	dialogCreate(event.year+"-"+event.month+"-"+event.day);
		            });
		            
		        },
			 
	        })
			
		
	}
	function dialogCreate(event){
		$("#eventContent").dialog({ 
        	modal: false, width:350,
        	title: event,
            resizable: true,
        	});
		if(event.title){
		$("#eventInfo").html(event.title);
		}
	}
	
	$("#evenContent").click(function (){
		console.log("일단 먹음")
		if($("p#eventInfo").is()){
			console.log("일단 있슴")
		$("#eventInfo").replaceWith("<textarea>"+$("#eventInfo").html()+"</textarea>")
		}
	});

