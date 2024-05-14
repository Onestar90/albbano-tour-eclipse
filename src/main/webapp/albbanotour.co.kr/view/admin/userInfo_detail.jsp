<%@page import="java.sql.SQLException"%>
<%@page import="vo.UserInfoVO"%>
<%@page import="dao.AdminUserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	$(function(){
		$("#btnList").click(function(){
			history.back(); 
			
		});
		
		$("#btnDelete").click(function(){
			if(confirm("해당 회원을 정말 삭제하시겠습니까?")){
				//<fotm태그의 action 변경
				//var frm=document.frmDetail.action="백엔드 url"
				$("#frmDetail")[0].action="userInfo_delete_process.jsp";
			
				$("#frmDetail").submit();
			}//end if
		});
		
	});//ready
</script>
</head>
<body>
<div id="wrap">
	<div id="header"></div>
	<div id="boardContent">
	<%
		AdminUserInfoManagementDAO aduiDAO = AdminUserInfoManagementDAO.getInstance();
	try{
		String userId=request.getParameter("id");
		
		UserInfoVO uiVO = aduiDAO.selectDetailBoard(userId);
		
		pageContext.setAttribute("uiVO", uiVO);
	}catch(NumberFormatException nfe){
	%>
	<c:redirect url="userInfo_list.jsp"/>
	<%	
	}catch(SQLException se){
		se.printStackTrace();
	%>
	<% }//end catch %>
	
	<form method="post" name="frmDetail" id="frmDetail"> 
	<input type="hidden" name="id" value="${uiVO.id }"/>
	<input type="hidden" name="currentPage" value="${param.currentPage }"/>
		<table>
			<tr>
				<td colspan="2"><h3>회원 정보</h3>
			</tr>	
			<tr>
				<td>이름</td>
				<td>
				<c:out value="${uiVO.name }"/>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
				<c:out value="${uiVO.id }"/>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
				<c:out value="${uiVO.email }"/>
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>
				<c:out value="${uiVO.tel }"/>
				</td>
			</tr>
			<tr>
				<td>삭제여부</td>
				<td>
				<c:out value="${uiVO.del_yn }"/>
				</td>
			</tr>
			
			<tr>
			<td colspan="2" >
			<%-- <c:if test="${ uiVO.id eq sessionScope.loginData.id }"> --%>
				<input type="button" value="회원삭제" class="" id="btnDelete"/>
			<%-- </c:if> --%>
				<input type="button" value="회원목록" class="" id="btnList"/>
			</tr>
			
		</table>
	</form>
	</div>

</div>
</body>
</html>