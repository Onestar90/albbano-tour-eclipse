<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");

String email = request.getParameter("email");
String id = request.getParameter("id");

UserInfoManagementDAO uiDAO = new UserInfoManagementDAO();
String pass = uiDAO.searchPass(email, id);

%>

<form name="pwSearch" method="post">
	<%
		if(pass != null){
	%>
	<div class="container">
		<div class = "found-success">
	      <h4>  회원님의 비밀번호는 <%=pass%> 입니다.</h4>  
	      <%-- <div class ="id"><%=id%></div> --%>
	     </div>
	     <div class = "found-login">
 		    <!-- <input type="button" id="btnLogin" value="로그인" onClick = 'login()'/> -->
       		<input type="button" id="btnLogin" value="로그인" onclick="window.location.href='login.jsp'" />
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다. 다시 입력 부탁드립니다. </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onClick="joinin()"/>
       	</div>
       </div>
       
    <div class = "adcontainer">
	<a href="#" ><img src = "../images/casead.png" /></a>                
</div>   
       <%
  }
 %> 
      </form>

