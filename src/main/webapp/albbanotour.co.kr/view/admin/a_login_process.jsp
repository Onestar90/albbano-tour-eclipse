<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="vo.UserInfoVO"%>
<%@page import="dao.AdminLoginDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="id, pw 받아서 로그인 처리"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="lVO" class="vo.LoginVO" scope="page"/>
<jsp:setProperty name="lVO" property="*"/>
<% 
//비번은 일방향 Hash로 암호화
//lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass()));


pageContext.setAttribute("msg", "로그인 실패. 아이디나 비번을 확인.");
pageContext.setAttribute("url", "a_login.jsp");

AdminLoginDAO alDAO=AdminLoginDAO.getInstance();
try{
	UserInfoVO uiVO=alDAO.selectLogin(lVO);
	if( uiVO != null ){ //로그인 성공
		/*
		//복호화 
		String key="gdyb21LQTcIANtvYMT7QVQ==";
		DataDecrypt dd=new DataDecrypt(key);

		uiVO.setEmail(dd.decryption(uiVO.getEmail()));
		uiVO.setCell(dd.decryption(uiVO.getTell()));
		*/
		
		//세션에 값 설정 
		session.setAttribute("loginData", uiVO);
		
		pageContext.setAttribute("msg", "로그인 성공");
		pageContext.setAttribute("url", "adminBoard.jsp");
	}//end if
}catch(Exception e){
	pageContext.setAttribute("msg", "문제 발생 잠시 후 다시 시도해주세요.");
	pageContext.setAttribute("url", "a_login.jsp");

	e.printStackTrace();
}//end catch

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
	
	
</style>
<script type="text/javascript">
alert("${ pageScope.msg }");
location.href="${ pageScope.url }";
</script>
</head>
<body>
<div>

</div>
</body>
</html>