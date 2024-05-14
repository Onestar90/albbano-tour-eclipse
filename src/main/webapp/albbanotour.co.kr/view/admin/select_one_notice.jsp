<%@page import="vo.NoticeVO"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.225/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://192.168.10.225/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.225/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	textarea{width: 600px; height: 300px; }
</style>
<script type="text/javascript">
	function submitForm(doc_No){
		var form= document.createElement('form');
		form.method='POST';
		form.action='updateNotice.jsp';
		
		var input=document.createElement('input');
		input.type='hidden';
		input.name='doc_No';
		input.value=doc_No;
		
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	}
	
	function submitDelete(doc_No){
		var form=document.createElement('form');
		form.method='POST';
		form.action="deleteNotice.jsp";
		
		var input= document.createElement('input');
		input.type='hidden';
		input.name='doc_No';
		input.value=doc_No;
		
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
		
	}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String docno= request.getParameter("doc_No");
NoticeDAO ntDAO= NoticeDAO.getInstance();
NoticeVO ntVO=ntDAO.selectOne(docno);
pageContext.setAttribute("ntVO", ntVO );
%>
<form>
<div>
<table>
<thead>
<tr>
	<th style="width:100px">번호</th>
	<th style="width:100px">제목</th>
	<th style="width:100px">내용</th>
	<th style="width:100px">이미지이름</th>
	<th style="width:100px">작성자</th>
	<th style="width:100px">작성일</th>
</tr>
</thead>
</tbody>
<tr>
	<td>${ntVO.doc_No }</td>
	<td>${ntVO.title }</td>
	<td>${ntVO.doc_Cont }</td>
	<td>${ntVO.img_Name }</td>
	<td>${ntVO.id }</td>
	<td>${ntVO.create_Date }</td>	
</tr>
</table>
</div>
</form>
<input type="button" value="수정" onclick="submitForm('${ntVO.doc_No}')"/>
<input type ="button" value ="삭제" onclick="submitDelete('${ntVO.doc_No}')"/>
<input type ="button" value ="목록" onclick="history.back()"/>
</body>
</html>