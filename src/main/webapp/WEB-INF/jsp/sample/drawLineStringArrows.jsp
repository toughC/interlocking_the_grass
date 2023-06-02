<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>화살표 그리기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>화살표 그리기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent" style="margin: 2px 0!important;">지도 상에서 원하는 방향으로 라인을 그리고, 그 라인들을 연결하여 화살표를 표현할 수 있습니다.</li>
		<li class="textContent" style="margin: 2px 0!important;font-weight: normal; color: #489ebf !important;">선 그리기는 마우스를 더블클릭하면 그리기가 종료됩니다.</li>
	</ul>
	<p style="text-align: right;margin-bottom: 3px;">[작성일: 2023-06-02]</p>
	<div id="map" style="width: 100%; height: 330px;"></div>
		
<script type="text/javascript">
	var raster = new ol.layer.Tile({
	  source: new ol.source.OSM()
	});
	
	var source = new ol.source.Vector();
	
	var styleFunction = function(feature) {
	  var geometry = feature.getGeometry();
	  var styles = [
	    // linestring
	    new ol.style.Style({
	      stroke: new ol.style.Stroke({
	        color: '#ffcc33',
	        width: 2
	      })
	    })
	  ];
	
	  geometry.forEachSegment(function(start, end) {
	    var dx = end[0] - start[0];
	    var dy = end[1] - start[1];
	    var rotation = Math.atan2(dy, dx);
	    // arrows
	    styles.push(new ol.style.Style({
	      geometry: new ol.geom.Point(end),
	      image: new ol.style.Icon({
	        src: 'https://openlayers.org/en/v4.6.5/examples/data/arrow.png',
	        anchor: [0.75, 0.5],
	        rotateWithView: true,
	        rotation: -rotation
	      })
	    }));
	  });
	
	  return styles;
	};
	
	var vector = new ol.layer.Vector({
	  source: source,
	  style: styleFunction
	});
	
	var map = new ol.Map({
	       layers: [raster, vector],
	       target: 'map',
	       view: new ol.View({
	           center: ol.proj.fromLonLat([126.9784, 37.5667]),
	           zoom: 17
	       })
	});
	
	map.addInteraction(new ol.interaction.Draw({
	  source: source,
	  type: 'LineString'
	}));
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
// OpenLayers 지도를 초기화합니다.
var raster = new ol.layer.Tile({
		source: new ol.source.OSM()
});
var source = new ol.source.Vector();

// 스타일 함수를 정의합니다.
var styleFunction = function(feature) {
		var geometry = feature.getGeometry();
		var styles = [
				// 선 스타일
				new ol.style.Style({
						stroke: new ol.style.Stroke({
								color: '#ffcc33',
								width: 2
						})
				})
		];
		
		// 라인의 각 세그먼트마다 화살표 스타일을 생성합니다.
		geometry.forEachSegment(function(start, end) {
				var dx = end[0] - start[0];
				var dy = end[1] - start[1];
				var rotation = Math.atan2(dy, dx);
				
				// 화살표 스타일
				styles.push(new ol.style.Style({
						geometry: new ol.geom.Point(end),
						image: new ol.style.Icon({
								src: 'https://openlayers.org/en/v4.6.5/examples/data/arrow.png',
								anchor: [0.75, 0.5],
								rotateWithView: true,
								rotation: -rotation
						})
				}));
		});
		
		return styles;
};

// Vector 레이어를 생성하고 스타일 함수를 적용합니다.
var vector = new ol.layer.Vector({
		source: source,
		style: styleFunction
});

// 지도를 초기화하고 레이어를 추가합니다.
var map = new ol.Map({
		layers: [raster, vector],
		target: 'map',
		view: new ol.View({
				center: ol.proj.fromLonLat([126.9784, 37.5667]),
				zoom: 17
		})
});

// 상호작용(Interaction)으로 라인 그리기 기능을 추가합니다.
map.addInteraction(new ol.interaction.Draw({
		source: source,
		type: 'LineString'
}));

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
		&lt;title&gt;화살표 그리기&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;script&gt;
		// OpenLayers 지도를 초기화합니다.
		var raster = new ol.layer.Tile({
				source: new ol.source.OSM()
		});
		var source = new ol.source.Vector();
		
		// 스타일 함수를 정의합니다.
		var styleFunction = function(feature) {
				var geometry = feature.getGeometry();
				var styles = [
						// 선 스타일
						new ol.style.Style({
								stroke: new ol.style.Stroke({
										color: '#ffcc33',
										width: 2
								})
						})
				];
				
				// 라인의 각 세그먼트마다 화살표 스타일을 생성합니다.
				geometry.forEachSegment(function(start, end) {
						var dx = end[0] - start[0];
						var dy = end[1] - start[1];
						var rotation = Math.atan2(dy, dx);
						
						// 화살표 스타일
						styles.push(new ol.style.Style({
								geometry: new ol.geom.Point(end),
								image: new ol.style.Icon({
										src: 'https://openlayers.org/en/v4.6.5/examples/data/arrow.png',
										anchor: [0.75, 0.5],
										rotateWithView: true,
										rotation: -rotation
								})
						}));
				});
				
				return styles;
		};
		
		// Vector 레이어를 생성하고 스타일 함수를 적용합니다.
		var vector = new ol.layer.Vector({
				source: source,
				style: styleFunction
		});
		
		// 지도를 초기화하고 레이어를 추가합니다.
		var map = new ol.Map({
				layers: [raster, vector],
				target: 'map',
				view: new ol.View({
						center: ol.proj.fromLonLat([126.9784, 37.5667]),
						zoom: 17
				})
		});
		
		// 상호작용(Interaction)으로 라인 그리기 기능을 추가합니다.
		map.addInteraction(new ol.interaction.Draw({
				source: source,
				type: 'LineString'
		}));
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
