<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>


</head>
<body onload="home()">
	<h3>test_board Page</h3>
	<div>
		<table class="custom-table" border="1">
			<thead>
				<tr>
				 <input type="text" id="search-input" placeholder="입력하세요" onkeyup="home(this);">

				
					<th>parent_cd</th>
					<th>parent_name</th>
					<th>dept_cd</th>
					<th>dept_name</th>
				</tr>
			</thead>
			<tbody id="homeList">

			
			</tbody>
			
		</table>
	</div>
</body>


<script>
	
function home() {                             
		$.ajax({
			url : "home.do",
			type : "post",
			data : {
				lv1 :encodeURIComponent('DE_001'),
				keyword : $('#search-input').val()
			},
			dataType : "json",
			async : false,
			success : function(data){				
				var context = "";
				
				for(var i = 0; i < data.length; i++){
					context += "<tr>";
					context += "<td>" + data[i].parent_cd+ "</td>";
					context += "<td>" + data[i].parent_name+ "</td>";
					context += "<td>" + data[i].dept_cd+ "</td>";
					context += "<td>" + data[i].dept_name+ "</td>";

				}
				
				$('#homeList').html(context);
			},
			error : (e) => console.log(e)
		});
	} 

</script>

</html>