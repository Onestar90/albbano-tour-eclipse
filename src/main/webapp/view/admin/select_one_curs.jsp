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
<title>코스 상세</title>
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
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'modify_curs.jsp';
	
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'crsCode';
	input.value = crsCode;

		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
		}
function submitDeleteForm(crsCode) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'delete_curs.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'crsCode';
	input.value = crsCode;

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
<form>
<div id="wrap">
<div id ="left" style="float: left">
<jsp:include page ="design1.jsp"/>
</div>
<div style="margin-top: 100px; padding: 50px" class="_payment-table-container_2hrxu_23"data-testid="paymnet-history-table-container">
	<table  style="table-layout: fixed ;width: 100%" data-testid="table"class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
								aria-live="polite" aria-busy="false">
<thead data-testid="tableHead"class=" _payment-table-head_8ouzs_8">
<tr data-testid="payment-info-row-header"class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
<th style="width: 80%;" data-testid="payment-status-column-header"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
		class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
		data-testid="typography">코스 상세</span></th>
</tr>
</thead>
<tbody>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span> 투어코드 :${ cVO.crsCode}</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td  style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>투어이름 : ${ cVO.crsName}</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td  style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>투어설명 : ${ cVO.crsDesc}</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td  style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>운임 : ${ cVO.fare}원</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td  style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>해당 코스 관광지 : ${ spots}</span></div></td></tr>
</tbody>
</table>
</div>
</div>
</form>
<input type="submit" value="코스 수정" onclick="submitModifyForm('${cVO.crsCode}')"/>
<input type="submit" value="코스 삭제" onclick="submitDeleteForm('${cVO.crsCode}')"/>
</body>
</html>