<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.NoticeDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="게시판 글 읽기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.225/jsp_prj/common/favicon.ico" />
<!--bootstrap 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet"
	href="http://192.168.10.225/jsp_prj/common/css/main.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="http://192.168.10.225/jsp_prj/common/css/board.css"
	type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- summer note 시작 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- summer note 끝 -->

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		
	});//ready
		
	</script>

<script>
$(function(){
      $('#content').summernote({
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
<%
request.setCharacterEncoding("UTF-8");
String docno=request.getParameter("doc_No");
NoticeDAO ntDAO=NoticeDAO.getInstance();
NoticeVO ntVO= ntDAO.selectOne(docno);
pageContext.setAttribute("ntVO", ntVO);
%>

</head>
<body>
	<div id="wrap">
		<div id="header"></div>
		<div id="boardContent">
	
		<form method="post" name="frmDetail" id="frmDetail"> <!-- 썸머노트는 post만  -->
		<input type="hidden" name="docno" value="${ntVO.doc_No }"/>
		<input type="hidden" name="currentPage" value="${param.currentPage }"/>
			<table>
				<tr>
					<td colspan="2"><h3>글읽기</h3></td>
				</tr>	
				<tr>
					<td>제목</td>
					<td>
					<input type="text" name="title" id="title" style="width:600px" value="${ntVO.title }"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
					<textarea id="content" name="content">${ntVO.content }</textarea>
					</td>
				</tr>
				<%-- <tr>
					<td>조회수</td>
					<td>
					<input type="text" name="cnt" id="cnt" value="${bVO.cnt }" style="width:600px"/>
					</td>
				</tr> --%>
				<tr>
					<td>작성일</td>
					<td><strong><fmt:formatDate value="${ntVO.create_Date }" pattern="yyyy-MM-dd EEEE HH:mm:ss"/></strong></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><strong><c:out value="${ntVO.id }"/></strong></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
					<input type="submit" value="수정" class="btn btn-info btn-sm" />
					<c:if test="${ ntVO.id eq sessionScope.loginData.id }"> <!-- 내가 쓴 글만 삭제  -->
					<input type="button" value="삭제" class="btn btn-warning btn-sm" />
					</c:if>
					<input type="button" value="취소" class="btn btn-light btn-sm" />
					
					</td>
				</tr>
			</table>
			
			
		</form>
		</div>
	</div>
</body>
</html>