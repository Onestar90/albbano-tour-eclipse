<%@page import="java.sql.SQLException"%>
<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<!-- <link rel="icon" href="http://127.0.0.1/jsp_prj/common/favicon.ico"/>
bootstrap 시작
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
bootstrap 끝
<link rel="stylesheet" href="http://127.0.0.1/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://127.0.0.1/jsp_prj/common/css/board.css" type="text/css" media="all" />

jQuery CDN 시작
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
jQuery CDN 끝 -->

<style type="text/css">
 #idWrap{ width: 468px; height: 330px; margin:0px auto}
 /* #background{ width: 464px; height: 326px; background: #FFFFFF url(images/id_background.png) no-repeat;
 			position: relative; } */
 #inputWrap{ position: absolute;top:186px;left: 103px} 			
 #dupResult{ position: absolute;top:230px;left: 103px}
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("btn").addEventListener("click",idNullChk);
		document.getElementById("id").addEventListener("keydown",isEnter);
	}
	
	function isEnter( evt ){
		if(evt.which == 13){
			idNullChk();
		}//end if
	}//isEnter

	function idNullChk(){
		var obj=document.fregisterform;
		var id=obj.id.value;
		
		//if( id.trim() == ""){
		if( id.replace(/ /g,"") == ""){
			alert("중복확인할 아이디를 입력해주세요.");
			obj.id.value="";
			obj.id.focus();
			return;
		}//end if
		
		obj.submit();
	}//idNullChk

	function sendId( id ){
		//2. 현재창에 입력된 id를 얻어와서 부모창(opener)에 전달
		//opener.window.document.frm.id.value=document.subFrm.id.value;
		opener.window.document.getElementById("id").value=id;
		//3. 자식창을 닫는다.
		self.close();
	}
</script>
</head>
<body>
<%
	//웹 파라메터 받는다.
	String id=request.getParameter("id");
	boolean flag=false;
	
	if(id != null ){//parameter가 존재하면 
		//DB에서 id를 검색한다. 
		UserInfoManagementDAO uiDAO=UserInfoManagementDAO.getInstance();
		try{
			String returnId=uiDAO.selectId(id);
			flag=!"".equals(returnId); //아이디가 존재하면 true/ 그렇지 않으면 false
			pageContext.setAttribute("flag", flag);			
		}catch(SQLException se){
			se.printStackTrace();
		}
	}//end if
%>
<div id="idWrap">
	<div id="background">
	<div id="inputWrap">
	<form name="subFrm">
		<input type="text" name="id" id="id" value="${ param.id }" class="inputTxt inputIdtype" />
		<input type="text" style="display: none"/>
		<input type="button" value="중복검사" id="btn" class="btn btn-success btn-sm"/>
	</form>
	</div>
	<div id="dupResult">
	<c:if test="${ not empty param.id }">
		입력하신 [ <strong style="font-size: 25px"><c:out value="${ param.id }"/></strong> ] 는
		<c:choose>
			<c:when test="${ pageScope.flag }">
			사용 <strong style="color:#E53E30">불가능</strong> 합니다.
			</c:when>
			<c:otherwise>
			사용 <strong style="color:#2B7BED">가능</strong> 합니다. <a href="#void" onclick="sendId('${ param.id }')">사용</a>
			</c:otherwise>
		</c:choose>
	
	</c:if>		
	</div>
	
	</div>
</div>

</body>
</html>