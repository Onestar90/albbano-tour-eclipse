<%@page import="vo.ResListVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.RestaurantManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
List<ResListVO> list = rDAO.resCat();
String res_code =rDAO.selectMaxRes();
pageContext.setAttribute("list", list);
pageContext.setAttribute("res_code", res_code);
%>
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
	.left{width: 80px;}
	
</style>
<script type ="text/javascript">
	$(function(){
		$("#btn").click(function(){
		var file = $("#img_name").val();
		var selectedExt = file.substring(file.lastIndexOf(".")+1);

		var extArr = ["png", "jpg", "gif", "jpeg", "bmp"];
		var flag = false;

		for(var i = 0; i < extArr.length; i++) {
		if(selectedExt == extArr[i]) {
		flag = true;
		break;
		} // end if
		} // end for

		if(!flag) {
		alert(selectedExt + "는 업로드 가능한 파일의 확장자가 아닙니다.");
		return;
		} // end if

		$("#frm").submit();
		
	})
	});//ready
</script>
</head>
<body>
<form action="insert_res_process.jsp" id ="frm" method="post" enctype="multipart/form-data" >
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
		data-testid="typography">맛집 추가</th></span></th></tr></thead>
<tbody>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>맛집 코드 :<input type ="text" name ="res_code" value="${ res_code }" readonly="readonly"/></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>맛집 카테고리 : <select name ="res_cat" >
<c:forEach var="cat" items="${ list }">
<option value="${ cat.res_cat }">${ cat.res_cat }</option>
</c:forEach></select></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>맛집명 :<input type ="text" name ="res_name" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>맛집소개 :<input type ="text" name ="intro" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>휴일 :<input type ="text" name ="holiday" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>영업시간 :<input type ="text" name ="busi_hour" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>맛집 위치 :<input type ="text" name ="res_loc" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>위도 :<input type ="text" name ="latitude" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>경도 :<input type ="text" name ="longitude" /></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>이미지 :<input type ="file" name ="img_name" id ="img_name"/></span></div></td></tr>
</tbody>
</table>
<input type="button" value="맛집 추가" id ="btn"/>
</div>
</div>
</form>
</body>
</html>