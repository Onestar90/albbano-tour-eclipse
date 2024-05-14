<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");

String email = request.getParameter("email");
String name = request.getParameter("name");

UserInfoManagementDAO uiDAO = new UserInfoManagementDAO();
String id = uiDAO.searchId(name, email);

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인 | 알빠노관광</title>

    <script>
        var g5_url = "../index.html";
        var g5_bbs_url = "index.html";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "";
        var g5_sca = "";
        var g5_editor = "";
        var g5_cookie_domain = "";
    </script>
    <%@ include file="common_head.jsp" %>
</head>

<body>
<!-- 로그인 시작 { -->
<div id="mb_login" class="mbskin">
    <div class="mbskin_box">
        <h1>로그인</h1>
        <div><a href="index_user.jsp"><h2 style="font-size: 2rem; margin: 20px auto"><img
                src="../front_util/images/top_logo.png" alt="처음으로 "></h2></a></div>


<form name="idsearch" method="post">
	<%
		if(id != null){
	%>
	<div class="container">
		<div class = "found-success">
	      <h4>  회원님의 아이디는 <%=id%> 입니다.</h4>  
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
	      <h4>  등록된 정보가 없습니다 </h4>  
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
      </div>
</div>

