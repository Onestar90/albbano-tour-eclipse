<%@page import="java.sql.SQLException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseManagementDAO"%>
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
</script>
</head>
<body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="curVO" class="vo.CourseManagementVO" scope="page"/>
	<jsp:setProperty property="*" name="curVO"/>
<div>

    <%
    try{
    	
    String[] crsSpotsArray = request.getParameterValues("spotValues");

    List<String> crsSpotsList = new ArrayList<>();
    if (crsSpotsArray != null) {
        for (String spot : crsSpotsArray) {
            String[] spots = spot.split(",");
            for (String s : spots) {
                crsSpotsList.add(s.trim());
            }
        }
    }
    String[] crsSpots = crsSpotsList.toArray(new String[5]);

    curVO.setCrsSpots(crsSpots);
    CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
    cDAO.insertCurs(curVO);

    for (int i = 0; i < 5; i++) {
   cDAO.insertTourCurs(curVO.getCrsCode(), crsSpots[i],i+1);
    }
    %>
    코스 추가에 성공했습니다. <br>
    <a href="select_curs.jsp">코스리스트로 돌아가기.</a>
    <%
    }catch(SQLException se){
    	se.printStackTrace();
    %>	
    코스 추가에 실패했습니다.
    잠시 후 시도해주세요.
    <%
    }

    %>
    
</div>
</body>
</html>