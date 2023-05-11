<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>지도 레벨 바꾸기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script>var pageId = 'DE_002', pageName = 'sample';</script>

<body>
	<h1>지도 레벨 바꾸기</h1>
	<ul class="listStyle-01 row">
		<li style="margin-top: 12px; margin-bottom: 12px;">지도 레벨을 지도 객체 메소드를 호출해서 변경합니다.</li>
	</ul>
	<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden; background: url("https://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png");"></div>
    
	<button id="zoom-in" class="zoomBtn">Zoom in</button>
    <button id="zoom-out" class="zoomBtn">Zoom out</button>
	<div class="text" style="margin-top: 10px;margin-bottom: 10px;font-size: 18px;font-weight: bold;">현재 지도 레벨은 <span id="level">17</span>레벨  입니다.</div>

	<script type="text/javascript">
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

		// ScaleLine 컨트롤을 생성
		scaleLine = new ol.control.ScaleLine();

		// 지도 객체에 ScaleLine 컨트롤 추가
		map.addControl(scaleLine);

		// 이벤트 리스너 등록: minusButton을 누르면 지도 축소(zoom out)
		document.getElementById('zoom-out').onclick = function() {
			var view = map.getView();
			var zoom = view.getZoom();
			if (zoom > 1) {
				view.setZoom(zoom - 1);
				document.getElementById("level").innerHTML = (zoom - 1);
			}
		};

		// 이벤트 리스너 등록: plusButton을 누르면 지도 확대(zoom in)
		document.getElementById('zoom-in').onclick = function() {
			var view = map.getView();
			var zoom = view.getZoom();
			if (zoom < 19) {
				view.setZoom(zoom + 1);
				document.getElementById("level").innerHTML = (zoom + 1);
			}
		};
	</script>
	<div class="wrap_tab">
        <ul>
            <li class="code-01" onclick="toggleCodeDisplay('jsCode')">Javascript</li>
            <li class="code-02" onclick="toggleCodeDisplay('htmlCode')">Javascript + HTML</li>
        </ul>
		<div id="jsCode" class="tabbody">
			<figure class="highlight">
				<pre><code class="language-js" data-lang="js">//지도를 표시할 div 요소를 가져옵니다.
var mapContainer = document.getElementById('map');

// OpenLayers를 사용하여 지도를 생성합니다.
var map = new ol.Map({
		// 지도가 표시될 HTML 요소를 설정합니다.
		target : mapContainer,
	
		// 지도 레이어를 설정합니다.
		layers : [ new ol.layer.Tile({
			source : new ol.source.OSM({
				attributions : false
			})
		}) ],

		// 지도의 뷰 설정을 구성합니다.
		view : new ol.View({
				// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
				center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
		
				// 지도의 초기 확대/축소 레벨을 설정합니다.
				zoom : 17,
		})
});

// ScaleLine 컨트롤을 생성
var scaleLine = new ol.control.ScaleLine();

// 지도 객체에 ScaleLine 컨트롤 추가
map.addControl(scaleLine);</code></pre>
			</figure>
		</div>
		<div id="htmlCode" class="tabbody" style="display: none;">
		<figure class="highlight">
			<pre><code class="language-html" data-lang="html">&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;지도 레벨 바꾸기&lt;/title&gt;
		
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 350px;"&gt;&lt;/div&gt;

&lt;button id="minusButton" class="button"&gt;지도레벨 -1&lt;/button&gt;
&lt;button id="plusButton" class="button"&gt;지도레벨 +1&lt;/button&gt;

&lt;div class="text">현재 지도 레벨은 &lt;span id="level"&gt;17&lt;/span&gt;레벨  입니다.&lt;/div&gt;

&lt;script&gt;
		//지도를 표시할 div 요소를 가져옵니다.
		var mapContainer = document.getElementById('map');
	
		// OpenLayers를 사용하여 지도를 생성합니다.
		var map = new ol.Map({
				// 지도가 표시될 HTML 요소를 설정합니다.
				target : mapContainer,
		
				// 지도 레이어를 설정합니다.
				layers : [ new ol.layer.Tile({
						source : new ol.source.OSM({
								attributions : false
						})
				}) ],
	
				// 지도의 뷰 설정을 구성합니다.
				view : new ol.View({
						// 지도의 중심 좌표를 설정합니다. (위도, 경도 순서로 입력)
						center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]), // 서울시청 좌표
			
						// 지도의 초기 확대/축소 레벨을 설정합니다.
						zoom : 17,
				})
		});
		
		// ScaleLine 컨트롤을 생성
		var scaleLine = new ol.control.ScaleLine();
		
		// 지도 객체에 ScaleLine 컨트롤 추가
		map.addControl(scaleLine);
		
		// 이벤트 리스너 등록: minusButton을 누르면 지도 축소(zoom out)
		document.getElementById('minusButton').addEventListener('click', function() {
				  var view = map.getView();
				  var zoom = view.getZoom();
				  if (zoom > 1) {
				    	view.setZoom(zoom - 1);
				    	document.getElementById("level").innerHTML =  (zoom - 1) ;
				  }
		});
		
		// 이벤트 리스너 등록: plusButton을 누르면 지도 확대(zoom in)
		document.getElementById('plusButton').addEventListener('click', function() {
				  var view = map.getView();
				  var zoom = view.getZoom();
				  if (zoom < 19) {
				    	view.setZoom(zoom + 1);
				    	document.getElementById("level").innerHTML =  (zoom + 1) ;
				  }
		});
&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>
			</figure>
		</div>


	
</body>
</html>
