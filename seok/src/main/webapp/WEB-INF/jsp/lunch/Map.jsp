<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript">
	var userName = "${user.memberName}"
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js?1=11123123123"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<form id="mForm"
		action="${pageContext.request.contextPath}/lunch/save.json">
		<div class="input-group">
		<input id="market" name="lunchName" placeholder="가게이름" class="form-control"><br>
		<input id="lunchReview" name="lunchReview" placeholder="평가" class="form-control"><br>
		<input name="lunchRate" placeholder="점수" class="form-control"><br>
		<textarea id="addr" name="lunchAddr" placeholder="주소"
			readonly="readonly" class="form-control"></textarea>
		<br>
		</div>
	</form>
	 <span class="input-group-btn">
	<button onclick="send();" type="button" class="btn btn-default">저장</button>
	</span>
	<div id="map" style="width: 500px; height: 500px;"></div>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7n-FcvTcQabtzMDzhuKKt5FnvEXJumAI&callback=initMap"
		async defer></script>
	<script>
		var map,
			marker;
		var address;
		var lng,
			lat;
		function initMap() {
			directionsDisplay = new google.maps.DirectionsRenderer();
			directionsService = new google.maps.DirectionsService();
			var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
			var lang = new google.maps.LatLng(37.499648809578424, 127.0293116569519)
			map = new google.maps.Map(document.getElementById('map'), {
				center : lang,
				zoom : 16
			});
			var defulatmarker = new google.maps.Marker({
				position : lang,
				map : map,
				icon : image
			});
			new google.maps.InfoWindow({
				content : "비트학원"
			}).open(map, defulatmarker);
			directionsDisplay.setMap(map);
			map.addListener('click', function(e) {
				//placeMarkerAndPanTo(e.latLng, map);
				getAddress(e.latLng);
			});
		}
	
		function getAddress(latlng) {
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				latLng : latlng
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[0].geometry) {
						address = results[0].formatted_address.replace(/^日本, /, '');
						if (marker != null) {
							marker.setMap(null);
						}
						marker = new google.maps.Marker({
							position : latlng,
							map : map
						});
						lat = marker.getPosition().lat();
						lng = marker.getPosition().lng();
						new google.maps.InfoWindow({
							content : address + "<br>(Lat, Lng) = " + latlng
						}).open(map, marker);
						$('#addr').val(address);
					}
				} else if (status == google.maps.GeocoderStatus.ERROR) {
					alert("통신중 에러발생！");
				} else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
					alert("요청에 문제발생！geocode()에 전달하는GeocoderRequest확인요！");
				} else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
					alert("단시간에 쿼리 과다송신！");
				} else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
					alert("이 페이지에는 지오코더 이용 불가! 왜??");
				} else if (status == google.maps.GeocoderStatus.UNKNOWN_ERROR) {
					alert("서버에 문제가 발생한거 같아요. 다시 한번 해보세요.");
				} else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
					alert("존재하지 않습니다.");
				} else {
					alert("버전업!!??");
				}
			});
		}
		function send() {
			//ajax를 전송해야함. 지도의 파라미터는 다음과 같음
			//lng, lat, address
			if (lng == undefined && lat == undefined) {
				alert("좌표를 지정해주세요");
				return false;
			}
			var fd = new FormData($("#mForm")[0])
			fd.append("lng", lng);
			fd.append("lat", lat);
			fd.append("memberName", userName);
			console.log(lng)
			$.ajax({
				processData : false,
				contentType : false,
				url : "/seok/lunch/save.json",
				data : fd,
				type : "POST",
				success : function(data) {
					alert("저장되었습니다")
				}
			})
		}
	</script>

</body>
</html>
