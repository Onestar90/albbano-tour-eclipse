<%@page import="java.sql.SQLException"%>
<%@page import="vo.UserInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminUserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 정보 리스트"%>
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
	#wrap{ width: 1462px; height:749px; margin:0px auto; }
	#header{ height:100px; 
	.num{width: 80px}
	.title{width: }
	.id{width: }
	.date{width: }
	.cnt{width: }
	
</style>
<script type="text/javascript">
	$(function(){
		$("#btnSearch").click(function(){
			chkNull;
		});//click
		
		$("#btnAllSearch").click(function(){
			location.href="a_userInfo_list.jsp";
		});//click
		
		$("#keyword").keydown(function(evt){
			if(evt.which == 13 ){
				chkNull();
			}//end if
		});//keydown
	});//ready
	
	function chkNull(){
		if($("#keyword").val().trim() != ""){
			$("#frmBoard").submit();
		}//end if
	}//chkNull
	
	
</script>
</head>
<body>
<div id="wrap">
<div id="header"></div>
<div id="content">
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="asVO" class="vo.AdminSearchVO" scope="page"/>
<jsp:setProperty property="*" name="asVO"/>

<%
try{
	AdminUserInfoManagementDAO aduiDAO=AdminUserInfoManagementDAO.getInstance();
	int totalCount=aduiDAO.selectTotalCount(asVO);
	int pageScale=10;
	int totalPage=(int)Math.ceil((double)totalCount / pageScale);
	
	String tempPage=asVO.getCurrentPage();
	int currentPage=1;
	if(tempPage != null){
		try{
		currentPage=Integer.parseInt(tempPage);
		}catch(NumberFormatException nfe){
		}
	}//end if
	int startNum = currentPage * pageScale - pageScale+1;
	
	//5. 끝번호
	int endNum = startNum + pageScale - 1;
	
	asVO.setStartNum(startNum);	
	asVO.setEndNum(endNum);
	
	List<UserInfoVO> list = aduiDAO.selectInfo(asVO);//시작번호와 끝번호 사이의 글 조회
	pageContext.setAttribute("list", list);
	
	%>
	<%-- 총 레코드의 수: <%= totalCount %>건<br/>
	한 화면에 보여줄 게시물 수: <%= pageScale %>건<br/>
	총 페이지 수: <%= totalPage %>장<br/>
	클릭한 페이지: <%= tempPage %>/<%= currentPage %>번<br/>  
	시작 번호: <%= startNum %>번<br/>  
	끝 번호: <%= endNum %>번<br/>  --%> 
	
	<div></div>
	<div>
	<% for(int i=1 ; i <= totalPage ;i++){ %>
	[<a href="a_userInfo_list.jsp?currentPage=<%= i %>"><%= i %></a>]
	<%}//end for %>
	</div>
	
	<div>
	<table class="table">
		<thead>
		<tr>
		<th class="num">번호</th>
		<th class="id">아이디</th>
		<th class="email">이메일</th>
		<th class="date">가입일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="uiVO" items="${ list }" varStatus="i">
		<tr>
		<td><c:out value="${ i.index+1 }"/></td>
		<td><c:out value="${ uiVO.id }"/></td>
		<td><c:out value="${ uiVO.email }"/></td>
		<td><c:out value="${ uiVO.create_date }"/></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div>
	<form action="a_userInfo_list.jsp" name="frmBoard" id="frmBoard">
		<select name="field" id="field">
			<option value="0"${ param.field eq 0?"selected='selected'":"" }>아이디</option>
			<option value="1"${ param.field eq 1?"selected='selected'":"" }>이메일</option>
		</select>
		<input type="text" name="keyword" id="keyword" value="${ param.keyword }" style="width: 230px"/>
		<input type="button" name="검색" id="btnSearch"/>
		<input type="button" name="전체글" id="btnAllSearch"/>
		<input type="text" style="display: none;"/>
	</form>
	</div>
	
	<div style="text-align: center;"> 
	<%
	String param="";
	%>
	<c:if test="${ not empty param.keyword }">
	<%
		param="&field="+request.getParameter("field")+"&keyword="
			+request.getParameter("keyword");
	%>
	<c:set var="link2" value="&field=${ param.field }&keyword=${param.keyword }"/>
	</c:if>
	<%-- <% for(int i=1 ; i <= totalPage ;i++){ %>
	[ <a href="board_list.jsp?currentPage=<%= i %>${link2}"><%= i %></a> ]
	<% }//end for %> --%>  
	
	<!-- ////////////////////////////////여기서 부터 수정 -->
	<%-- <%= BoardUtil.getInstance().pageNation("board_list.jsp",param,
 			totalPage, currentPage)

 	%> --%>
	
	
	<%-- <br/>
	시작번호 <%= startPage %> 
	마지막번호 <%= endPage %> 
	
	<%= prevMark %>...<%= pageLink %>...<%= endMark %> --%>
	</div>
	
<%
}catch(SQLException se){
	se.printStackTrace();
	out.println("죄송! 잠시후 다시 시도");
}
%>

</div>


</body>
</html>