<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>
	var pageId = 'DE_003';
	pageName = 'docs';
</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1 id="Map" style='margin-bottom: 7px;'>ol.CanvasMap</h1>
<li class="textContent2">• OpenLayers 3 라이브러리의 PluggableMap 클래스는
	OpenLayers 맵의 핵심 클래스로, 맵의 생성, 조작, 레이어 관리 등 다양한 기능을 제공합니다.</li>
<div class="section">
	<h3 style='color: #078FDC; font-size: 15px; padding-top: 23px;'>Methods</h3>

	<h2 id="Map_addControl">
		addControl<span
			style="font-size: 14px; display: inline; font-weight: lighter;">(control)</span>
	</h2>
	<ul class="listStyle-01 row">
		<li>지도에 컨트롤을 추가한다.</li>
		</br>
		<ul style="padding-left: 10px;">
			<li><strong
				style="font-size: 13px; opacity: 0.6; display: inline;">Explanation</strong>:</br>map.addControl(zoomslider);는
				생성한 ZoomSlider 컨트롤을 맵에 추가하는 코드이다. </br>이렇게 추가된 컨트롤은 지도 위에 나타나고 사용자에게 확대 및
				축소 기능을 제공한다.</li>
			<p style="text-align: right;">마지막 수정 2023.05.23</p>
			<pre>
				<code class="javascript">zoomslider = new ol.control.ZoomSlider();
map.addControl(zoomslider);
</code>
			</pre>
			</li>

		</ul>
	</ul>

	<h2 id="Map_addInteraction">
		addInteraction<span
			style="font-size: 14px; display: inline; font-weight: lighter;">(interaction)</span>
	</h2>
	<ul class="listStyle-01 row">
		<li>지도에 상호작용을 추가한다. 상호작용은 사용자와의 상호작용을 통해 지도 위에서 발생하는 이벤트를 처리하고,
			지도의 동작을 제어하는 기능을 제공한다. 예를 들어 클릭, 드래그, 확대/축소 등의 동작에 대한 이벤트 처리를 추가할 수
			있다.</li>
		</br>
		<ul style="padding-left: 10px;">
			<li><strong
				style="font-size: 13px; opacity: 0.6; display: inline;">Explanation</strong>:</br>map.addInteraction(zoomSliderInteraction);는
				생성한 ZoomSlider 상호작용을 맵에 추가한다. 이를 통해 지도에 확대/축소 슬라이더 기능이 제공된다.</li>
			<p style="text-align: right;">마지막 수정 2023.05.23</p>
			<pre>
				<code class="javascript">var zoomSliderInteraction = new ol.interaction.ZoomSlider();
map.addInteraction(zoomSliderInteraction);
</code>
			</pre>
			</li>
		</ul>
	</ul>

	<h2 id="Map_addLayer">
		addLayer<span
			style="font-size: 14px; display: inline; font-weight: lighter;">(layer)</span>
	</h2>
	<ul class="listStyle-01 row">
		<li>OpenStreetMap 데이터를 사용하여 레이어를 생성하고, 해당 레이어를 지도에 추가한다.</li>
		</br>
		<ul style="padding-left: 10px;">
			<li><strong
				style="font-size: 13px; opacity: 0.6; display: inline;">Explanation</strong>:</br>map.addLayer(layer)를
				호출하여 생성한 레이어를 지도에 추가한다. </br>이를 통해 생성한 레이어가 지도 위에 표시되며, OpenStreetMap
				데이터가 해당 레이어를 통해 지도에 나타난다.</li>
			<p style="text-align: right;">마지막 수정 2023.05.23</p>
			<pre>
				<code class="javascript">// 레이어 생성
var layer = new ol.layer.Tile({
  source: new ol.source.OSM()
});

// 지도에 레이어 추가
map.addLayer(layer);
</code>
			</pre>
			</li>
		</ul>
	</ul>

	<h2 id="Map_addOverlay">
		addOverlay<span
			style="font-size: 14px; display: inline; font-weight: lighter;">(overlay)</span>
	</h2>
	<ul class="listStyle-01 row">
		<li>오버레이를 생성하고, 오버레이로 사용할 HTML 요소와 위치를 설정한 후, 해당 오버레이를 지도에 추가한다.</li>
		</br>
		<ul style="padding-left: 10px;">
			<li><strong
				style="font-size: 13px; opacity: 0.6; display: inline;">Explanation</strong>:</br>map.addOverlay(overlay)를
				호출하여 생성한 오버레이를 지도에 추가한다. 이를 통해 생성한 오버레이가 지도 위에 나타나게 된다.</li>
			<p style="text-align: right;">마지막 수정 2023.05.23</p>
			<pre>
				<code class="javascript">var overlay = new ol.Overlay({
  element: document.getElementById('overlay'), // 오버레이로 사용할 HTML 요소
  position: [127.0, 37.0], // 오버레이의 위치 설정 (경도, 위도)
});

map.addOverlay(overlay);
</code>
			</pre>
			</li>
		</ul>
	</ul>

</div>
</div>
</div>

</div>
</div>
</div>

</body>
</html>