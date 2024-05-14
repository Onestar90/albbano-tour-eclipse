<%@page import="java.util.ArrayList"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
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
	
</style>
<script type="text/javascript">
	function submitForm(doc_No){
		var form= document.createElement('form');
		form.method='POST';
		form.action='select_one_notice.jsp';
		
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
<div>
<%
NoticeDAO ntDAO=NoticeDAO.getInstance();
List<NoticeVO> list= new ArrayList<NoticeVO>();
list=ntDAO.selectAll();
pageContext.setAttribute("list", list);
%>
	<table>
	<thead>
		<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>조회</th>
		<th>날짜</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="notice" items="${list}" varStatus="i">
		<tr>
		<td><c:out value="${notice.doc_No }"/></td>
		<td onclick="submitForm('${notice.doc_No}')"><c:out value="${notice.title }"/></td>
		<td><c:out value="${notice.id }"/></td>
		<td><c:out value="1523"/></td>
		<td><c:out value="${notice.create_Date }"/></td>
		</tr>
	</c:forEach>
	</tbody>	
	</table>
</div>
<div><a href="insertNotice.jsp">공지사항 작성</a></div>
</body>
</html>