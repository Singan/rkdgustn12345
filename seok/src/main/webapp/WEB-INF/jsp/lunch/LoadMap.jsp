<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src='/seok/node_modules/jquery/dist/jquery.min.js?1=1'></script>
<script src='/seok/node_modules/jquery-ui-1.12.1/jquery-ui.js'></script>
<link href='/seok/node_modules/jquery-ui-1.12.1/jquery-ui.css'
	rel='stylesheet'></link>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
   html, body {
      position: absolute;
      height: 100%;
      width: 100%;
      margin: 0px;
   }
   div, textarea{
      margin: 0px;
   }
</style>

</head>
<body>
	<div style="width: 100%; height: 100%;">
		<div style="width: 50%; float: left;height: 100%;">
			
			<button id="addBtn">추가하기</button>
			<button id="del">화살표 지우기</button>
			<br>
			<div style="width: 100%;">
				<select multiple="multiple" style="width: 49%; float: left;">
				<option data-lat="37.49791212725605" data-lng="127.02755212783813">강남역</option>
				<c:forEach items="${lunchList}" var="i">
					<option data-lng="${i.lng}" data-lat="${i.lat}">${i.lunchName}</option>
				</c:forEach>
				</select>
				<textarea style="width: 50%; float: 50%;"></textarea>
			</div>
			
		</div>
		<div id="map" style="width:50%;height: 100%; float: right;"></div>
	</div>
	
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7n-FcvTcQabtzMDzhuKKt5FnvEXJumAI&callback=initMap"
		async defer></script>
		
	<script type="text/javascript">
		var lang;
		var select;
		var directionsService;
		var directionsDisplay;
		var markers = [];
		$("#addBtn").click(function(){
			location.href="/seok/lunch/map.do"
		})
		$("#del").click(deleteMaker);
		function deleteMaker(){
			
			for(var i = 0 ; i<markers.length;i++){
				markers[i].setMap(null);
			}
			
		}
		$("option").click(function(e){
			 select = new google.maps.LatLng($(this).data("lat"), $(this).data("lng"));
			calcRoute();
		});
		function initMap() {
			directionsDisplay = new google.maps.DirectionsRenderer();
			directionsService = new google.maps.DirectionsService();
			lang = new google.maps.LatLng(37.499648809578424, 127.0293116569519);
			//select = new google.maps.LatLng(37.50477350210875, 127.02424764633179);
			map = new google.maps.Map(document.getElementById('map'), {
				center : lang,
				zoom : 16
			});
			  directionsDisplay.setMap(map);
			var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
			  var defulatmarker = new google.maps.Marker({
				    position: lang,
				    map: map,
				    icon: image
				  });
				new google.maps.InfoWindow({
					content: "비트학원"
				}).open(map, defulatmarker);

		        map.addListener('click', function(e) {
		         
		            select = e.latLng;
		        	
		            calcRoute();
		          });
		}
		function calcRoute() {
			
			  if(select == null)
				  {	
				  	alert("선택을 해주세요")
				  	//alert('랜덤선택이 되지 않았습니다.');
				  	//return;
				  }
			 var marker =  new google.maps.Marker({
				    position: select,
				    map: map
				  });
			  var request = {
			      origin: lang,
			      destination: select,
			      // Note that Javascript allows us to access the constant
			      // using square brackets and a string value as its
			      // "property."
			      travelMode: "TRANSIT"
			  };
			  directionsService.route(request, function(response, status) {
				    if (status == 'OK') {
					      directionsDisplay.setDirections(response);
					    }
				    if (status == 'ZERO_RESULTS') {
				    	console.log(status)
					      alert('검색된 결과가 없습니다. 너무 가깝거나, 주소를 찾을수 없습니다.');
					    }
			    
			  });
			  markers.push(marker);
			  
			}
	</script>

</body>
</html>