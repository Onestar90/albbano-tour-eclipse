<%@page import="java.util.List"%>
<%@page import="vo.SpotListVO"%>
<%@page import="vo.CourseManagementVO"%>
<%@page import="dao.CourseManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.221/jsp_prj/common/favicon.ico" type="image/x-icon">
<!--부트스트랩 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--부트스트랩 끝-->
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/board.css" type="text/css" media="all" />
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!--jQuery CDN 끝-->
<style type="text/css">
	
	/* 코스 수정&삭제에서 폼으로 action값넣기 다르게 하는거 헷갈리고았는중임 ㅅㅂ.... */
</style>
<script type ="text/javascript">
$(function(){
});//ready
function submitModifyForm(crsCode) {
		
	
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
		}
function submitDeleteForm(crsCode) {

	
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
		}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String crsCode= (String)request.getParameter("crsCode");
CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
CourseManagementVO cVO= cDAO.selectCourseDetail(crsCode);
String spots = cDAO.selectAdminDetailSpot(crsCode);
pageContext.setAttribute("cVO", cVO);
pageContext.setAttribute("spots", spots);

%>
<div>
<h3>투어코스 상세</h3>
</div>
<div>
<form method="post" action="modify_curs.jsp?crsCode=${ cVO.crsCode }">
<table>
<thead>
<tr>
<th>코스코드</th>
<th>투어이름</th>
<th>투어설명</th>
<th>이미지 이름</th>
<th>운임</th>
<th>해당 코스 관광지</th>
</tr>
</thead>
<tbody>
<tr>
<td>${ cVO.crsCode}</td>
<td>${ cVO.crsName}</td>
<td>${ cVO.crsDesc}</td>
<td>${ cVO.imgName}</td>
<td>${ cVO.fare}원</td>
<td>${ spots}</td>
</tr>
</tbody>
</table>
<input type="submit" value="코스 수정" id="btn" onclick="submitModifyForm('${cVO.crsCode}')"/>
<input type="submit" value="코스 삭제" id="btn" onclick="submitDeleteForm('${cVO.crsCode}')"/>
</form>
</div>
</body>
</html>