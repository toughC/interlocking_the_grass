<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>지도 이동시키기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">

<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>
<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>지도 이동시키기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도를 이동시킵니다. 지도 객체의 메소드를 통해 지도를 원하는 좌표로
			이동시킬 수 있습니다. 또, 지도가 표시되고 있는 영역크기를 벗어나지 않는 거리라면 애니메이션 효과처럼 지도를 부드럽게
			이동시킬 수도 있습니다.</li>
	</ul>
	<p style="text-align: right;">[작성일: 2023-05-18]</p>
	<div id="map"
		style="width: 100%; height: 330px; position: relative; overflow: hidden; background: url("https://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png");"></div>

	<button id="moveButton" class="zoomBtn">지도 이동하기</button>
	<button id="animateButton" class="zoomBtn">부드럽게 이동하기</button>

	<script>
		// 레이어를 포함한 지도 객체 생성
		var map = new ol.Map({
			// 지도 레이어를 설정합니다.
			layers : [ new ol.layer.Tile({
				source : new ol.source.OSM({
					attributions : false
				})
			}) ],

			// 지도가 표시될 HTML 요소를 설정합니다.
			target : 'map',

			// 지도의 뷰 설정을 구성합니다.
			view : new ol.View({
				// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
				center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
				// 지도의 초기 확대/축소 레벨을 설정합니다.
				zoom : 17
			})
		});

		function moveMap() {
			// 지도를 이동할 좌표를 설정합니다.
			var newCenter = ol.proj.fromLonLat([ 126.9779451, 37.5662952 ]); // 원하는 좌표로 수정

			// 지도를 이동합니다.
			map.getView().setCenter(newCenter);
		}

		function animateMap() {
			// 지도를 이동할 좌표를 설정합니다.
			var newCenter = ol.proj.fromLonLat([ 126.9752912, 37.5658045 ]);

			// 애니메이션 효과를 적용하여 지도를 이동합니다.
			map.getView().animate({
				center : newCenter,
				easing : ol.easing.linear, // 변경된 easing 속성
				duration : 300
			// 변경된 duration 속성
			});
		}

		//이동 버튼에 클릭 이벤트를 추가합니다.
		document.getElementById('moveButton')
				.addEventListener('click', moveMap);
		// 애니메이션 버튼에 클릭 이벤트를 추가합니다.
		document.getElementById('animateButton').addEventListener('click',
				animateMap);
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
// 레이어를 포함한 지도 객체 생성
var map = new ol.Map({
		// 지도 레이어를 설정합니다.
		layers : [ new ol.layer.Tile({
				source : new ol.source.OSM({
						attributions : false
				})
		}) ],
		
		// 지도가 표시될 HTML 요소를 설정합니다.
		target : 'map',
		
		// 지도의 뷰 설정을 구성합니다.
		view : new ol.View({
				// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
				center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
				// 지도의 초기 확대/축소 레벨을 설정합니다.
				zoom : 17
		})
});

function moveMap() {
		// 지도를 이동할 좌표를 설정합니다.
		var newCenter = ol.proj.fromLonLat([ 126.9779451, 37.5662952 ]); // 원하는 좌표로 수정
	
		// 지도를 이동합니다.
		map.getView().setCenter(newCenter);
}

function animateMap() {
		// 지도를 이동할 좌표를 설정합니다.
		var newCenter = ol.proj.fromLonLat([ 126.9752912, 37.5658045 ]);
	
		// 애니메이션 효과를 적용하여 지도를 이동합니다.
		map.getView().animate({
				center : newCenter,
				easing : ol.easing.linear,	// 변경된 easing 속성
				duration : 300	// 변경된 duration 속성
		});
}

//이동 버튼에 클릭 이벤트를 추가합니다.
document.getElementById('moveButton').addEventListener('click', moveMap);

// 애니메이션 버튼에 클릭 이벤트를 추가합니다.
document.getElementById('animateButton').addEventListener('click', animateMap);

</code>
				</pre>
			</figure>
		</div>
		<div id="htmlCode" class="tabbody" style="display: none;">
			<figure class="highlight">
				<pre>
					<code class="language-html"
						style="margin-top: 0; margin-bottom: 30px;" data-lang="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;지도 이동시키기&lt;/title&gt;
		
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;button id="moveButton" class="zoomBtn"&gt;지도 이동하기&lt;/button&gt;
&lt;button id="animateButton" class="zoomBtn"&gt;부드럽게 이동하기&lt;/button&gt;

&lt;script&gt;
		// 레이어를 포함한 지도 객체 생성
		var map = new ol.Map({
				// 지도 레이어를 설정합니다.
				layers : [ new ol.layer.Tile({
						source : new ol.source.OSM({
								attributions : false
						})
				}) ],
				
				// 지도가 표시될 HTML 요소를 설정합니다.
				target : 'map',
				
				// 지도의 뷰 설정을 구성합니다.
				view : new ol.View({
						// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
						center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
						// 지도의 초기 확대/축소 레벨을 설정합니다.
						zoom : 17
				})
		});
		
		function moveMap() {
				// 지도를 이동할 좌표를 설정합니다.
				var newCenter = ol.proj.fromLonLat([ 126.9779451, 37.5662952 ]); // 원하는 좌표로 수정
			
				// 지도를 이동합니다.
				map.getView().setCenter(newCenter);
		}
		
		function animateMap() {
				// 지도를 이동할 좌표를 설정합니다.
				var newCenter = ol.proj.fromLonLat([ 126.9752912, 37.5658045 ]);
			
				// 애니메이션 효과를 적용하여 지도를 이동합니다.
				map.getView().animate({
						center : newCenter,
						easing : ol.easing.linear,	// 변경된 easing 속성
						duration : 300	// 변경된 duration 속성
				});
		}
		
		//이동 버튼에 클릭 이벤트를 추가합니다.
		document.getElementById('moveButton').addEventListener('click', moveMap);
		
		// 애니메이션 버튼에 클릭 이벤트를 추가합니다.
		document.getElementById('animateButton').addEventListener('click', animateMap);
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
