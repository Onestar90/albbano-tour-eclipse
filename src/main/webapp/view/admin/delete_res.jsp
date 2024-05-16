<%@page import="dao.RestaurantManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트스트랩 시작-->
<!--부트스트랩 끝-->
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
<body>
<div>
<%
request.setCharacterEncoding("UTF-8");
String res_code= request.getParameter("res_code");
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
rDAO.deleteRes(res_code);
%>
<c:redirect url="select_res.jsp"/>

</div>
</body>
</html>