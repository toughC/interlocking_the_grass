<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Code block highlighting -->
<script>
	hljs.initHighlightingOnLoad();
	hljs.initLineNumbersOnLoad();
</script>
<body id=link
	onload="get_depth1_id(), get_depth2_3_ids(), sampleBodyList(), loadDarkModeState()">

	<!-- wrapper -->
	<div id="wrapper">
		<!-- header-gnb -->
		<div id="header">
			<div class="mb-menu" onclick="$('body').toggleClass('menuOn')"></div>
			<a class="logo" href="/guide">
				<span>seesunIT</span>
				<p>개발자 센터</p>
			</a>

			<ul id="get_depth1_id" class="gnb"></ul>

			<!-- dark mode -->
			<div class="ModeBtn" onclick="$('body').toggleClass('darkMode'), saveDarkModeState()"></div>
		</div>

		<!-- sideMenu -->
		<div id="sideMenu">
			<button type="submit" class="search"></button>
			<input type="text" id="search-input" placeholder="Search 검색" onkeyup="get_depth2_3_ids();">

			<div class="tab">
				<div id="menuLv2Lv3" class="listGroup" autocomplete="off" onclick="handleMenuClick(event)"></div>
			</div>
		</div>

		<!-- body -->
		<div id="content">
			<div class="container">