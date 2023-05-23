<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>지도 정보 얻어오기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<style>
.mapButtonContainer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 220px;
	height: 50px;
	margin: 0 auto;
	border: 1px solid #999;
	border-radius: 15px;
	background-color: #fff;
	box-shadow: rgba(0, 0, 0, 0.3) 1px 1px 2px;
}

.mapButton {
	display: inline-block;
	border: none;
	width: 100px;
	height: 30px;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	color: #000;
	background-color: #fff;
	cursor: pointer;
	-webkit-transition: background-color 0.4s ease-in-out;
	transition: background-color 0.4s ease-in-out;
}

.mapButton.active {
	color: #fff;
	background-color: #243447;
}
</style>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>
<script>var pageId = 'DE_002', pageName = 'sample'</script>

<body>
	<h1>지도 정보 얻어오기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도 레벨, 중심좌표, 지도 타입, 지도 영역정보를 얻어와 표출합니다.</li>
		<a href="" target="_blank"><li class="textContent">지도 타입을
				보시려면 여기를 클릭하세요!</li></a>
	</ul>
	<p style="text-align: right;">[작성일: 2023-05-18]</p>
	<div id="map"
		style="width: 100%; height: 330px; position: relative; overflow: hidden; background: url('https://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png');"></div>

	<div style="border: 2px solid black; padding: 5px; max-width: 200px;">
		<div style="display: flex; justify-content: center;">
			<button id="normalButton" class="mapButton active" value="normal">지도</button>
			<button id="skyviewButton" class="mapButton" value="skyview">스카이뷰</button>
		</div>
	</div>

	<script>
		// 지도를 표시할 div 요소를 가져옵니다.
		var mapContainer = document.getElementById('map');

		// OpenLayers를 사용하여 지도를 생성합니다.
		var normalMapLayer = new ol.layer.Tile({
			source : new ol.source.OSM({
				attributions : false
			})
		});

		var skyviewMapLayer = new ol.layer.Tile(
				{
					source : new ol.source.XYZ(
							{
								url : "https://xdworld.vworld.kr/2d/Satellite/201612/{z}/{x}/{y}.jpeg"
							}),
					visible : false
				});

		// OpenLayers를 사용하여 지도를 생성합니다.
		var map = new ol.Map({
			// 지도가 표시될 HTML 요소를 설정합니다.
			target : mapContainer,

			// 지도 레이어를 설정합니다.
			layers : [ normalMapLayer, skyviewMapLayer ],

			// 지도의 뷰 설정을 구성합니다.
			view : new ol.View({
				// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
				center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표

				// 지도의 초기 확대/축소 레벨을 설정합니다.
				zoom : 17,
			})
		});

		const buttons = document.querySelectorAll(".mapButton");
		const mapLayers = [normalMapLayer, skyviewMapLayer];

		buttons.forEach((button, index) => {
		  button.addEventListener("click", () => {
		    mapLayers.forEach((layer, layerIndex) => {
		      layer.setVisible(layerIndex === index);
		    });

		    // 현재 선택된 버튼의 스타일을 변경합니다.
		    buttons.forEach((btn, btnIndex) => {
		      const isActive = btnIndex === index;
		      btn.classList.toggle("active", isActive);
		      btn.style.color = isActive ? "#fff" : "#000";
		      btn.style.backgroundColor = isActive ? "#243447" : "#fff";
		    });
		  });
		});
	</script>

	<div class="wrap_tab">
		<ul>
			<li class="code-01" onclick="toggleCodeDisplay('jsCode')">Javascript</li>
			<li class="code-02" onclick="toggleCodeDisplay('htmlCode')">Javascript
				+ HTML</li>
		</ul>
		<div id="jsCode" class="tabbody">
			<figure class="highlight">
				<pre>
					<code class="language-js"
						style="margin-top: 0; margin-bottom: 30px;" data-lang="js">
// 지도를 표시할 div 요소를 가져옵니다.
var mapContainer = document.getElementById('map');

// OpenLayers를 사용하여 지도를 생성합니다.
var normalMapLayer = new ol.layer.Tile({
		source : new ol.source.OSM({
				attributions : false
		})
});

var skyviewMapLayer = new ol.layer.Tile({
		source : new ol.source.XYZ({
				url : "https://xdworld.vworld.kr/2d/Satellite/201612/{z}/{x}/{y}.jpeg"
		}),
		visible : false
});

// OpenLayers를 사용하여 지도를 생성합니다.
var map = new ol.Map({
		// 지도가 표시될 HTML 요소를 설정합니다.
		target : mapContainer,
	
		// 지도 레이어를 설정합니다.
		layers : [ normalMapLayer, skyviewMapLayer ],
	
		// 지도의 뷰 설정을 구성합니다.
		view : new ol.View({
				// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
				center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
		
				// 지도의 초기 확대/축소 레벨을 설정합니다.
				zoom : 17,
		})
});

</code>
				</pre>
			</figure>
		</div>
		<div id="htmlCode" class="tabbody" style="display: none;">
			<figure class="highlight">
				<pre>
					<code class="language-html"
						style="margin-top: 0; margin-bottom: 30px;"
						zssz666data-lang="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;지도 정보 얻어오기&lt;/title&gt;
		
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;div style="border: 2px solid black; padding: 5px; max-width: 300px;"&gt;
  		&lt;div style="display: flex; justify-content: center;"&gt;
  				&lt;button id="normalButton" class="mapButton active" value="normal"&gt;지도&lt;/button&gt;
  				&lt;button id="skyviewButton" class="mapButton" value="skyview"&gt;스카이뷰&lt;/button&gt;
		&lt;/div&gt;
&lt;/div&gt;

&lt;script&gt;
		// 지도를 표시할 div 요소를 가져옵니다.
		var mapContainer = document.getElementById('map');
		
		// OpenLayers를 사용하여 지도를 생성합니다.
		var normalMapLayer = new ol.layer.Tile({
				source : new ol.source.OSM({
						attributions : false
				})
		});
		
		var skyviewMapLayer = new ol.layer.Tile({
				source : new ol.source.XYZ({
						url : "https://xdworld.vworld.kr/2d/Satellite/201612/{z}/{x}/{y}.jpeg"
				}),
				visible : false
		});
		
		// OpenLayers를 사용하여 지도를 생성합니다.
		var map = new ol.Map({
				// 지도가 표시될 HTML 요소를 설정합니다.
				target : mapContainer,
			
				// 지도 레이어를 설정합니다.
				layers : [ normalMapLayer, skyviewMapLayer ],
			
				// 지도의 뷰 설정을 구성합니다.
				view : new ol.View({
						// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
						center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
				
						// 지도의 초기 확대/축소 레벨을 설정합니다.
						zoom : 17,
				})
		});
		
		const buttons = document.querySelectorAll(".mapButton");
		const mapLayers = [normalMapLayer, skyviewMapLayer];

		buttons.forEach((button, index) => {
			button.addEventListener("click", () => {
				mapLayers.forEach((layer, layerIndex) => {
					layer.setVisible(layerIndex === index);
				});
		
		    	// 현재 선택된 버튼의 스타일을 변경합니다.
		    	buttons.forEach((btn, btnIndex) => {
		     		const isActive = btnIndex === index;
		      		btn.classList.toggle("active", isActive);
		      		btn.style.color = isActive ? "#fff" : "#000";
		      		btn.style.backgroundColor = isActive ? "#243447" : "#fff";
		    	});
		    	
		    });
		    
		});
&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;

</code>
				</pre>
			</figure>
		</div>
	</div>
</body>
</html>
