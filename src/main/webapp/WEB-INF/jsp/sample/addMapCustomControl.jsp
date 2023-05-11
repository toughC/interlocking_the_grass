<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>지도에 사용자 컨트롤 올리기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">

<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script> var pageId = 'DE_002', pageName = 'sample' </script>
  <head>
   <style>
      #map1 .ol-zoom .ol-zoom-out {
        margin-top: 204px;
      }
      #map1 .ol-zoomslider {
        background-color: transparent;
        top: 2.3em;
      }

      #map1 .ol-touch .ol-zoom .ol-zoom-out {
        margin-top: 212px;
      }
      #map1 .ol-touch .ol-zoomslider {
        top: 2.75em;
      }

      #map1 .ol-zoom-in.ol-has-tooltip:hover [role=tooltip],
      #map1 .ol-zoom-in.ol-has-tooltip:focus [role=tooltip] {
        top: 3px;
      }

      #map1 .ol-zoom-out.ol-has-tooltip:hover [role=tooltip],
      #map1 .ol-zoom-out.ol-has-tooltip:focus [role=tooltip] {
        top: 232px;
      }

      #map2 .ol-zoomslider {
        top: 8px;
        left: auto;
        right: 8px;
        background-color: rgba(255,69,0,0.2);
        width: 200px;
        height: 15px;
        padding: 0;
        box-shadow: 0 0 5px rgb(255,69,0);
        border-radius: 20px;
      }

      #map2 .ol-zoomslider:hover {
        background-color: rgba(255,69,0,0.3);
      }

      #map2 .ol-zoomslider-thumb {
        height: 15px;
        width: 15px;
        margin: 0;
        filter: none;
        background-color: rgba(255,69,0,0.6);
        border-radius: 20px;
      }
      #map2 a.ol-zoomslider-handle:hover {
        background-color: rgba(255,69,0,0.7);
      }
    </style>
  </head>
  
<body>
	<h1>지도에 사용자 컨트롤 올리기</h1>
	<ul class="listStyle-01 row">
		<li style="margin-top: 12px; margin-bottom: 12px;">기본으로 제공하는 지도타입 컨트롤과 줌 컨트롤을 원하는 스타일로 직접 만들 수 있습니다. 컨트롤의 색이나 크기 등을 변경해야 할때 유용하겠지요. 아래 예제의 Javascript+HTML 코드를 참고해보세요.</li>
	</ul>
	<div id="map1" style="width: 100%; height: 330px;"></div>
	</br>
    <div id="map2" style="width: 100%; height: 330px;"></div>
    
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
					zoom : 17 // 초기 줌 레벨 설정
				})
			});
			
			// 줌 슬라이더 컨트롤을 추가하고, 지도 객체에 추가
			zoomslider = new ol.control.ZoomSlider();
			map.addControl(zoomslider);
			
			// 생성된 지도 객체 반환
			return map;
		};
		
		// createMap 함수를 호출하여, id가 'map1'인 요소에 지도 생성
		var map1 = createMap('map1');
		// createMap 함수를 호출하여, id가 'map2'인 요소에 지도 생성
		var map2 = createMap('map2');
    </script>
    
	<div class="wrap_tab">
        <ul>
            <li class="code-01" onclick="toggleCodeDisplay('jsCode')">Javascript</li>
            <li class="code-02" onclick="toggleCodeDisplay('htmlCode')">Javascript + HTML</li>
        </ul>
		<div id="jsCode" class="tabbody">
		<figure class="highlight">
			<pre><code class="language-js" data-lang="js">// divId로 전달된 요소에 지도를 생성하는 함수
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

// createMap 함수를 호출하여, id가 'map1'인 요소에 지도 생성
var map1 = createMap('map1');

// createMap 함수를 호출하여, id가 'map2'인 요소에 지도 생성
var map2 = createMap('map2');</code></pre>
		</figure>
	</div>
	<div id="htmlCode" class="tabbody" style="display: none;">
	<figure class="highlight">
		<pre><code class="language-html" data-lang="html">&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;지도에 사용자 컨트롤 올리기&lt;/title&gt;
				
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map1" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;
&lt;/br&gt;
&lt;div id="map2" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

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
		
		// createMap 함수를 호출하여, id가 'map1'인 요소에 지도 생성
		var map1 = createMap('map1');
		
		// createMap 함수를 호출하여, id가 'map2'인 요소에 지도 생성
		var map2 = createMap('map2');
&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>
			</figure>
		</div>
	</div>
  </body>
</html>