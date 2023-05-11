<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>
	var pageId = 'DE_004';
	pageName = 'help';
</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1>PostgreSQL</h1>
<div class="section">
	<h2>PostgreSQL과 eGovFrame을 연결</h2>
	<ul class="listStyle-01 row">
		<li>1. 우선 PostgreSQL 설치를 합니다.</li>
		<li>2. 경로 설정하고 port 설정합니다.</li>
		<li>3. PostGis와 연결합니다.</li>
	</ul>
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

</div>
</div>
</body>
</html>
