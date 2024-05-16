<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="테이블에 아이디, 비번이 존재하는지의 여부를 체크하는 페이지"%>
<%-- <jsp:useBean id="uiVO" class="vo.UserInfoVO" scope="page"/>
<jsp:setProperty name="uiVO" property="*"/> --%>
<%
LoginDAO loginDAO = LoginDAO.getInstance();

	String id="";//""- empty
	String password="";
	
	id = request.getParameter("mb_id");
	password = request.getParameter("mb_password");
	
	//비번 일방향 Hash로 암호화
	//uiVO.setPass(DataEncrypt.messageDigest("MD5",uiVO.getPass()));
	
	//System.out.println("-----------------"+id+", "+password+" ");
	if(loginDAO.loginRegister(id, password)){
		//복호화 
		//String key="gdyb21LQTcIANtvYMT7QVQ==";
		
		session.setAttribute("idKey",id);
%>
	<script>
	alert("로그인 되었습니다.");
	location.href="index_user.jsp";
	</script>
<% } else{ %>
	<script>
	alert("로그인에 실패하였습니다. ");
	location.href="login.jsp";
	</script>
<%}%> 


