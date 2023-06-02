<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>지도에 컨트롤 올리기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">

<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>지도에 컨트롤 올리기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 버튼과 지도 확대,
			축소를 제어할 수 있는 도구를 쉽게 지도 위에 올릴 수 있습니다. 각각 지도 타입 컨트롤, 지도 줌 컨트롤이라고 부르며,
			아래 예제와 같이 지도 위에 표시될 위치를 지정할 수도 있습니다.</li>
	</ul>
	<p style="text-align: right;margin-bottom: 3px;">[작성일: 2023-05-18]</p>
	<div id="map" style="width: 100%; height: 330px;"></div>

	<script>
		// divId로 전달된 요소에 지도를 생성하는 함수
		var createMap = function(divId) {
			var source, layer, map, zoomslider;

			// OpenStreetMap 데이터 소스 생성
			source = new ol.source.OSM({
				attributions : false
			});

			// OSM 데이터 소스를 사용하는 타일 레이어 생성
			layer = new ol.layer.Tile({
				source : source
			});

			// 레이어를 포함한 지도 객체 생성
			map = new ol.Map({
				layers : [ layer ],
				target : divId, // divId로 전달된 요소를 지도의 대상으로 설정
				view : new ol.View({
					center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
					zoom : 17
				// 초기 줌 레벨 설정
				})
			});

			// 줌 슬라이더 컨트롤을 추가하고, 지도 객체에 추가
			zoomslider = new ol.control.ZoomSlider();
			map.addControl(zoomslider);

			// 생성된 지도 객체 반환
			return map;
		};

		// createMap 함수를 호출하여, id가 'map'인 요소에 지도 생성
		var map = createMap('map');
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
// divId로 전달된 요소에 지도를 생성하는 함수
var createMap = function(divId) {

		var source, layer, map, zoomslider;
		
		// OpenStreetMap 데이터 소스 생성
		source = new ol.source.OSM({
				attributions : false
		});
		
		// OSM 데이터 소스를 사용하는 타일 레이어 생성
		layer = new ol.layer.Tile({
				source : source
		});
		
		// 레이어를 포함한 지도 객체 생성
		map = new ol.Map({
				layers : [ layer ],
				target : divId, // divId로 전달된 요소를 지도의 대상으로 설정
				view : new ol.View({
						center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
						zoom : 17 // 초기 줌 레벨 설정
				})
		});
		
		// 줌 슬라이더 컨트롤을 추가하고, 지도 객체에 추가
		zoomslider = new ol.control.ZoomSlider();
		map.addControl(zoomslider);
		
		// 생성된 지도 객체 반환
		return map;
};

// createMap 함수를 호출하여, id가 'map'인 요소에 지도 생성
var map = createMap('map');

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
		&lt;title&gt;지도에 컨트롤 올리기&lt;/title&gt;
				
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;script&gt;
		// divId로 전달된 요소에 지도를 생성하는 함수
		var createMap = function(divId) {
		
				var source, layer, map, zoomslider;
				
				// OpenStreetMap 데이터 소스 생성
				source = new ol.source.OSM({
						attributions : false
				});
				
				// OSM 데이터 소스를 사용하는 타일 레이어 생성
				layer = new ol.layer.Tile({
						source : source
				});
				
				// 레이어를 포함한 지도 객체 생성
				map = new ol.Map({
						layers : [ layer ],
						target : divId, // divId로 전달된 요소를 지도의 대상으로 설정
						view : new ol.View({
								center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
								zoom : 17 // 초기 줌 레벨 설정
						})
				});
				
				// 줌 슬라이더 컨트롤을 추가하고, 지도 객체에 추가
				zoomslider = new ol.control.ZoomSlider();
				map.addControl(zoomslider);
				
				// 생성된 지도 객체 반환
				return map;
		};
		
		// createMap 함수를 호출하여, id가 'map'인 요소에 지도 생성
		var map = createMap('map');
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
