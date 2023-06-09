<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>사각형, 박스, 별 그리기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>사각형, 박스, 별 그리기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도 위에 사각형, 박스, 별을 그릴 수 있습니다.</li>
	</ul>
	<p style="text-align: right;margin-bottom: 3px;">마지막 수정 2023.06.02</p>
	<div id="map" style="width: 100%; height: 330px;"></div>
	
	<button id="squareButton" class="zoomBtn">Square</button>
	<button id="boxButton" class="zoomBtn">Box</button>
	<button id="starButton" class="zoomBtn">Star</button>
	<button id="noneButton" class="zoomBtn">None</button>

<script type="text/javascript">
var raster = new ol.layer.Tile({
	  source: new ol.source.OSM() // OSM 타일 레이어 생성
	});

	var source = new ol.source.Vector({ wrapX: false }); // 벡터 데이터 소스 생성

	var vector = new ol.layer.Vector({
	  source: source // 벡터 레이어 생성
	});

	var map = new ol.Map({
	  layers: [raster, vector], // 레이어 목록 설정
	  target: 'map', // 지도를 렌더링할 HTML 요소 ID
	  view: new ol.View({
	    center: ol.proj.fromLonLat([126.9784, 37.5667]), // 중심점 좌표 설정
	    zoom: 17 // 초기 줌 레벨 설정
	  })
	});

	var squareButton = document.getElementById('squareButton');
	var boxButton = document.getElementById('boxButton');
	var starButton = document.getElementById('starButton');
	var noneButton = document.getElementById('noneButton'); // None 버튼 추가

	var draw; // 나중에 제거하기 위해 전역 변수로 선언

	function addInteraction(value) {
	  var geometryFunction;

	  if (value === 'Square') {
	    value = 'Circle';
	    geometryFunction = ol.interaction.Draw.createRegularPolygon(4); // 정사각형 그리기 함수
	  } else if (value === 'Box') {
	    value = 'Circle';
	    geometryFunction = ol.interaction.Draw.createBox(); // 사각형 그리기 함수
	  } else if (value === 'Star') {
	    value = 'Circle';
	    geometryFunction = function (coordinates, geometry) {
	      // 별 모양 그리기 함수
	      if (!geometry) {
	        geometry = new ol.geom.Polygon(null);
	      }

	      var center = coordinates[0];
	      var last = coordinates[1];
	      var dx = center[0] - last[0];
	      var dy = center[1] - last[1];
	      var radius = Math.sqrt(dx * dx + dy * dy);
	      var rotation = Math.atan2(dy, dx);
	      var newCoordinates = [];
	      var numPoints = 12;

	      for (var i = 0; i < numPoints; ++i) {
	        var angle = rotation + (i * 2 * Math.PI) / numPoints;
	        var fraction = i % 2 === 0 ? 1 : 0.5;
	        var offsetX = radius * fraction * Math.cos(angle);
	        var offsetY = radius * fraction * Math.sin(angle);
	        newCoordinates.push([center[0] + offsetX, center[1] + offsetY]);
	      }

	      newCoordinates.push(newCoordinates[0].slice());
	      geometry.setCoordinates([newCoordinates]);
	      return geometry;
	    };
	  }

	  draw = new ol.interaction.Draw({
	    source: source, // 그리기 작업의 대상이 될 소스 설정
	    type: value, // 그리기 유형 설정
	    geometryFunction: geometryFunction // 사용자 정의 그리기 함수 설정
	  });

	  map.addInteraction(draw); // 그리기 상호작용 추가
	}

	squareButton.onclick = function () {
	  map.removeInteraction(draw); // 이전 상호작용 제거
	  addInteraction('Square'); // 정사각형 그리기 추가
	};

	boxButton.onclick = function () {
	  map.removeInteraction(draw); // 이전 상호작용 제거
	  addInteraction('Box'); // 사각형 그리기 추가
	};

	starButton.onclick = function () {
	  map.removeInteraction(draw); // 이전 상호작용 제거
	  addInteraction('Star'); // 별 모양 그리기 추가
	};

	noneButton.onclick = function () {
		  map.removeInteraction(draw); // 이전 상호작용 제거
	};

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
var raster = new ol.layer.Tile({
		source: new ol.source.OSM() // OSM 타일 레이어 생성
});

var source = new ol.source.Vector({ wrapX: false }); // 벡터 데이터 소스 생성

var vector = new ol.layer.Vector({
  		source: source // 벡터 레이어 생성
});

var map = new ol.Map({
		layers: [raster, vector], // 레이어 목록 설정
		target: 'map', // 지도를 렌더링할 HTML 요소 ID
		view: new ol.View({
				center: ol.proj.fromLonLat([126.9784, 37.5667]), // 중심점 좌표 설정
    			zoom: 17 // 초기 줌 레벨 설정
  		})
});

var squareButton = document.getElementById('squareButton');
var boxButton = document.getElementById('boxButton');
var starButton = document.getElementById('starButton');
var noneButton = document.getElementById('noneButton');

var draw; // 나중에 제거하기 위해 전역 변수로 선언

function addInteraction(value) {
		var geometryFunction;
		
		if (value === 'Square') {
				value = 'Circle';
		  		geometryFunction = ol.interaction.Draw.createRegularPolygon(4); // 정사각형 그리기 함수
		} else if (value === 'Box') {
				value = 'Circle';
				geometryFunction = ol.interaction.Draw.createBox(); // 사각형 그리기 함수
		} else if (value === 'Star') {
				value = 'Circle';
		  		geometryFunction = function (coordinates, geometry) {
		    	// 별 모양 그리기 함수
		    	if (!geometry) {
		    			geometry = new ol.geom.Polygon(null);
		    	}
		
		    	var center = coordinates[0];
			    var last = coordinates[1];
			    var dx = center[0] - last[0];
			    var dy = center[1] - last[1];
			    var radius = Math.sqrt(dx * dx + dy * dy);
			    var rotation = Math.atan2(dy, dx);
			    var newCoordinates = [];
			    var numPoints = 12;
		
			    for (var i = 0; i < numPoints; ++i) {
						var angle = rotation + (i * 2 * Math.PI) / numPoints;
						var fraction = i % 2 === 0 ? 1 : 0.5;
						var offsetX = radius * fraction * Math.cos(angle);
						var offsetY = radius * fraction * Math.sin(angle);
						newCoordinates.push([center[0] + offsetX, center[1] + offsetY]);
			    }
		
				newCoordinates.push(newCoordinates[0].slice());
				geometry.setCoordinates([newCoordinates]);
				return geometry;
				};
		}
		
		draw = new ol.interaction.Draw({
				source: source, // 그리기 작업의 대상이 될 소스 설정
				type: value, // 그리기 유형 설정
				geometryFunction: geometryFunction // 사용자 정의 그리기 함수 설정
		});
		
		map.addInteraction(draw); // 그리기 상호작용 추가
}

squareButton.onclick = function () {
		map.removeInteraction(draw); // 이전 상호작용 제거
		addInteraction('Square'); // 정사각형 그리기 추가
};

boxButton.onclick = function () {
		map.removeInteraction(draw); // 이전 상호작용 제거
		addInteraction('Box'); // 사각형 그리기 추가
};

starButton.onclick = function () {
		map.removeInteraction(draw); // 이전 상호작용 제거
		addInteraction('Star'); // 별 모양 그리기 추가
};

noneButton.onclick = function () {
	  map.removeInteraction(draw); // 이전 상호작용 제거
};

</code>
				</pre>
			</figure>
		</div>
		<div id="htmlCode" class="tabbody">
			<figure class="highlight">
				<pre>
					<code class="language-html"
						style="margin-top: 0; margin-bottom: 30px;" data-lang="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;사각형, 박스, 별 그리기&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;button id="squareButton" class="zoomBtn"&gt;Square&lt;/button&gt;
&lt;button id="boxButton" class="zoomBtn"&gt;Box&lt;/button&gt;
&lt;button id="starButton" class="zoomBtn"&gt;Star&lt;/button&gt;
&lt;button id="noneButton" class="zoomBtn"&gt;None&lt;/button&gt;

&lt;script&gt;
		var raster = new ol.layer.Tile({
				source: new ol.source.OSM() // OSM 타일 레이어 생성
		});
		
		var source = new ol.source.Vector({ wrapX: false }); // 벡터 데이터 소스 생성
		
		var vector = new ol.layer.Vector({
		  		source: source // 벡터 레이어 생성
		});
		
		var map = new ol.Map({
				layers: [raster, vector], // 레이어 목록 설정
				target: 'map', // 지도를 렌더링할 HTML 요소 ID
				view: new ol.View({
						center: ol.proj.fromLonLat([126.9784, 37.5667]), // 중심점 좌표 설정
		    			zoom: 17 // 초기 줌 레벨 설정
		  		})
		});
		
		var squareButton = document.getElementById('squareButton');
		var boxButton = document.getElementById('boxButton');
		var starButton = document.getElementById('starButton');
		var noneButton = document.getElementById('noneButton');
		
		var draw; // 나중에 제거하기 위해 전역 변수로 선언
		
		function addInteraction(value) {
				var geometryFunction;
				
				if (value === 'Square') {
						value = 'Circle';
				  		geometryFunction = ol.interaction.Draw.createRegularPolygon(4); // 정사각형 그리기 함수
				} else if (value === 'Box') {
						value = 'Circle';
						geometryFunction = ol.interaction.Draw.createBox(); // 사각형 그리기 함수
				} else if (value === 'Star') {
						value = 'Circle';
				  		geometryFunction = function (coordinates, geometry) {
				    	// 별 모양 그리기 함수
				    	if (!geometry) {
				    			geometry = new ol.geom.Polygon(null);
				    	}
				
				    	var center = coordinates[0];
					    var last = coordinates[1];
					    var dx = center[0] - last[0];
					    var dy = center[1] - last[1];
					    var radius = Math.sqrt(dx * dx + dy * dy);
					    var rotation = Math.atan2(dy, dx);
					    var newCoordinates = [];
					    var numPoints = 12;
				
					    for (var i = 0; i < numPoints; ++i) {
								var angle = rotation + (i * 2 * Math.PI) / numPoints;
								var fraction = i % 2 === 0 ? 1 : 0.5;
								var offsetX = radius * fraction * Math.cos(angle);
								var offsetY = radius * fraction * Math.sin(angle);
								newCoordinates.push([center[0] + offsetX, center[1] + offsetY]);
					    }
				
						newCoordinates.push(newCoordinates[0].slice());
						geometry.setCoordinates([newCoordinates]);
						return geometry;
						};
				}
				
				draw = new ol.interaction.Draw({
						source: source, // 그리기 작업의 대상이 될 소스 설정
						type: value, // 그리기 유형 설정
						geometryFunction: geometryFunction // 사용자 정의 그리기 함수 설정
				});
				
				map.addInteraction(draw); // 그리기 상호작용 추가
		}
		
		squareButton.onclick = function () {
				map.removeInteraction(draw); // 이전 상호작용 제거
				addInteraction('Square'); // 정사각형 그리기 추가
		};
		
		boxButton.onclick = function () {
				map.removeInteraction(draw); // 이전 상호작용 제거
				addInteraction('Box'); // 사각형 그리기 추가
		};
		
		starButton.onclick = function () {
				map.removeInteraction(draw); // 이전 상호작용 제거
				addInteraction('Star'); // 별 모양 그리기 추가
		};
		
		noneButton.onclick = function () {
		 		map.removeInteraction(draw); // 이전 상호작용 제거
		};
		
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
