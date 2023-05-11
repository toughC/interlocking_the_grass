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
					    <!-- code 태그에 class에 표시할 언어를 설정한다. -->
					    <!-- code 태그 안에 소스 코드를 입력합니다만, 스페이스와 탭 영역을 주의해서 입력한다. -->
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
	<!-- 			<div class="codeBox"> -->
	<!-- 				<p class="textArea"> -->
	<!-- 					CODE BOX<br>CODE BOX<br>CODE BOX<br>CODE BOX<br>CODE -->
	<!-- 					BOX<br>CODE BOX<br>CODE BOX<br>CODE BOX<br>CODE -->
	<!-- 					BOX<br>CODE BOX -->
	<!-- 				</p> -->
	<!-- 			</div> -->
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



<!-- function home() {
		$.ajax({
			url : "home.do",
			type : "post",
			data : {
				lv1 :encodeURIComponent('DE_003'),
				keyword : $('#search-input').val()
			},
			dataType : "json",
			async : true,
			success : function(data)
			{	
				var html = ""; // 출력할 내용을 저장할 문자열 변수
				var compare = ""; // 이전에 출력한 부서 이름을 저장할 변수
				var compare2 = "";
				var count = 0;

				for (var i = 0; i < data.length; i++) {	

				  if (data[i].depth == 3 || data[i].depth == 4) {
				    var parentName = data[i].parent_name;
				    var grandparentName = data[i].grandparent_name;
				    var deptName = data[i].dept_name;
				    var childName = data[i].child_name;

				    // 부서 이름이 이전에 출력한 이름과 같지 않으면
				    if (parentName != compare || grandparentName != compare2) {
				      // 부서 이름과 하위 부서 목록을 문자열로 만들어서 html 변수에 추가
				      if (data[i].depth == 3) {
				        html += "<a class='title' href='#'>" + parentName + " 1 </a><ul>";
				        html += "<a class='subTitle line'>" + deptName + " 1 </a><ul>";
				      } else {
				        html += "<a class='title' href='#'>" + grandparentName + " 2 </a><ul>";
				        html += "<a class='subTitle line'>" + parentName + " 2 </a><ul>";
				      }

				      compare = parentName; // 출력한 부서 이름을 저장
				      compare2 = grandparentName;
				    }

				    // 부서 정보를 문자열로 만들어서 html 변수에 추가
				    if (data[i].depth == 3) {
				      html += "<li><a href='#'><p>" + childName + " 3 </p></a></li>";
				    } else {
				      html += "<li><a href='#'><p>" + deptName + " 3 </p></a></li>";
				    }
				  }
				}

				// html 변수에 저장된 문자열을 HTML 코드로 변환해서 출력
				$('#menuLv2Lv3').html(html);
				
				
	/* 			var context = "", compare = "";
				//console.log(data);
			
				for (var i = 0; i < data.length; i++) {
					  if (data[i].depth == 3) {
						  if (compare != data[i].parent_name) 
						  {
						        context += "<a class=title href=> " + data[i].parent_name + "</a><ul>";
						        compare = data[i].parent_name;
						  }
						  context += "<li><a href=><p>" + data[i].dept_name + "</p></a></li>";			    
					  }
				}
					
				context += "</ul>";
				
				$('#menuLv2Lv3').html(context);		 */
			},
	
			error : (e) => console.log(e)
		}); 		
	} -->

</html>