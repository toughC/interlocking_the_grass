function get_depth1_id() {
	// 중복 호출 방지
	if (get_depth1_id.request) {
		get_depth1_id.request.abort();
	}
	get_depth1_id.request = $.ajax({
		url : "get_depth1_id.do",
		type : "post",
		data : {
			lv1 : encodeURIComponent(pageId)
		},
		dataType : "json",
		success : function(data) {
			var context = "";
			var currentPageMenuName = "";

			for (var i = 0; i < data.length; i++) {
				if (data[i].parent_cd == null) {
					var deptName = data[i].dept_name.toLowerCase();
					context += "<li><a href='/" + deptName + "'>"
							+ data[i].dept_name + "</a></li>";

					// 현재 페이지의 메뉴 이름값 가져오기
					if (data[i].dept_name.toLowerCase() === pageName) {
						currentPageMenuName = data[i].dept_name.toLowerCase();
					}
				}
			}

			// DOM 조작 횟수 최소화
			$('#get_depth1_id').html(context);

			// 가져온 메뉴 이름값과 일치하는 a 태그에 active 클래스 추가
			$('#get_depth1_id li a').filter(function() {
				return $(this).text().toLowerCase() === currentPageMenuName;
			}).addClass('active');
		}
	});
}


function get_depth2_3_ids() {
	$.ajax({
		url : "get_depth2_3_ids.do",
		type : "post",
		data : {
			lv1 :encodeURIComponent(pageId),
			keyword : $('#search-input').val()
		},
		dataType : "json",
		async : false,
		success : function(data)
		{	
			var context = "", compare = [], lv2 =["Methods", "Test.Methods"];
			console.log(data);

			for (var i = 0; i < data.length; i++) 
			{	
				if (!compare.includes(data[i].parent_cd)) 
				{
					context += "<a class=title";
					if(data[i].grandparent_cd != 'DE_002') context += " href=#" + data[i].parent_tag;
					context += "> " + data[i].parent_name + "</a><ul>";
					compare.push(data[i].parent_cd);
					lv3 = 1;
				}
				/*context += "<li>";
*/				if((data[i].grandparent_cd == 'DE_003') && (lv2.includes(data[i].dept_name)))
					context += "<a class=title style='color: #078FDC; font-size: 12px;pointer-events: none;'>" + data[i].dept_name + "</a></li>";
				else{
					context += "<li><a href=";
					if(data[i].grandparent_cd == 'DE_002') context += "sample/" + data[i].dept_tag;
					else context += "#" + data[i].dept_tag ;
					context += "><p>" + data[i].dept_name + "</p></a></li>";	
				}	
			}
			context += "</ul>";
			console.log(compare);
			$('#menuLv2Lv3').html(context);		
		},

		error : (e) => console.log(e)
	}); 		
}

function sampleBodyList() {
	$.ajax({
		url: "sampleBodyList.do",
		type: "post",
		data: {
			lv1: encodeURIComponent(pageId)
		},
		dataType: "json",
		success: function (data) {
			var $container = $(".map-container");
			var htmlArr = [];
			for (var i = 0; i < data.length; i++) {
				var dept_tag = data[i].dept_tag;
				var dept_name = data[i].dept_name;
				var description = "";

				if (data[i].dept_tag == "basicMap")
					description = "지도를 생성하는 가장 기본적인 예제입니다.";
				else if (data[i].dept_tag == "moveMap")
					description = "지도를 이동시킵니다. 지도 객체의 메소드를 통해 지도를 원하는 좌표로 이동시킬 수 있습니다. 또, 지도가 표시되고 있는 영역크기를 벗어나지 않는 거리라면 애니메이션 효과처럼 지도를 부드럽게 이동시킬 수도 있습니다.";
				else if (data[i].dept_tag == "changeLevel")
					description = "지도 레벨을 지도 객체 메소드를 호출해서 변경합니다.";
				else if (data[i].dept_tag == "mapInfo")
					description = "지도 레벨, 중심좌표, 지도 타입, 지도 영역정보를 얻어와 표출합니다.";
				else if (data[i].dept_tag == "addMapControl")
					description = "일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 버튼과 지도 확대, 축소를 제어할 수 있는 도구를 쉽게 지도 위에 올릴 수 있습니다. 각각 지도 타입 컨트롤, 지도 줌 컨트롤이라고 부르며, 아래 예제와 같이 지도 위에 표시될 위치를 지정할 수도 있습니다.";
				else if (data[i].dept_tag == "addMapCustomControl")
					description = "기본으로 제공하는 지도타입 컨트롤과 줌 컨트롤을 원하는 스타일로 직접 만들 수 있습니다. 컨트롤의 색이나 크기 등을 변경해야 할때 유용하겠지요. 아래 예제의 Javascript+HTML 코드를 참고해보세요.";
				htmlArr.push(`<li><div class="scrollable-content"><a class="${data[i].dept_cd}" data-dept-tag="${data[i].dept_tag}"><div class="description-container"><p>${description}</p></div></a><div>${dept_name}</div></div></li>`);
			}

			$container.append(htmlArr.join(''));
			$container.on("click", "li", function () {
				var dept_tag = $(this).find("a").data("dept-tag");
				window.location.href = 'sample/' + dept_tag.replace(/\s/g, '%20');
			});
		}
	});
}


//darkMode 상태를 저장하는 함수
function saveDarkModeState() {
  var isDarkModeOn = $('body').hasClass('darkMode');
  localStorage.setItem('darkModeState', isDarkModeOn);
}
// darkMode 상태를 로드하는 함수
function loadDarkModeState() {
  var isDarkModeOn = localStorage.getItem('darkModeState') === 'true';
  $('body').toggleClass('darkMode', isDarkModeOn);
}
$('.ModeBtn').click(function() {
  $('body').toggleClass('darkMode');
  var isDarkMode = $('body').hasClass('darkMode');
  setDarkModeStatus(isDarkMode);

  // Dark mode가 아닌 경우에 실행할 코드 작성
  if (!isDarkMode) {
    console.log("Running in non-dark mode");
  }
});