<%@page import="vo.SpotListVO"%>
<%@page import="dao.SpotManagementDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
function submitForm(spot_code) {
var form = document.createElement('form');
form.method = 'POST';
form.action = 'select_one_spot.jsp';

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
<div>
<%
SpotManagementDAO sDAO = SpotManagementDAO.getInstance();
List<SpotListVO> sList = new ArrayList<SpotListVO>();
sList = sDAO.selectAlSpot();
pageContext.setAttribute("sList", sList);
%>
<table >
<thead>
<tr>
	<th >번호</th>
	<th >코드</th>
	<th >이름</th>
	<th >설명</th>
	<th >이미지이름</th>
	<th >생성일</th>
	<th >경도</th>
	<th >위도</th>
	<th >위치</th>
</tr>
</thead>
<tbody>
<c:forEach var ="spt" items="${sList}" varStatus="i">
<tr style="height: 400px">
	<td><c:out value ="${ i.count }"/></td>
	<td><c:out value ="${ spt.spot_code }"/></td>
	<td onclick="submitForm('${spt.spot_code}')"><c:out value ="${ spt.spot_name }"/></td>
	<td ><c:out value ="${ spt.spot_desc }"/></td>
	<td><img src ="http://localhost/albbano-tour-eclipse/upload/${ spt.img_name }" width="150px" height="150px"/></td>
	<td><c:out value ="${ spt.create_date }"/></td>
	<td><c:out value ="${ spt.longitude }"/></td>
	<td><c:out value ="${ spt.latitude }"/></td>
	<td><c:out value ="${ spt.spt_loc }"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div>
<a href ="insertSpot.jsp"> 관광지 추가</a>
</div>
</body>
</html>