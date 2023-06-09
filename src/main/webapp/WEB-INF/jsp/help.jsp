<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<script>
	var pageId = 'DE_004', pageName = 'help'
</script>
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<h1 id="setpostgre">PostgreSQL</h1>
<div class="section">
	<h2 id="linkpostgregovframe">PostgreSQL과 eGovFrame을 연결</h2>
	<ul class="listStyle-01 row">
		<li>• eGovFrame과 연결하기 위해 <strong>PostgreSQL</strong>을 설치해야 합니다.
		</li>
		<li>• <a class="underover" href="https://www.postgresql.org/"
			target="_blank" rel="noopener noreferrer">Postgresql 설치 사이트</a>
			(https://www.postgresql.org) 접속
		</li>
	</ul>
	<div class="info">
		<p>설치하려면 아래 과정이 필요합니다.</p>
		<p style="text-align: right;">마지막 수정 2023.05.16</p>
		<div class="textBox">
			<ul>
				<li>
					<div class="imgBox">
						<img src="/images/postgresql-help/image1.png">
						<p style="margin-bottom: 2px;">
							1. PostgreSQL 설치 마법사를 실행시킵니다. 그리고 <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image2.png">
						<p style="margin-bottom: 2px;">
							2. 설치 경로 지정 후, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image3.png">
						<p style="margin-bottom: 2px;">
							3. 설치한 구성 요소 선택 후, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image4.png">
						<p style="margin-bottom: 2px;">
							4. 기본 경로를 유지하고, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image5.png">
						<p style="margin-bottom: 2px;">
							5. pw 설정하고, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image6.png">
						<p style="margin-bottom: 2px;">
							6. 기본 Port 번호로 지정된 값: 5432, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image7.png">
						<p style="margin-bottom: 2px;">
							7. Korean, Korea 선택하고, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image8.png">
						<p style="margin-bottom: 2px;">
							8. <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image9.png">
						<p style="margin-bottom: 2px;">
							9. Install 준비완료, <strong>Next</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image10.png">
						<p style="margin-bottom: 2px;">
							10. <strong>Finish</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image20.png">
						<p style="margin-bottom: 2px;">
							11. 데이터베이스를 생성해야 합니다.</br>설치한 <strong>pgAdmin4</strong>을 실행시키고, 이미지와
							같이 <strong>Object > Create > Server Group</strong> 클릭합니다.
						</p>

						<img src="/images/postgresql-help/image21.png">
						<p style="margin-bottom: 2px;">
							12. 원하는 <strong>Server Group Name</strong>을 입력하고 <strong>Save</strong>
							클릭합니다.
						</p>

						<img src="/images/postgresql-help/image22.png">
						<p style="margin-bottom: 2px;">
							13. 생성한 Server Group 우클릭 하고, <strong>Register > Server</strong>
							클릭합니다.
						</p>

						<img src="/images/postgresql-help/image23.png">
						<p style="margin-bottom: 2px;">
							14. General 탭에 원하는 <strong>Name</strong>을 입력합니다.
						</p>

						<img src="/images/postgresql-help/image24.png">
						<p style="margin-bottom: 2px;">
							15. 생성한 Server Group 우클릭 하고, <strong>Register > Server</strong>
							클릭합니다.
						</p>

						<img src="/images/postgresql-help/image25.png">
						<p style="margin-bottom: 2px;">
							16. 이미지를 참고해서 <strong>mapper-config.xml</strong> 파일을 찾아 열어줍니다.
						</p>

						<img src="/images/postgresql-help/image26.png">
						<p style="margin-bottom: 2px;">
							17. <strong>DbType, url, UserName, Password</strong>를 알맞게 입력합니다.
						</p>

						<img src="/images/postgresql-help/image27.png">
						<p style="margin-bottom: 3px;">
							18. <strong>xml</strong> 파일을 만들어서 <strong>sql 쿼리문</strong>을
							작성합니다.
						</p>
					</div>
				</li>
				<li>
					<p class="textBox"
						style="text-align: center; padding-top: 4px; padding-bottom: 4px;">
						※ 필요에 따라 PostGIS를 설치하십시오.</br>• <a class="underover"
							href="https://download.osgeo.org/postgis/windows/"
							target="_blank" rel="noopener noreferrer">PostGIS 설치 사이트</a> 접속</br>•
						<a class="underover"
							href="https://download.osgeo.org/postgis/windows/"
							target="_blank" rel="noopener noreferrer">PostGIS 설치 가이드</a> 접속
					</p>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="section">
	<h2 id="sqlquery">SQL 쿼리문</h2>
	<ul class="listStyle-01 row">
		<li>• eGovFrame에서 <strong>GIS</strong>를 활용하기 위한 자주 사용되는 SQL 쿼리문을
			소개하겠습니다.
		</li>
	</ul>
	<div class="info">
		<p>아래에서 확인이 가능합니다.</p>
		<p style="text-align: right;">마지막 수정 2023.05.16</p>

		<div class="textBox">
			<ul>
				<li>1. <strong>레이어 조회</strong>: <code> SELECT * FROM
						레이어_테이블명;</code> </br>위의 쿼리문은 특정 레이어 테이블에서 모든 레코드를 선택하여 조회하는 예시입니다. 레이어_테이블명은
					실제로 사용하는 레이어 테이블의 이름으로 대체되어야 합니다.
				</li>
				</br>
				<li>2. <strong>공간 범위 내의 레이어 조회</strong>: <code>SELECT *
						FROM 레이어_테이블명 WHERE ST_Intersects(좌표열,
						ST_GeomFromText('POLYGON((경도1 위도1, 경도2 위도2, 경도3 위도3, 경도1 위도1))'));</code>
					</br>위의 쿼리문은 주어진 공간 범위 내에 속하는 레이어를 조회하는 예시입니다. 좌표열은 레이어 테이블에서 공간 정보를
					나타내는 열의 이름으로 대체되어야 합니다. POLYGON 내에는 좌표값으로 이루어진 다각형을 정의하며, 검색하려는 공간
					범위에 맞게 좌표값을 설정해야 합니다.
				</li>
				</br>
				<li>3. <strong>레이어의 속성 조회</strong>: <code>SELECT 속성1,
						속성2 FROM 레이어_테이블명;</code> </br>위의 쿼리문은 특정 레이어 테이블에서 지정한 속성 열의 값을 조회하는 예시입니다.
					속성1, 속성2는 실제로 사용하는 레이어 테이블의 속성 열의 이름으로 대체되어야 합니다.
				</li>
				</br>
				<li>4. <strong>공간 데이터의 거리 계산</strong>: <code>SELECT
						ST_Distance(좌표열1, 좌표열2) AS 거리 FROM 레이어_테이블명;</code> </br>위의 쿼리문은 두 공간 데이터 간의
					거리를 계산하여 출력하는 예시입니다. 좌표열1, 좌표열2는 실제로 사용하는 레이어 테이블에서 공간 정보를 나타내는 열의
					이름으로 대체되어야 합니다.
				</li>
				</br>
				<li>5. <strong>레이어 속성 필터링</strong>: <code>SELECT * FROM
						레이어_테이블명 WHERE 속성 = '값';</code> </br>위의 쿼리문은 특정 속성 열에서 지정한 값과 일치하는 레코드를 조회하는
					예시입니다. 레이어_테이블명은 실제 레이어 테이블의 이름으로 대체되어야 합니다. 속성은 검색하려는 속성 열의 이름이며,
					'값'은 원하는 값으로 대체되어야 합니다.
				</li>
				</br>
				<li>6. <strong>레이어 속성 정렬</strong>: <code>SELECT * FROM
						레이어_테이블명 ORDER BY 속성 ASC/DESC;</code> </br>위의 쿼리문은 특정 속성 열을 기준으로 레코드를
					오름차순(ASC) 또는 내림차순(DESC)으로 정렬하여 조회하는 예시입니다.
				</li>
				</br>
				<li>7. <strong>레이어 속성 그룹화</strong>: <code>SELECT 속성,
						COUNT(*) FROM 레이어_테이블명 GROUP BY 속성;</code> </br>위의 쿼리문은 특정 속성 열을 기준으로 레코드를
					그룹화하고, 각 그룹에 대한 레코드 수를 계산하여 조회하는 예시입니다.
				</li>
				</br>
				<li>8. <strong>레이어 조인</strong>: <code>SELECT * FROM
						레이어_테이블1 INNER JOIN 레이어_테이블2 ON 조인_조건;</code> </br>위의 쿼리문은 두 개의 레이어 테이블을 조인하여
					관련된 정보를 가져오는 예시입니다. 레이어_테이블1과 레이어_테이블2는 실제 레이어 테이블의 이름으로 대체되어야 합니다.
					조인_조건은 두 테이블 간의 관계를 정의하는 조인 조건으로 대체되어야 합니다.
				</li>
			</ul>
		</div>
	</div>

	<div class="section">
		<h1 id="setsvn">SVN</h1>
		<div class="section">
			<h2 id="linkegovframesvn">eGovFrame에서 SVN연결</h2>
			<ul class="listStyle-01 row">
				<li>• eGovFrame에서 <strong>SVN</strong>을 연결하는 과정을 소개하겠습니다.
				</li>
			</ul>
		</div>
		<div class="info">
			<p>연결하려면 아래 과정이 필요합니다.</p>
			<p style="text-align: right;">마지막 수정 2023.05.16</p>

			<div class="textBox">
				<ul>
					<li>
						<div class="imgBox">
							<img src="/images/svn-help/image1.png">
							<p style="margin-bottom: 2px;">
								1. eGovFrame을 실행시켜서 <strong>SVN Repositories</strong>에서 <strong>New
									> Repository Location</strong>을 클릭합니다.
							</p>

							<img src="/images/svn-help/image2.png">
							<p style="margin-bottom: 2px;">
								2. URL 칸에 <strong>svn://seesunit.iptime.org:36901/projects</strong>
								입력하고, User 칸에 <strong>자신의 이름</strong>을 입력하고 <strong>Finish</strong>
								클릭합니다. </br>(Password가 있는 경우 비번 입력)
							</p>

							<img src="/images/svn-help/image3.png">
							<p style="margin-bottom: 2px;">
								3. <strong>SVN Repositories</strong> 상자 안에 이미지와 같이 연결됩니다.
							</p>

							<img src="/images/svn-help/image4.png">
							<p style="margin-bottom: 2px;">
								4. <strong>commit</strong>하고 싶은 프로젝트를 우클릭해서 <strong>Team
									> Apply Patch...</strong>을 클릭합니다.
							</p>

							<img src="/images/svn-help/image5.png">
							<p style="margin-bottom: 2px;">
								5. 이미지와 같이 보이면<strong> Finish</strong>을 클릭합니다.
							</p>

							<img src="/images/svn-help/image6.png">
							<p style="margin-bottom: 2px;">
								6. 연결한 프로젝트를 우클릭 하고<strong> Team > Synchronize with
									Repository</strong>를 클릭합니다.
							</p>

							<img src="/images/svn-help/image7.png">
							<p style="margin-bottom: 2px;">
								7. <strong>Comment</strong>를 작성하고 <strong>commit</strong> 할 폴더 나
								파일을 선택한 후, <strong>Ok</strong>를 클릭합니다.
							</p>

							<img src="/images/svn-help/image8.png">
							<p style="margin-bottom: 2px;">
								8. 이미지와 같이 업로드 되면 <strong>성공</strong>입니다.
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="section">
		<h1 id="setrelease">Release</h1>
		<div class="section">
			<h2 id="devversion">프로젝트 버전 관리</h2>
			<ul class="listStyle-01 row">
				<li>• 프로젝트 개발 버전에 따라 내용과 기능을 명확히 표시하여 소개하겠습니다.</li>
			</ul>
			<div class="info">
				<p>아래에서 확인이 가능합니다.</p>
				<p style="text-align: right;">마지막 수정 2023.05.23</p>

				<div class="textBox">
					<ul>
						<li>작성자: 박수빈</li>
						<li>마지막 수정일: 2023년 6월 7일</li>
						<li>프로젝트 버전: v1.0.0-release</li>
						<li>프로젝트 설명: 초기 버전입니다. 기본 기능 구현 및 초기 UI 설계가 완료되었습니다.</li>
						<li>기능: 다크 모드(Dark Mode) - 사용자가 웹 애플리케이션의 UI를 어둡게 설정할 수 있는
							기능입니다. 시각적인 편안함을 제공하고 화면의 명암 대비를 조절할 수 있습니다.</li>
						<li>사용 기술</br>1. Database: PostgreSQL 12.14</br> 2. Web Application
							Server: Apache Tomcat 9.0</br> 3. Development Environment:
							eGovFramework IDE</br> 4. Frameworks: Spring and MyBatis</br> 5. Languages
							and Libraries: Java, JSP, JavaScript, JSTL, jQuery(Ajax)
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>
</body>
</html>
