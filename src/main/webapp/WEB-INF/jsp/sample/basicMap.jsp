<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>지도 생성하기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>
<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>

<body>
	<h1>지도 생성하기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도를 생성하는 가장 기본적인 예제입니다.</li>
	</ul>
	<p style="text-align: right;margin-bottom: 3px;">마지막 수정 2023.05.18</p>
	<div id="map" style="width: 100%; height: 330px;"></div>

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
		&lt;title&gt;지도 생성하기&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

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
