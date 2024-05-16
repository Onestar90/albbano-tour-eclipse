<%@page import="vo.UserInfoVO"%>
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

/* String chars="ABCDEFGHIJKLNMOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";	

	StringBuilder randomStr = new StringBuilder();
	for(int i = 0; i < 10; i++) {
		int randomIndex = (int)(Math.random() * chars.length());
		randomStr.append(chars.charAt(randomIndex));
	}//end for

UserInfoVO uiVO = new UserInfoVO();
uiVO.setPass(randomStr.toString());
uiDAO.randomPass(uiVO); */
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인 | 알빠노관광</title>

    <%@ include file="common_head.jsp" %>
</head>

<body>
<!-- 로그인 시작 { -->
<div id="mb_login" class="mbskin">
    <div class="mbskin_box">
        <h1>로그인</h1>
        <div><a href="index_user.jsp"><h2 style="font-size: 2rem; margin: 20px auto"><img
                src="../front_util/images/top_logo.png" alt="처음으로 "></h2></a></div>



<form name="pwSearch" method="post">
	<%
		if(pass != null){
			String chars="ABCDEFGHIJKLNMOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";	

		    StringBuilder randomStr = new StringBuilder();
		    for(int i = 0; i < 10; i++) {
		        int randomIndex = (int)(Math.random() * chars.length());
		        randomStr.append(chars.charAt(randomIndex));
		    }//end for	
		 // 임시 비밀번호를 데이터베이스에 저장
		    UserInfoVO uiVO = new UserInfoVO();
		    uiVO.setId(id); // 아이디 설정
		    uiVO.setPass(randomStr.toString()); // 임시 비밀번호 설정
		    uiDAO.updatePassword(uiVO); // 비밀번호 업데이트
		
	%>
	<div class="container">
		<div class = "found-success">
	      <h4>  회원님의 비밀번호는 <br/><br/> 
	      <span style="font-size:20px; color:red"><%=randomStr%></span> 
	      <br/><br/> 입니다.</h4>  
	      <%-- <div class ="id"><%=id%></div> --%>
	     </div>
	     <div class = "found-login">
 		    <!-- <input type="button" id="btnLogin" value="로그인" onClick = 'login()'/> -->
       		<input type="button" id="btnLogin" class="btn_submit" value="로그인" onclick="window.location.href='login.jsp'" />
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
</div>
</div>
