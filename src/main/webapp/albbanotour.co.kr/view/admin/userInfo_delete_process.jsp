<%@page import="java.sql.SQLException"%>
<%@page import="dao.AdminUserInfoManagementDAO"%>
<%@page import="vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${ empty sessionScope.loginData }">
	<c:redirect url="a_login.jsp"/>
</c:if>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://192.168.10.223/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.223/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	
	
</style>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="uiVO" class="vo.UserInfoVO" scope="page"/>
<jsp:setProperty property="*" name="uiVO"/>
<script type="text/javascript">
	
	<%
	try{
	/* uiVO.setId(((LoginVO)session.getAttribute("loginData")).getId()); */
		
	AdminUserInfoManagementDAO auiDAO=AdminUserInfoManagementDAO.getInstance();
	int cnt = auiDAO.deletePass(uiVO);
	int cnt1 = auiDAO.deleteMember(uiVO);
	if(cnt==1 && cnt1==1){
	%>
	alert("회원을 삭제하였습니다.");
	location.href="http://192.168.10.223/albbano-tour-eclipse/albbanotour.co.kr/view/admin/userInfo_list.jsp?currentPage=${ param.currentPage }";
	<%
	}else{
		%>
	alert("글 삭제를 실패하였습니다.");
	history.back();
	<%
	}//end else
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
	
	%>
	
	
</script>
</head>
<body>
<div>

</div>
</body>
</html>