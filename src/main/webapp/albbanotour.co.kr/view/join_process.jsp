<%@page import="java.sql.SQLException"%>
<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입 폼에서 입력된 값을 받는 jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.223/jsp_prj/common/favicon.ico"/>
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
<script type="text/javascript">
	function goToMainPage() {
	    window.location.href = 'index_user.jsp'; 
	}
</script>
</head>
<body>
<div>
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="uiVO" class="vo.UserInfoVO" scope="page"/>
<jsp:setProperty property="*" name="uiVO"/>

${ uiVO }
<c:catch var="e"> 
<%
//입력값 전처리
uiVO.setEmail( uiVO.getEmail1()+"@"+uiVO.getEmail2());

/* uiVO.setIp(request.getRemoteAddr());
uiVO.setPass(DataEncrypt.messageDigest("MD5", uiVO.getPass())); */

//db 추가
UserInfoManagementDAO uiDAO = UserInfoManagementDAO.getInstance();
try{
	if(!"".equals(uiDAO.selectId(uiVO.getId()))){
%>
	입력하신 아이디는 이미 사용 중 입니다.<br/>
	다른 아이디로 재가입 해주세요.<br>
	<a href="#void" onclick="history.back()">뒤로</a>
<%
	}else{
	uiDAO.insertMember(uiVO);
	uiDAO.insertPassword(uiVO.getId(), uiVO);
}
}catch(SQLException se){
	se.printStackTrace();
}
%>
<div id="success">
	<div id="result">
		<h2>회원가입해주셔서 감사합니다.</h2>
		<strong>${ param.name }</strong>님의 회원가입을 축하드립니다.<br>
		입력하신 정보는 아래와 같습니다.<br/>
		<ul>
			<li><strong>아이디 : </strong><c:out value="${ param.id }"/></li>
			<li><strong>이메일 : </strong><c:out value="${ param.email1 }@${param.email2 }"/></li> 
			<li><strong>전화번호 : </strong><c:out value="${ param.tel }"/></li>
		</ul>
		
	</div>
	<div style="text-align: center; margin-top: 20px;">
    <button onclick="goToMainPage()" class="btn btn-primary">메인화면으로 이동</button>
</div>
</div>

</c:catch>
<c:if test="${ not empty e }">
${ e }
죄송합니다. 잠시 후 다시 시도해주세요.<br/>
<a href="user_index.jsp">메인으로</a>

<a href="#void" onclick="history.back()">뒤로</a>
</c:if>

</div>
</body>
</html>