<%@page import="dao.RestaurantManagementDAO"%>
<%@page import="vo.ResListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
function submitModify(res_code) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'modify_res.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'res_code';
	input.value = res_code;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
	}
function submitDelete(res_code) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'delete_res.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'res_code';
	input.value = res_code;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
	}
	
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String resCode= (String)request.getParameter("res_code");
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
ResListVO rVO = rDAO.selectRes(resCode);
pageContext.setAttribute("rVO", rVO);
%>
<div>
<h3>맛집 상세</h3>
</div>
<form>
<div>
<table>
<thead>
<tr>
	<th style="width:100px">코드</th>
	<th style="width:100px">맛집 카테고리</th>
	<th style="width:600px">맛집 이름</th>
	<th style="width:100px">소개</th>
	<th style="width:100px">휴일</th>
	<th style="width:100px">영업시간</th>
	<th style="width:100px">위치</th>
	<th style="width:100px">이미지 이름</th>
	<th style="width:100px">위도</th>
	<th style="width:100px">경도</th>
</tr>
</thead>
<tbody>
<tr>
	<td>${ rVO.res_code }</td>
	<td>${ rVO.res_cat } </td>
	<td>${ rVO.res_name }</td>
	<td>${ rVO.intro }</td>
	<td>${ rVO.holiday }</td>
	<td>${ rVO.busi_hour }</td>
	<td>${ rVO.res_loc }</td>
	<td>${ rVO.img_name }</td>
	<td>${ rVO.latitude }</td>
	<td>${ rVO.longitude }</td>
</tr>
</table>
</div>
</form>
<input type="button" value="맛집 수정" onclick="submitModify('${rVO.res_code}')">
<input type="button" value="맛집 삭제" onclick="submitDelete('${rVO.res_code}')">
</body>
</html>