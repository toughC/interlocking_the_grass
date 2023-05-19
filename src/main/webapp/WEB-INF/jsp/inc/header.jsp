<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>seesunit 개발자센터</title>

<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/fwall.min.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="shortcut icon" href="../images/2022seesunitLogo.png">

<!-- 코드블럭 스타일 js 및 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.5.0/styles/rainbow.min.css">
<link rel="stylesheet" href="../css/codeStyle.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.5.0/highlight.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlightjs-line-numbers.js/2.8.0/highlightjs-line-numbers.min.js"></script>


<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/script.js"></script>

<link rel="stylesheet"
	href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script
	src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>

<script>
	function toggleCodeDisplay(codeType, button) {
		var jsCode = document.getElementById('jsCode');
		var htmlCode = document.getElementById('htmlCode');
		var jsCodeBtn = document.querySelector('.code-01');
		var htmlCodeBtn = document.querySelector('.code-02');

		if (codeType === 'jsCode') {
			jsCode.style.display = 'block';
			htmlCode.style.display = 'none';
			jsCodeBtn.style.backgroundColor = '#f3f5f5';
			jsCodeBtn.style.color = '#000';
			jsCodeBtn.style.borderBottom = '1px solid transparent';
			htmlCodeBtn.style.backgroundColor = '#e4e4e4';
			htmlCodeBtn.style.color = '#78797a';
			htmlCodeBtn.style.borderBottom = 'none';

		} else if (codeType === 'htmlCode') {
			jsCode.style.display = 'none';
			htmlCode.style.display = 'block';
			jsCodeBtn.style.backgroundColor = '#e4e4e4';
			jsCodeBtn.style.color = '#78797a';
			jsCodeBtn.style.borderBottom = 'none';
			htmlCodeBtn.style.backgroundColor = '#f3f5f5';
			htmlCodeBtn.style.color = '#000';
			htmlCodeBtn.style.borderBottom = '1px solid transparent';
		}
	}

	document.addEventListener('DOMContentLoaded', function() {
		// 초기 상태로 'jsCode'를 선택하도록 설정
		toggleCodeDisplay('jsCode', document.querySelector('.code-01'));

	});
</script>

</head>
