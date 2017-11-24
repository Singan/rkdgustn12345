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
				 // 헤더
			 	header:{
			 		center:"title",
			 		left:""
			 	},
			 	// 날짜포맷
			 	/*  titleFormat: {
			 	   month: "yyyy년 MMMM",
			 	   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
			 	   day: "yyyy년 MMM d일 dddd"
			 	   },  */
			 	// 오늘,드래그 , 모르는거
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
//			        	element.find('.fc-title').prepend(event.day); 
		            /* element.attr('href', 'javascript:void(1);'); */
		            element.click(function() {
		            	
		            	$("#eventContent").dialog({ 
		            	modal: false, width:350,
		            	title: event.year + "년도 " +tenLg(event.month) +"월 " + tenLg(event.day) + "일",
		                resizable: true,
		            	});
		            });
		        }
	        })
			
		}
	}