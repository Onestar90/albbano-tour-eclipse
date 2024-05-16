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
<title>코스 수정</title>
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
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="curVO" class="vo.CourseManagementVO" scope="page"/>
 <jsp:setProperty property="*" name="curVO"/>
 
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
    cDAO.updateCurs(curVO);

    for (int i = 0; i < 5; i++) {
   cDAO.updateTourCurs(curVO.getCrsCode(), crsSpots[i],i+1);
    }
    %>
    	코스 수정에 성공했습니다.<br>
    	<c:redirect url ="select_curs.jsp"/>
    <%
    }catch(SQLException se){
    	se.printStackTrace();
    	%>
    	코스 수정에 실패하였습니다.
    	<a href ="select_curs.jsp">코스 리스트로 돌아가기</a>
    	<%
    }
    %>

    
</div>
</body>
</html>