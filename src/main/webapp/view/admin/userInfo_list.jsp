<%@page import="java.sql.SQLException"%>
<%@page import="vo.UserInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminUserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 정보 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="asVO" class="vo.AdminSearchVO" scope="page"/>
<jsp:setProperty property="*" name="asVO"/>
<%
try{
	AdminUserInfoManagementDAO aduiDAO=AdminUserInfoManagementDAO.getInstance();
	//총 회원 수
	int totalCount=aduiDAO.selectTotalCount(asVO);
	//한 화면 게시물 수
	int pageScale=10;
	//총 페이지 수
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
	
	try {
	    List<UserInfoVO> list = aduiDAO.selectInfo(asVO);
	    pageContext.setAttribute("list", list);
	    pageContext.setAttribute("totalCount", totalCount);
	} catch (SQLException e) {
	    e.printStackTrace();
	    // SQLException 처리 코드 추가
	}
	
	pageContext.setAttribute("totalCount", totalCount);
	pageContext.setAttribute("pageScale", pageScale);
	pageContext.setAttribute("currentPage", currentPage);
	
	%>
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
		$("#btnSearch").click(function(){
			chkNull;
		});//click
		
		$("#btnAllSearch").click(function(){
			location.href="userInfo_list.jsp";
		});//click
		
		$("#keyword").keydown(function(evt){
			if(evt.which == 13 ){
				chkNull();
			}//end if
		});//keydown
	});//ready
	
	function chkNull(){
		console.log("chkNull 함수 호출됨");
		if($("#keyword").val().trim() !== ""){
			$("#frmBoard").submit();
		}//end if
	}//chkNull
	
	
</script>
</head>
<body>
<div id="wrap">
<div id ="left" style="float: left">
<jsp:include page ="design1.jsp"/>
</div>
<div class="flex-grow-1">
		<div>
			<form action="userInfo_list.jsp" name="frmBoard" id="frmBoard">
				<select name="field" id="field">
					<option value="0"${ param.field eq 0?"selected='selected'":"" }>아이디</option>
					<%-- <option value="1"${ param.field eq 1?"selected='selected'":"" }>이메일</option> --%>
				</select>
				<input type="text" name="keyword" id="keyword" value="${ param.keyword }" style="width: 230px"/>
				<input type="button" value="검색" id="btnSearch" class="btn btn-info btn-sm"/>
				<input type="button" value="전체글" id="btnAllSearch" class="btn btn-info btn-sm"/>
				<input type="text" style="display: none;"/>
			</form>
		</div>
		<div class="_payment-table-container_2hrxu_23"data-testid="paymnet-history-table-container">
			<table style="table-layout: fixed ;width: 80%" data-testid="table" class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
			aria-live="polite" aria-busy="false">
				<thead data-testid="tableHead" class=" _payment-table-head_8ouzs_8">
					<tr data-testid="payment-info-row-header"class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
					<th style="width: 5%" data-testid="payment-status-column-header"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
					class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
					data-testid="typography">번호</span></th>
					
					<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
					class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
					class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
					data-testid="typography">아이디</span></th>
					
					<th style="width: 10%"  data-testid="order-name-column-header"
					class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
					class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
					data-testid="typography">이메일</span></th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="uiVO" items="${ list }" varStatus="i">
					<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
					<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
				 data-testid="tag">
				 		<c:out value="${ totalCount -(currentPage-1)*pageScale- i.index }"/></span></td>
					
					<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
				 data-testid="tag"><a href="userInfo_detail.jsp?id=${ uiVO.id }&currentPage=${empty param.currentPage ?1:param.currentPage}">
				 		<c:out value="${ uiVO.id }"/></a></span></td>
					
					<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
				 data-testid="tag">
				 		<c:out value="${ uiVO.email }"/></span></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
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
	
	<%= AdminUserInfoManagementDAO.getInstance().pageNation("userInfo_list.jsp",param,
 			totalPage, currentPage)
 	%> 
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