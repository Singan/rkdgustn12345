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
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  </head>
  <body>
  	<input id = "market" placeholder = "가게이름"><br>
  	<input id = "review" placeholder = "평가"><br>
  	<textarea id = "menulist" placeholder = "메뉴리스트"></textarea><br>
  	<textarea id = "addr" placeholder = "주소" readonly="readonly"></textarea><br>
  	<input type="button" onclick="send();">
    <div id="map" style="width: 500px; height: 500px;"></div>
    <script>
      var map, marker;
      var address;
      var lng, lat;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.49780998323514, lng: 127.02757358551025},
          zoom: 16
        });
        map.addListener('click', function(e) {
            //placeMarkerAndPanTo(e.latLng, map);
            getAddress(e.latLng);
          });
      }
      
  	function getAddress(latlng) {
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			latLng: latlng
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0].geometry) {
					address = results[0].formatted_address.replace(/^日本, /, '');
		            if(marker != null){
		            	marker.setMap(null);
		            }
		            marker = new google.maps.Marker({
						position: latlng,
						map: map
					});
		            lat = marker.getPosition().lat();
		            lng = marker.getPosition().lng();
					new google.maps.InfoWindow({
						content: address + "<br>(Lat, Lng) = " + latlng
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
	}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7n-FcvTcQabtzMDzhuKKt5FnvEXJumAI&callback=initMap"
    async defer></script>
  </body>
</html>
