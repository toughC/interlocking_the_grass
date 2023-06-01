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
<link rel="stylesheet"
	href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script
	src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>

<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>원, 선, 점, 다각형 그리기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도 위에 원, 선, 점, 다각형을 그릴 수 있습니다.</li>
	</ul>
	<p style="text-align: right;">[작성일: 2023-06-01]</p>
	<div id="map"
		style="width: 100%; height: 330px; position: relative; overflow: hidden; background: url('https://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png');"></div>
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