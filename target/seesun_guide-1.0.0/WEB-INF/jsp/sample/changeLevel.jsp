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

<script>
	var pageId = 'DE_002', pageName = 'sample';
</script>

<body>
	<h1>지도 레벨 바꾸기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도 레벨을 지도 객체 메소드를 호출해서 변경합니다.</li>
	</ul>
	<p style="text-align: right;">[작성일: 2023-05-18]</p>
	<div id="map"
		style="width: 100%; height: 330px; position: relative; overflow: hidden; background: url("https://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png");"></div>

	<button id="zoom-in" class="zoomBtn">Zoom in</button>
	<button id="zoom-out" class="zoomBtn">Zoom out</button>
	<div class="text"
		style="margin: 10px 0; font-size: 18px; font-weight: bold;">
		현재 지도 레벨은 <span id="level">17</span>레벨 입니다.
	</div>

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
			<li onclick="toggleCodeDisplay('jsCode', this)" class="code-01">Javascript</li>
			<li onclick="toggleCodeDisplay('htmlCode', this)" class="code-02">Javascript
				+ HTML</li>
		</ul>

		<div id="jsCode">
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

</code>
				</pre>
			</figure>
		</div>
		<div id="htmlCode" style="display: none;">
			<figure class="highlight">
				<pre>
					<code class="language-html"
						style="margin-top: 0; margin-bottom: 30px;" data-lang="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;지도 레벨 바꾸기&lt;/title&gt;
		
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;button id="minusButton" class="zoomBtn"&gt;지도레벨 -1&lt;/button&gt;
&lt;button id="plusButton" class="zoomBtn"&gt;지도레벨 +1&lt;/button&gt;

&lt;div class="text" style="margin: 10px 0;font-size: 18px;font-weight: bold;">현재 지도 레벨은 &lt;span id="level"&gt;17&lt;/span&gt;레벨  입니다.&lt;/div&gt;

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
&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;

</code>
				</pre>
			</figure>
		</div>
</body>
</html>
