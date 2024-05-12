<%@page import="vo.SpotListVO"%>
<%@page import="dao.SpotManagementDAO"%>
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
	textarea{width: 600px; height: 300px; }
	
</style>
<script type ="text/javascript">
function submitModify(spot_code) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'modify_spot.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'spot_code';
	input.value = spot_code;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
	}
function submitDelete(spot_code) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'delete_spot.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'spot_code';
	input.value = spot_code;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
	}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");


String spotcode = request.getParameter("spot_code");
SpotManagementDAO sDAO = SpotManagementDAO.getInstance();

SpotListVO sVO = sDAO.selectSpot(spotcode);
pageContext.setAttribute("sVO", sVO);
%>
<form >
<div>
<table>
<thead>
<tr>
	<th style="width:100px">코드</th>
	<th style="width:100px">이름</th>
	<th style="width:600px">설명</th>
	<th style="width:100px">이미지이름</th>
	<th style="width:100px">생성일</th>
	<th style="width:100px">경도</th>
	<th style="width:100px">위도</th>
	<th style="width:100px">위치</th>
</tr>
</thead>
<tbody>
<tr>
	<td>${ sVO.spot_code }</td>
	<td>${ sVO.spot_name } </td>
	<td>${ sVO.spot_desc }</td>
	<td>${ sVO.img_name }</td>
	<td>${ sVO.create_date }</td>
	<td>${ sVO.longitude }</td>
	<td>${ sVO.latitude }</td>
	<td>${ sVO.spt_loc }</td>
</tr>
</table>
</div>
</form>
<input type ="button" value ="관광지 수정" onclick="submitModify('${sVO.spot_code}')"/>
<input type ="button" value ="삭제" onclick="submitDelete('${sVO.spot_code}')"/>
</body>
</html>