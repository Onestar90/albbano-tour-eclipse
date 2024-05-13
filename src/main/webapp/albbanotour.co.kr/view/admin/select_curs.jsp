<%@page import="java.util.List"%>
<%@page import="dao.CourseManagementDAO"%>
<%@page import="vo.CourseManagementVO"%>
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
	$(function(){
	
	});//ready
	function submitFrm(crsCode) {
		var form = document.createElement('form');
		form.method = 'POST';
		form.action = 'select_one_curs.jsp';

		var input = document.createElement('input');
		input.type = 'hidden';
		input.name = 'crsCode';
		input.value = crsCode;

		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
		}
</script>
</head>
<body>
<div>
<%
CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
List<CourseManagementVO> list= cDAO.selectAllCurs();
pageContext.setAttribute("list", list);
%>
<h3>투어코스 리스트</h3>
<table>
<tr>
<th>번호</th>
<th>코스코드</th>
<th>코스이름</th>
<th>코스설명</th>
<th>운임</th>
</tr>
<c:forEach var="cur" items="${list }" varStatus="i">
<tr>
<td>${ i.count }</td>
<td >${ cur.crsCode  }</td>
<td onclick="submitFrm('${cur.crsCode}')">${ cur.crsName }</td>
<td>${ cur.crsDesc }</td>
<td>${ cur.fare }원</td>
</tr>
</c:forEach>
</table>
<a href ="insertCurs.jsp">코스추가</a>
</div>
</body>
</html>