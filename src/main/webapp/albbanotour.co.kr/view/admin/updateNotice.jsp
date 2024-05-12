<%@page import="java.sql.SQLException"%>
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
	
</style>
<!-- parameter 받기 -->
<%-- <jsp:useBean id="ntVO" class="vo.NoticeVO" scope="page"/>
<jsp:setProperty property="*" name="ntVO"/> --%>

<script type="text/javascript">
$(function(){
      $('#content').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        width:600,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
});//ready
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); 
String docno= request.getParameter("doc_No");
NoticeDAO ntDAO= NoticeDAO.getInstance();
NoticeVO ntVO= ntDAO.selectOne(docno);
pageContext.setAttribute("ntVO", ntVO);
%>
<form action="updateNotice_process.jsp" method="post">
<div>
	<table>
	<thead>
	<tr>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>조회수</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><input type="text" name="title" value="${ntVO.title }"/></td>
		<td><input type="text" name="content" value="${ntVO.doc_Cont }"/></td>
		<td><input type="text" name="id" value="${ntVO.id}"/></td>
		<td><input type="text" name="cnt" value="1525"/></td>
	</tr>
	</tbody>
	</table>
</div>
<input type="submit" value="공지사항 수정"/>
</form>
</body>
</html>