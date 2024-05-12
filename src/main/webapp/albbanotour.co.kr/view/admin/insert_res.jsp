<%@page import="vo.ResListVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.RestaurantManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
List<ResListVO> list = rDAO.resCat();
String res_code =rDAO.selectMaxRes();
pageContext.setAttribute("list", list);
pageContext.setAttribute("res_code", res_code);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.221/jsp_prj/common/favicon.ico" type="image/x-icon">
<!--부트스트랩 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--부트스트랩 끝-->
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/board.css" type="text/css" media="all" />
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!--jQuery CDN 끝-->
<style type="text/css">
	
	
</style>
<script type ="text/javascript">
	$(function(){
		$("#btn").click(function(){
		var file = $("#img_name").val();
		var selectedExt = file.substring(file.lastIndexOf(".")+1);

		var extArr = ["png", "jpg", "gif", "jpeg", "bmp"];
		var flag = false;

		for(var i = 0; i < extArr.length; i++) {
		if(selectedExt == extArr[i]) {
		flag = true;
		break;
		} // end if
		} // end for

		if(!flag) {
		alert(selectedExt + "는 업로드 가능한 파일의 확장자가 아닙니다.");
		return;
		} // end if

		$("#frm").submit();
		
	})
	});//ready
</script>
</head>
<body>
<div>
<form action="insert_res_process.jsp" id ="frm" method="post" enctype="multipart/form-data" >
<table>
<tr>
<th>맛집 코드</th>
<th>맛집 카테고리</th>
<th>맛집명</th>
<th>맛집소개</th>
<th>휴일</th>
<th>영업시간</th>
<th>맛집 위치</th>
<th>이미지</th>
<th>위도</th>
<th>경도</th>
</tr>
<tr>
<td><input type ="text" name ="res_code" value="${ res_code }" /></td>
<td><select name ="res_cat" >
<c:forEach var="cat" items="${ list }">
<option value="${ cat.res_cat }">${ cat.res_cat }</option>
</c:forEach>
</select>
</td>
<td><input type ="text" name ="res_name" /></td>
<td><input type ="text" name ="intro" /></td>
<td><input type ="text" name ="holiday" /></td>
<td><input type ="text" name ="busi_hour" /></td>
<td><input type ="text" name ="res_loc" /></td>
<td><input type ="file" name ="img_name" id ="img_name"/></td>
<td><input type ="text" name ="latitude" /></td>
<td><input type ="text" name ="longitude" /></td>
</tr>
</table>
<input type="button" value="맛집 추가" id ="btn"/>
</form>
</div>
</body>
</html>