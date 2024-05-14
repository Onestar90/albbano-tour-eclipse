<%@page import="java.util.List"%>
<%@page import="vo.ResListVO"%>
<%@page import="dao.RestaurantManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
List<ResListVO> list = rDAO.resCat();
pageContext.setAttribute("list", list);
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
	
	});//ready
</script>
</head>
<%
request.setCharacterEncoding("UTF-8");
String resCode =request.getParameter("res_code");
RestaurantManagementDAO rmDAO = RestaurantManagementDAO.getInstance();
ResListVO rVO= rmDAO.selectRes(resCode);
pageContext.setAttribute("rVO", rVO);
%>
<body>
<form action="modify_res_process.jsp" method="post" enctype="multipart/form-data">
<div>
<table>
<thead>
<tr>
	<th style="width:100px">코드 :</th>
	<th style="width:100px">맛집 카테고리</th>
	<th style="width:100px">맛집 이름</th>
	<th style="width:600px">소개</th>
	<th style="width:100px">휴일</th>
	<th style="width:100px">영업시간</th>
	<th style="width:100px">위치</th>
	<th style="width:100px">이미지 이름</th>
	<th style="width:100px">위도</th>
	<th style="width:100px">경도</th>
</tr>
</thead>
<tbody>

<tr><td>맛집 코드 : <input type="text" name ="res_code" value ="${ rVO.res_code }" readonly="readonly"/></td></tr>
<tr><td>맛집 카테고리 : <select name ="res_cat" >
	<c:forEach var="cat" items="${ list }">
	<option value="${ cat.res_cat }">${ cat.res_cat }</option>
	</c:forEach>
	</select>
	</td></tr>
<tr><td>맛집명 : <input type="text" name ="res_name" value ="${ rVO.res_name }"/></td></tr>
<tr><td>맛집소개 : <textarea name ="intro">${ rVO.intro }</textarea></td></tr>
<tr><td>휴일 : <input type="text" name ="holiday" value ="${ rVO.holiday }"></td></tr>
<tr><td>영업시간 : <input type="text" name ="busi_hour" value ="${ rVO.busi_hour }"></td></tr>
<tr><td>맛집 위치 : <input type="text" name ="res_loc" value ="${ rVO.res_loc }"></td></tr>
<tr><td>이미지 : <input type="file" name ="img_name" /></td></tr>
<tr><td>위도 : <input type="text" name ="latitude" value ="${ rVO.latitude }"></td></tr>
<tr><td>경도 : <input type="text" name ="longitude" value ="${ rVO.longitude }"></td></tr>
</tbody>
</table>
</div>
<input type="submit" value ="내용 수정"/>
</form>
</body>
</html>