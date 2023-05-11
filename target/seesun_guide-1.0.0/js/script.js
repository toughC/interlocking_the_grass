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
			var context = "", compare = "";
			console.log(data);

			for (var i = 0; i < data.length; i++) 
			{	
				if(compare != data[i].parent_cd)
				{
					context += "<a class=title";
					if(data[i].grandparent_cd != 'DE_002') context += " href=#" + data[i].parent_tag;
					context += "> " + data[i].parent_name + "</a><ul>";
					compare = data[i].parent_cd;		
				}
			
				context += "<li><a href="
				if(data[i].grandparent_cd == 'DE_002') context += "sample/" + data[i].dept_tag;
				else context += "#" + data[i].dept_tag ;
				context += "><p>" + data[i].dept_name + "</p></a></li>";			    
			}
			context += "</ul>";
			
			$('#menuLv2Lv3').html(context);		
		},

		error : (e) => console.log(e)
	}); 		
}



function sampleBodyList() {
	$
			.ajax({
				url : "sampleBodyList.do",
				type : "post",
				data : {
					lv1 : encodeURIComponent(pageId)
				},
				dataType : "json",
				success : function(data) {
					var $container = $(".map-container");
					var htmlArr = [];
					for (var i = 0; i < data.length; i++) {
						var dept_tag = data[i].dept_tag;
						htmlArr
								.push(`<li><a class="${data[i].dept_cd}" data-dept-tag="${dept_tag}"><p>더 보기</p></a><div>${data[i].dept_name}</div></li>`);
					}
					$container.append(htmlArr.join(''));
					$container.on("click", "li", function() {
						var dept_tag = $(this).find("a").data("dept-tag");
						window.location.href = 'sample/'
								+ dept_tag.replace(/\s/g, '%20');
					});
				}
			});
}

// darkMode 상태를 저장하는 함수
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
});
