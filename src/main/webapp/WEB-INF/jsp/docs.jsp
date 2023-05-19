<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>var pageId = 'DE_003'; pageName = 'docs';</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1 id="Map" style='margin-bottom:7px;'>ol.CanvasMap</h1>
<li class="textContent2">• OpenLayers 라이브러리 버전 5.3.0의 PluggableMap 클래스는 OpenLayers 맵의 핵심 클래스이며, 맵의 생성, 조작, 레이어 관리 등 다양한 기능을 제공합니다.</li>
<div class="section">
	<h3 style='color: #078FDC;font-size: 15px;padding-top:23px;'>Methods</h3>
	
	<h2 id="Map_addControl">addControl<span style="font-size: 14px; display: inline; font-weight: lighter;">(control)</span></h2>
		<ul class="listStyle-01 row">
		<li>OpenLayers에서 Control은 지도 영역 내의 지도를 확대, 축소, 이동과 같은 조작 행위를 하기 위해 사용되는 객체입니다.</li></br>
			<ul style="padding-left:10px;">
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Parameters</strong>:</br>• control (Type: module:ol/control/Control~Control): 추가할 컨트롤(Control)입니다. 이 매개변수는 Control 클래스의 인스턴스여야 합니다. OpenLayers에서 제공하는 기본 컨트롤 또는 사용자가 직접 작성한 컨트롤을 인스턴스화하여 전달할 수 있습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Returns</strong>:</br> • void: 컨트롤을 맵에 추가한 후 아무런 값을 반환하지 않습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Usage Example</strong>:</br>
			<pre><code class="javascript">
import { ScaleLine } from 'ol/control';

// ScaleLine 컨트롤 생성
const scaleLineControl = new ScaleLine();

// 맵에 컨트롤 추가
map.addControl(scaleLineControl);
</code></pre></li>
			</ul>
			</ul>
			
	<h2 id="Map_addInteraction">addInteraction<span style="font-size: 14px; display: inline; font-weight: lighter;">(interaction)</span></h2>
		<ul class="listStyle-01 row">
		<li>OpenLayers에서 사용되는 메서드로, 지도에 상호작용을 추가합니다. 이를 통해 사용자는 지도 영역 내에서 확대, 축소, 이동 등의 조작을 수행할 수 있습니다.</li></br>
		<ul style="padding-left:10px;">
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Parameters</strong>:</br>• interaction (ol.interaction.Interaction): 추가할 상호작용 객체입니다. 이 매개변수는 "ol.interaction.Interaction" 클래스의 인스턴스여야 합니다. OpenLayers에서 제공하는 기본 상호작용 또는 사용자가 직접 작성한 상호작용을 인스턴스화하여 전달할 수 있습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Returns</strong>:</br> • void: 상호작용을 지도에 추가한 후, 반환 값이 없습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Usage Example</strong>:</br>
			<pre><code class="javascript">
var interaction = new ol.interaction.Select({
  condition: ol.events.condition.click // 클릭 이벤트로 선택
});

map.addInteraction(interaction);
</code></pre></li>
			</ul>
			</ul>
			
			<h2 id="Map_addLayer">addLayer<span style="font-size: 14px; display: inline; font-weight: lighter;">(layer)</span></h2>
		<ul class="listStyle-01 row">
		<li>OpenLayers에서 사용되는 메서드로, 지도에 레이어를 추가하는 역할을 합니다. 해당 메서드는 ol.PluggableMap 클래스에 속해 있습니다.</li></br>
		<ul style="padding-left:10px;">
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Parameters</strong>:</br>• layer (ol.layer.Layer): 추가할 레이어 객체입니다. 이 매개변수는 ol.layer.Layer 클래스의 인스턴스여야 합니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Returns</strong>:</br> • void: 레이어를 지도에 추가한 후, 반환 값이 없습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Usage Example</strong>:</br>
			<pre><code class="javascript">
// 1. 레이어 객체 생성
var layer = new ol.layer.Tile({
  source: new ol.source.OSM()
});

// 2. 레이어를 지도에 추가
map.addLayer(layer);
</code></pre></li>
			</ul>
			</ul>
			
			<h2 id="Map_addOverlay">addOverlay<span style="font-size: 14px; display: inline; font-weight: lighter;">(overlay)</span></h2>
		<ul class="listStyle-01 row">
		<li>OpenLayers에서 사용되는 메서드로, 지도에 오버레이(overlay)를 추가합니다. 오버레이는 지도 위에 다양한 그래픽 요소를 표시하는 역할을 합니다.</li></br>
		<ul style="padding-left:10px;">
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Parameters</strong>:</br>• overlay (ol.Overlay): 추가할 오버레이 객체입니다. 이 매개변수는 "ol.Overlay" 클래스의 인스턴스여야 합니다. OpenLayers에서 제공하는 기본 오버레이 또는 사용자가 직접 작성한 오버레이를 인스턴스화하여 전달할 수 있습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Returns</strong>:</br> • void: 오버레이를 지도에 추가한 후, 반환 값이 없습니다.</li>
				<li><strong style="font-size: 13px; opacity: 0.6; display: inline;">Usage Example</strong>:</br>
			<pre><code class="javascript">
var overlay = new ol.Overlay({
  element: document.getElementById('overlay'), // 오버레이로 사용할 HTML 요소
  position: ol.proj.fromLonLat([127.0, 37.0]), // 오버레이의 위치 설정
  positioning: 'center-center' // 오버레이의 위치 기준 설정
});

map.addOverlay(overlay);

</code></pre></li>
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