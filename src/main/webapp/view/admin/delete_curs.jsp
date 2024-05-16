<%@page import="java.sql.SQLException"%>
<%@page import="oracle.net.aso.c"%>
<%@page import="dao.CourseManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<%
request.setCharacterEncoding("UTF-8");
String crsCode=request.getParameter("crsCode");

CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
try{
cDAO.deleteCurs(crsCode);
%>
<c:redirect url="select_curs.jsp"/>
<%

}catch(SQLException se){
	se.printStackTrace();
	%>
 삭제 실패.
 <a href="select_curs.jsp">코스 리스트로 돌아가기</a>
	<%
}
%>