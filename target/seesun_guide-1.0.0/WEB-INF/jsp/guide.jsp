<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>var pageId = 'DE_001', pageName = 'guide'</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1 id="ready">준비하기</h1>
<div class="section">
	<h2 id="setjdk">Open JDK</h2>
	<ul class="listStyle-01 row">
		<li>• eGovFramework는 <strong>Java Open JDK</strong>를 설치해야 사용할 수
			있습니다.
		</li>
		<li>• <ins>OpenJDK 1.8</ins> 윈도우 버전 설치방법에 대해 소개하겠습니다.
		</li>
	</ul>
	<div class="info">
		<p>설치하려면 아래 과정이 필요합니다.</p>
		<div class="textBox">
			<ul>
				<li>1. <a class="underover"
					href="https://github.com/ojdkbuild/ojdkbuild" target="_blank"
					rel="noopener noreferrer"> Java OpenJDK v1.8 설치 사이트</a>
					(https://github.com/ojdkbuild/ojdkbuild) 접속
				</li>
				<li>2. 자신의 운영체제에 맞게, 취향에 따라 zip파일을 다운받거나 msi파일을 다운받으면 됩니다.</li>
				<li>3. 다운받은 파일을 C드라이브로 옮겨서 압축해제를 해줍니다.</li>
				<li>4. 압축해제 한 폴더를 디렉토리 <code>C:\Program Files\Java</code> 밑에
					옮겨줍니다. (Java 폴더가 없으면 새로 만들기)
				</li>
				<li>5. 폴더명이 너무 길면 <code>openjdk-1.8</code>로 변경해줍니다.
				</li>
				<li>6. 이제 JDK 환경변수 등록을 해주어야 합니다. 아래를 참고해서 환경변수를 등록합니다.</li>
				<ul class="listStyle-02">
					<li>a. 윈도우키 + R키로 윈도우 실행창을 연 후에 sysdm.cpl 입력</li>
					<li>b. 고급 > 환경 변수 > 시스템 변수 새로 만들기로 이동</li>
					<li>c. 변수 이름 : <code>JAVA_HOME</code>, 변수 값 : <code
							class="code">다운로드받은 Open-JDK 디렉토리</code> 입력 후 확인버튼 클릭 ( ex : <code
							class="code">C:\Program Files\Java\openjdk-1.8</code> )
					</li>
					<li>d. 시스템 변수 > Path > 편집 > 새로 만들기 > <code>%JAVA_HOME%\bin</code>
						입력 > 확인 버튼 클릭
					</li>
					<li>e. 환경 변수창의 확인 버튼을 누룬 후 시스템 창을 닫는다.</li>
				</ul>
				<li>7. 마지막으로 cmd창(윈도우키 + R)을 열고 콘솔창에 <code>java -version</code>을
					입력하고, 버전을 확인하면 됩니다.
				</li>
				<!-- <li class="listStyle-03">• 등록한 도메인(ex :
					http://localhost:8080)에서 서버를 실행시켜 위 파일을 엽니다.
					<ul class="tip">
						<li># Python이 설치된 컴퓨터에는 해당 폴더로 이동 후</li>
						<li>$ cd/path/to/your/folder/</li>
						<li># 다음과 같이 테스트용 웹 서버를 실행할 수 있습니다.</li>
					</ul>
				</li> -->
			</ul>
		</div>
	</div>

</div>
<div class="section">
	<h2 id="settomact">Tomcat</h2>
	<ul class="listStyle-01 row">
		<li>• <strong>Apache Tomcat</strong>은 JSP페이지의 실행환경을 제공하는 웹 어플리케이션
			서버(WAS) 입니다.
		</li>
		<li>• <ins>Tomcat v9.0</ins> 윈도우 버전과 eGovFramework를 연결하기 위해
			Tomcat 설치방법에 대해 소개하겠습니다.
		</li>
		</li>
	</ul>
	<div class="info">
		<p>설치하려면 아래 과정이 필요합니다.</p>
		<div class="textBox">
			<ul>
				<li>1. <a class="underover"
					href="https://tomcat.apache.org/download-90.cgi" target="_blank"
					rel="noopener noreferrer"> Apache Tomcat v9 설치 사이트</a>
					(https://tomcat.apache.org/download-90.cgi) 접속
				</li>
				<li>2. 운영체제에 맞는 압축파일을 다운로드하고, 압축해제 합니다.</li>
				<li>3. 압축해제한 파일을 디렉토리 <code>C:\Program Files\Dev</code> 밑에
					옮겨줍니다. (Dev 폴더가 없으면 새로 만들기)
				</li>
				<li>4. 폴더명이 너무 길면 <code>apache-tomcat-9.0.74</code>로 변경해줍니다.
				</li>
				<li>5. 아파치 톰캣이 제대로 설치되었는지 접속 테스트를 해야한다. 디렉토리 <code>C:\Program
						Files\Dev\apache-tomcat-9.0\bin</code> 파일에 가서 <code> startup.bat</code>
					파일을 실행해줍니다.
				</li>
				<li>6. JDK에서 방화벽 액세스 허용을 요청하는 창이 뜨면, <code>홈 네트워크, 회사
						네트워크 등의 개인 네트워크</code> 체크하고 엑세스 허용을 클릭합니다.
				</li>
				<li>7. 주소창에 <code>localhost:8080</code>으로 접속하여 톰캣고양이 나오면 접속이
					성공적으로 완료됐다는 뜻입니다.
				</li>
			</ul>
		</div>
	</div>

</div>
<div class="section">
	<h2 id="setegov">eGovFrame</h2>
	<ul class="listStyle-01 row">
		<li>• <strong>eGovFramework</strong>는 정부 및 공공기관, 공기업 등의 웹사이트에서 자주
			쓰이는 공통 기능들을 Java의 Spring 프레임워크와 유명 Java 라이브러리를 가지고 미리 만들어 놓은 컴포넌트와 이를
			개발하는 개발환경, 실행환경, 운영환경, 관리환경 등으로 구성되어 있습니다.
		</li>
		<li>• <ins>eGovFramework 3.9 </ins>윈도우 버전 <strong>개발 환경과
				실행 환경</strong>에 대해 소개하겠습니다.
		</li>
	</ul>
	<div class="info">
		<p>설치하고 Tomcat과 연동하려면 아래 과정이 필요합니다.</p>
		<div class="textBox">
			<ul>
				<li>1. <a class="underover"
					href="https://www.egovframe.go.kr/home/main.do" target="_blank"
					rel="noopener noreferrer"> 전자정부표준프레임워크 개발환경 3.9 설치 사이트</a>
					(https://www.egovframe.go.kr/home/main.do) 접속
				</li>
				<li>2. 다운로드 > 개발환경 > 3.x 다운로드 > 개발자용 개발환경
					32&64bit(Implementation Tool) Version 3.9.0 >
					eGovFrameDev-3.9.0-64bit.exe 클릭</li>
				<li>3. 다운로드한 파일을 압축해제 하고 디렉토리 <code>C:\Program Files\Dev</code>
					밑에 옮겨줍니다.
				</li>
				<li>4. 디렉토리 <code>C:\Program
						Files\Dev\eGovFrameDev-3.9.0-64bit\eclipse</code> 파일에 가서 <code>eclipse.exe</code>
					실행합니다.
				</li>
				<li>5. workspace 설정 후 Launch 클릭합니다.</li>
				<li>6. <code>Package Explorer</code> 메뉴를 찾아서 빈 공간에서 우클릭 > New >
					Other... > eGovFrame Web Project > Next > Project name, Group Id,
					Artifact Id를 똑같은 이름으로 작성 > Finish 클릭
				</li>
				<li>7. 생성된 프로젝트 클릭하고 상단 메뉴에 eGovFrame > Implementation > Add
					eGovFrame Common Component > 공통 체크 > Finish > 팝업창 확인</li>
				<li>8. 프로젝트 우클릭하고 Maven > Update Project > OK 클릭하면 프로젝트 빨간색
					X표시가 사라집니다.</li>
				<li>9. 상단 메뉴창에서 Window > Show View > Servers > No servers are
					available. Click this link to create a new server... 클릭 >
					ServerTomcat v9.0 Server 선택 > Next > JRE는 맨 위에서 설치한 OpenJDK 추가 >
					Next > 원하는 프로젝트를 Configured로 이동 > Finish</li>
				<li>10. Servers 탭에서 Tomcat v9.0 Server at localhost 더블클릭 > Port
					확인 > Modules 탭에서 해당되는 프로젝트 클릭하고 Edit... > Path를 /로 변경 > OK</li>
				<li>11. 디렉토리 <code>src/main/resources/egovframework/spring/com/context-security.xml</code>
					파일 삭제 > Server Start</code> 주소창에 <code>localhost:8080</code>으로 접속하여 전자정부
					표준프레임워크 공통컴포넌트 VERSION 3.9 페이지가 나오면 성공적으로 완료됐다는 뜻입니다.
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="section">
	<h2 id="setqgis">QGIS</h2>
	<ul class="listStyle-01 row">
		<li>• <strong>QGIS</strong>는 공간데이터 조회, 편집, 분석 기능을 제공하는 대표적인 오픈소스
			데스크탑 지리정보시스템(GIS) 소프트웨어입니다.
		</li>
		<li>• <ins>QGIS 3.28</ins> 윈도우 버전 설치방법에 대해 소개하겠습니다.
		</li>
	</ul>
	<div class="info">
		<p>설치하려면 아래 과정이 필요합니다.</p>
		<div class="textBox">
			<ul>
				<li>1. <a class="underover"
					href="https://qgis.org/ko/site/forusers/download.html"
					target="_blank" rel="noopener noreferrer"> QGIS 3.28 설치 사이트</a>
					(https://qgis.org/ko/site/forusers/download.html) 접속
				</li>
				<li>2. 2023년 4월 버전 3.28가 장기 릴리스(가장 안정적)를 다운로드 받습니다.</li>
				<li>3. QGIS 다운로드 파일 실행해서 라이센스 동의와 설치 경로 선택, 3가지 옵션은 선택사항으로 하여
					Install을 누르면 1~5분 정도 시간이 소요되며 QGIS 설치가 완료됩니다.</li>
			</ul>
		</div>
	</div>
</div>

<div class="section">
	<h1 id="start">시작하기</h1>
	<ul class="listStyle-01 row">
		<li>여러분은 간단한 코드를 통해 웹브라우저에 지도를 띄울 수 있습니다.</li>
		<li>차근차근 한 단계씩 진행해 보도록 하겠습니다.</li>
	</ul>

	<div class="section">
		<h2 id="step1">지도를 그리는 Javascript API 추가</h2>
		
		<div class="textBox">
		<ul class="listStyle-01 row">
			<pre>
		<code class="language-html">&lt;script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v5.3.0/build/ol.js"&gt;&lt;/script&gt;</code>
		</pre>
			<li><code>//</code>이라는 상대 프로토콜을 사용하면, 사용자의 <code>http</code>,<code>https</code>환경에
				따라 자동으로 해당 프로토콜을 따라가게 됩니다.</li>
			</br>
			<li>API를 로딩하는 스크립트 태그는 HTML파일안의<code>head</code>,<code>body</code>등
				어떠한 위치에 넣어도 상관없습니다.
			</li>
			<li>하지만, <strong>반드시 실행 코드보다 먼저 선언되어야 합니다.</strong></li>
		</ul>
	</div>
	</div>

	<div class="section">
		<h2 id="step2">지도를 띄우는 코드 작성</h2>
		<div class="textBox">
		<ul class="listStyle-01 row">
			<pre>
		<code class="language-js ">
var mapTarget = document.getElementById('map');
var map = new ol.Map({
		target : mapTarget,
		layers : [ new ol.layer.Tile({
				source : new ol.source.OSM({
						attributions : false
				})
		}) ],

		view : new ol.View({
				center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]),
				zoom : 12
		})
});</code>
		</pre>
			<li>OpenLayers를 사용하여 지도 객체를 생성할 때는 <code>Map()</code> 함수를 사용하고,
				이 함수의 두 번째 파라미터로 <code>options</code> 객체를 전달합니다.
			</li>
			<li>이 <code>options</code> 객체에서 <code>center</code> 속성은 <strong>지도를
					생성할 때 반드시 필요한 속성</strong>으로, <code>LatLng</code> 클래스를 사용하여 <code>위도(latitude)와
					경도(longitude)</code> 값을 순서대로 전달하여 생성합니다.
			</li>
			<li>이렇게 생성된 <code>LatLng</code> 객체는 지도의 초기 중심 좌표로 설정됩니다.
			</li>
			<li>예를 들어, 서울의 경우 <code>LatLng(37.5667, 126.9784)</code> 와 같이
				생성할 수 있습니다.
			</li>
			</br>
			<li>전체 코드는 아래와 같습니다.</li>
			<pre>
			<code class="language-html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;OpenLayers JSP Example&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
		&lt;div id="map" style="width: 500px; height: 400px;"&gt;&lt;/div&gt;
		&lt;script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v5.3.0/build/ol.js"&gt;&lt;/script&gt;
		&lt;script&gt;
				var mapTarget = document.getElementById('map');
				var map = new ol.Map({
						target : mapTarget,
						layers : [ new ol.layer.Tile({
								source : new ol.source.OSM({
										attributions : false
								})
						}) ],

						view : new ol.View({
								center : ol.proj.fromLonLat([ 126.9784, 37.5667 ]),
								zoom : 12
						})
				});
		&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code>
		</pre>
			<li>모두 되었습니다. 여러분의 웹브라우저에는 아래와 같이 <code>500x400</code> 크기의 지도가
				생성되었을 겁니다.
			</li>
			<div>
				<body>
					<div id="map" style="width: 500px; height: 400px;"></div>
					<script
						src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v5.3.0/build/ol.js"></script>
					<script>
						var mapTarget = document.getElementById('map');
						var map = new ol.Map({
							target : mapTarget,
							layers : [ new ol.layer.Tile({
								source : new ol.source.OSM({
									attributions : false
								})
							}) ],

							view : new ol.View({
								center : ol.proj
										.fromLonLat([ 126.9784, 37.5667 ]),
								zoom : 12
							})
						});
					</script>
				</body>
			</div>

		</ul>
	</div>
	</div>

</div>

</div>
</div>


</div>
</div>
</div>

</body>
</html>
