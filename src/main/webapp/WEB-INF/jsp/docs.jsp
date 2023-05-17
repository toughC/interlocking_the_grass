<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>var pageId = 'DE_003'; pageName = 'docs';</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1>ol.CanvasMap</h1>
<div class="section">
	<!-- 			<div class="codeBox"> -->
	<!-- 				<p class="textArea"> -->
	<pre>

					    <code class="javascript">function test() {
    let map = new ol.Map();

    let option = new Option();

    alert("점심 뭐먹지 ?");
}
					</code>
					  </pre>
	<!-- 				</p> -->
	<!-- 			</div> -->

	<p class="codeBox-top">The map is the core component of OpenLayers.
		For a map to render, a view, one or more layers, and a target
		container are needed:</p>

	<p class="codeBox-bottom">
		The above snippet creates a map using a <a href="" class="hyperlink">ol.layer.Tile</a>
		to display <a href="" class="hyperlink">ol.source.OSM</a> OSM data and
		render it to a DOM element with the id map.
	</p>

	<pre>
					<code class="javascript">const map = new ol.Map({
    layers: [
        new ol.layer.Tile.TileLayer({
            source: new ol.source.OSM(),
        }),
    ],
    target: 'map',
    view: new ol.View({
        center: [0, 0],
        zoom: 2,
    }),
});
					</code>
				</pre>
</div>




</html>