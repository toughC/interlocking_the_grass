<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>원, 선, 점, 다각형 그리기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>원, 선, 점, 다각형 그리기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도 위에 원, 선, 점, 다각형을 그릴 수 있습니다.</li>
	</ul>
	<p style="text-align: right;">[작성일: 2023-06-01]</p>
	<div id="map" style="width: 100%; height: 330px;"></div>
	
	<button id="circleButton" class="zoomBtn">Circle</button>
	<button id="lineStringButton" class="zoomBtn">LineString</button>
	<button id="pointButton" class="zoomBtn">Point</button>
	<button id="polygonButton" class="zoomBtn">Polygon</button>

<script type="text/javascript">
    var raster = new ol.layer.Tile({
        source: new ol.source.OSM()
    });

    var source = new ol.source.Vector();
    var vector = new ol.layer.Vector({
        source: source,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 255, 0.2)'
            }),
            stroke: new ol.style.Stroke({
                color: '#ffcc33',
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 7,
                fill: new ol.style.Fill({
                    color: '#ffcc33'
                })
            })
        })
    });

    var map = new ol.Map({
        layers: [raster, vector],
        target: 'map',
        view: new ol.View({
            center: ol.proj.fromLonLat([126.9784, 37.5667]),
            zoom: 17
        })
    });

    var interactions = {};
    var buttons = document.querySelectorAll('.zoomBtn');

    function addInteractions(type) {
        map.removeInteraction(interactions.draw);
        map.removeInteraction(interactions.snap);

        interactions.draw = new ol.interaction.Draw({
            source: source,
            type: type
        });
        map.addInteraction(interactions.draw);

        interactions.snap = new ol.interaction.Snap({
            source: source
        });
        map.addInteraction(interactions.snap);
    }

    buttons.forEach(function (button) {
        button.addEventListener('click', function () {
            var type = button.textContent;
            addInteractions(type);
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
// OSM (OpenStreetMap) 타일 레이어 생성
var raster = new ol.layer.Tile({
    	source: new ol.source.OSM()
});

// 벡터 소스 생성
var source = new ol.source.Vector();

// 벡터 레이어 생성 및 스타일 설정
var vector = new ol.layer.Vector({
	    source: source,
	    style: new ol.style.Style({
		        fill: new ol.style.Fill({ color: 'rgba(255, 255, 255, 0.2)' }), // 내부를 채우는 스타일
		        stroke: new ol.style.Stroke({ color: '#ffcc33', width: 2 }), // 외곽선 스타일
		        image: new ol.style.Circle({ radius: 7, fill: new ol.style.Fill({ color: '#ffcc33' }) }) // 지점 표시를 위한 원 스타일
	    })
});

// 지도 생성
var map = new ol.Map({
	    layers: [raster, vector], // 타일 레이어와 벡터 레이어 추가
	    target: 'map', // 맵을 표시할 DOM 요소의 ID
	    view: new ol.View({
		        center: ol.proj.fromLonLat([126.9784, 37.5667]), // 지도 초기 위치 설정
		        zoom: 17 // 지도 초기 줌 레벨 설정
	    })
});

// 상호작용 객체 초기화
var interactions = {};

// 도형 버튼들을 선택하여 이벤트 리스너 추가
var buttons = document.querySelectorAll('.zoomBtn');
buttons.forEach(function (button) {
	    button.addEventListener('click', function () {
		        var type = button.textContent; // 버튼 텍스트를 도형 타입으로 사용
		        addInteractions(type);
	    });
});

// 도형 그리기를 위한 상호작용 추가
function addInteractions(type) {
	    map.removeInteraction(interactions.draw);
	    map.removeInteraction(interactions.snap);
	
	    interactions.draw = new ol.interaction.Draw({
		        source: source,
		        type: type
	    });
	    map.addInteraction(interactions.draw);
	
	    interactions.snap = new ol.interaction.Snap({
	        	source: source
	    });
	    map.addInteraction(interactions.snap);
}

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
		&lt;title&gt;원, 선, 점, 다각형 그리기&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;script&gt;
		// OSM (OpenStreetMap) 타일 레이어 생성
		var raster = new ol.layer.Tile({
		    	source: new ol.source.OSM()
		});
		
		// 벡터 소스 생성
		var source = new ol.source.Vector();
		
		// 벡터 레이어 생성 및 스타일 설정
		var vector = new ol.layer.Vector({
			    source: source,
			    style: new ol.style.Style({
				        fill: new ol.style.Fill({ color: 'rgba(255, 255, 255, 0.2)' }), // 내부를 채우는 스타일
				        stroke: new ol.style.Stroke({ color: '#ffcc33', width: 2 }), // 외곽선 스타일
				        image: new ol.style.Circle({ radius: 7, fill: new ol.style.Fill({ color: '#ffcc33' }) }) // 지점 표시를 위한 원 스타일
			    })
		});
		
		// 지도 생성
		var map = new ol.Map({
			    layers: [raster, vector], // 타일 레이어와 벡터 레이어 추가
			    target: 'map', // 맵을 표시할 DOM 요소의 ID
			    view: new ol.View({
				        center: ol.proj.fromLonLat([126.9784, 37.5667]), // 지도 초기 위치 설정
				        zoom: 17 // 지도 초기 줌 레벨 설정
			    })
		});
		
		// 상호작용 객체 초기화
		var interactions = {};
		
		// 도형 버튼들을 선택하여 이벤트 리스너 추가
		var buttons = document.querySelectorAll('.zoomBtn');
		buttons.forEach(function (button) {
			    button.addEventListener('click', function () {
				        var type = button.textContent; // 버튼 텍스트를 도형 타입으로 사용
				        addInteractions(type);
			    });
		});
		
		// 도형 그리기를 위한 상호작용 추가
		function addInteractions(type) {
			    map.removeInteraction(interactions.draw);
			    map.removeInteraction(interactions.snap);
			
			    interactions.draw = new ol.interaction.Draw({
				        source: source,
				        type: type
			    });
			    map.addInteraction(interactions.draw);
			
			    interactions.snap = new ol.interaction.Snap({
			        	source: source
			    });
			    map.addInteraction(interactions.snap);
		}
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
