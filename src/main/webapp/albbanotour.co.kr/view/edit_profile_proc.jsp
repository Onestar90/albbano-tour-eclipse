<%@page import="vo.UserInfoVO"%>
<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원정보수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id=(String)session.getAttribute("idKey");
	String pass=request.getParameter("pass");
	String newPass=request.getParameter("newPass");
	
	UserInfoVO uiVO=new UserInfoVO();
	uiVO.setId(id);
	uiVO.setPass(pass);
	uiVO.setNewPass(newPass);
	
	boolean isSuccess=UserInfoManagementDAO.getInstance().updatePass(uiVO);
	if(isSuccess){
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<% if(isSuccess){ %>
		<p>
			회원정보가 수정되었습니다. 로그아웃 되었습니다.
			<a href="login.jsp"></a>
		</p>
		<%}else{ %>
		<p>
			비밀번호가 일치하지 않습니다. 
			<a href="edit_profile.jsp"></a>
		</p>
		<%} %>
	</div>
</body>