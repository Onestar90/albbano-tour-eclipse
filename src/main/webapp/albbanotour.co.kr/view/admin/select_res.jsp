<%@page import="java.util.List"%>
<%@page import="vo.ResListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RestaurantManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
List<ResListVO> list = new ArrayList<ResListVO>();
list = rDAO.selectAllRes();
pageContext.setAttribute("list", list);
rDAO.selectMaxRes();
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
	#img{width: 150px;height: 150px}
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
	function submitFrm(res_code) {
		var form = document.createElement('form');
		form.method = 'POST';
		form.action = 'select_one_res.jsp';

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
<div>
<div>
<h3>맛집 리스트</h3>
</div>
<table style="width:100%">
<thead>
<tr style="height: 100px">
<th>번호</th>
<th>코드</th>
<th>상호명</th>
<th>설명</th>
<th>휴일</th>
<th>영업시간</th>
<th>위치</th>
<th>이미지</th>
<th>수정일</th>
<th>위도</th>
<th>경도</th>
</tr>
</thead>
<tbody>
<c:forEach var ="res" items="${ list }" varStatus="i">
<tr style="height: ">
<td><c:out value="${ i.count }"/></td>
<td><c:out value="${ res.res_code }"/></td>
<td onclick="submitFrm('${res.res_code}')"><c:out value="${ res.res_name }"/></td>
<td><c:out value="${ res.intro }"/></td>
<td><c:out value="${ res.holiday }"/></td>
<td><c:out value="${ res.busi_hour }"/></td>
<td><c:out value="${ res.res_loc }"/></td>
<td id="img"><img src="http://192.168.10.221/albbano-tour-eclipse/upload/${ res.img_name }" width="150px" height="150px"/></td>
<td><c:out value="${ res.edit_date }"/></td>
<td><c:out value="${ res.latitude }"/></td>
<td><c:out value="${ res.longitude }"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div>
<a href ="insert_res.jsp">맛집추가</a>
</div>
</body>
</html>