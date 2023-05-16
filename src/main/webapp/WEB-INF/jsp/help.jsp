<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>var pageId = 'DE_004', pageName = 'help'</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1 id="setpostgre">PostgreSQL</h1>
<div class="section">
	<h2 id="linkpostgregovframe">PostgreSQL과 eGovFrame을 연결</h2>
	<ul class="listStyle-01 row">
		<li>• eGovFrame과 연결하기 위해 <strong>PostgreSQL</strong>을 설치해야 합니다. 
		</li>
		<li>• <a class="underover" href="https://www.postgresql.org/" target="_blank"
							rel="noopener noreferrer">Postgresql 설치 사이트</a>
							(https://www.postgresql.org) 접속</li>
	</ul>
	<div class="info">
		<p>설치하려면 아래 과정이 필요합니다.</p>
		<div class="textBox">
		<ul>
			<li>
				<div class="imgBox">
					<img src="/images/postgresql-help/image1.png">
					<p style="margin-bottom:2px;">1. PostgreSQL 설치 마법사를 실행시킵니다. 그리고 <strong>Next</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image2.png">
					<p style="margin-bottom:2px;">2. 설치 경로 지정 후, <strong>Next</strong> 클릭합니다.</p>
			
					<img src="/images/postgresql-help/image3.png">
					<p style="margin-bottom:2px;">3. 설치한 구성 요소 선택 후, <strong>Next</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image4.png">
					<p style="margin-bottom:2px;">4. 기본 경로를 유지하고, <strong>Next</strong> 클릭합니다.</p>
			
					<img src="/images/postgresql-help/image5.png">
					<p style="margin-bottom:2px;">5. pw 설정하고, <strong>Next</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image6.png">
					<p style="margin-bottom:2px;">6. 기본 Port 번호로 지정된 값: 5432, <strong>Next</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image7.png">
					<p style="margin-bottom:2px;">7. Korean, Korea 선택하고, <strong>Next</strong> 클릭합니다.</p>
			
					<img src="/images/postgresql-help/image8.png">
					<p style="margin-bottom:2px;">8. <strong>Next</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image9.png">
					<p style="margin-bottom:2px;">9. Install 준비완료, <strong>Next</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image10.png">
					<p style="margin-bottom:2px;">10. <strong>Finish</strong> 클릭합니다.</p>
					
					<img src="/images/postgresql-help/image20.png">
					<p style="margin-bottom:2px;">11. 데이터베이스를 생성해야 합니다.</br>설치한 <strong>pgAdmin4</strong>을 실행시키고, 이미지와 같이 <strong>Object > Create > Server Group</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image21.png">
					<p style="margin-bottom:2px;">12. 원하는 <strong>Server Group Name</strong>을 입력하고 <strong>Save</strong> 클릭합니다.</p>
				
					<img src="/images/postgresql-help/image22.png">
					<p style="margin-bottom:2px;">13. 생성한 Server Group 우클릭 하고, <strong>Register > Server</strong> 클릭합니다.</p>
					
					<img src="/images/postgresql-help/image23.png">
					<p style="margin-bottom:2px;">14. General 탭에 원하는 <strong>Name</strong>을 입력합니다.</p>
					
					<img src="/images/postgresql-help/image24.png">
					<p style="margin-bottom:2px;">15. 생성한 Server Group 우클릭 하고, <strong>Register > Server</strong> 클릭합니다.</p>
					
					<img src="/images/postgresql-help/image25.png">
					<p style="margin-bottom:2px;">16. 이미지를 참고해서 <strong>mapper-config.xml</strong> 파일을 찾아 열어줍니다.</p>
					
					<img src="/images/postgresql-help/image26.png">
					<p style="margin-bottom:2px;">17. <strong>DbType, url, UserName, Password</strong>를 알맞게 입력합니다.</p>
					
					<img src="/images/postgresql-help/image27.png">
					<p style="margin-bottom:3px;">18. <strong>xml</strong> 파일을 만들어서 <strong>sql 쿼리문</strong>을 작성합니다.</p>
				</div>
			</li>
			<li>
			<p class="textBox" style="text-align: center;padding-top:4px; padding-bottom: 4px;"> ※ 필요에 따라 PostGIS를 설치하십시오.</br>• <a class="underover" href="https://download.osgeo.org/postgis/windows/" target="_blank"
							rel="noopener noreferrer">PostGIS 설치 사이트</a> 접속</br>• <a class="underover" href="https://download.osgeo.org/postgis/windows/" target="_blank"
							rel="noopener noreferrer">PostGIS 설치 가이드</a> 접속</p>
				
			</li>
			</ul>
		</div>
	</div>
		<li>2. 경로 설정하고 port 설정합니다.</li>
		<li>3. PostGis와 연결합니다.</li>
	<ul class="listStyle-02">
		<li>a. SHP 파일을 다운로드 합니다</li>
		<li>b. SHP 파일을 삭제 합니다</li>
	</ul>
	<ul class="listStyle-03 mbImgBox">
		<!-- 수정 / 클래스 추가 -->
		<li class="imgContain">
			<!-- 수정 / 클래스 추가 -->
			<div class="info">
				<p>1. 국가공간정보포털 오픈마켓 사이트(http://data.nsdi.go.kr/dataset)</p>
				<div class="imgBox">
					<img src="/images/map-sample2.png">
				</div>
			</div>
			<div class="info">
				<p>2. QGIS에서 새로운 DB 생성</p>
				<div class="imgBox">
					<img src="/images/map-sample2.png">
				</div>
			</div>
		</li>
	</ul>
</div>


<div class="section">
	<h2 id="sqlquery">SQL 쿼리문</h2>
</div>

<h1 id="setsvn">SVN</h1>
<div class="section">
	<h2 id="linkegovframesvn">eGovFrame에서 SVN연결</h2>
</div>


</div>
</div>
</body>
</html>
