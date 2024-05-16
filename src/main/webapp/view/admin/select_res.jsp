<%@page import="java.util.List"%>
<%@page import="vo.ResListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RestaurantManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
List<ResListVO> list = new ArrayList<ResListVO>();
list = rDAO.selectAllRes();
pageContext.setAttribute("list", list);
rDAO.selectMaxRes();
%>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!--jQuery CDN 끝-->
<style type="text/css">
	#img{width: 150px;height: 150px}
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
	function submitFrm(res_code) {
		var form = document.createElement('form');
		form.method = 'POST';
		form.action = 'select_one_res.jsp';

		var input = document.createElement('input');
		input.type = 'hidden';
		input.name = 'res_code';
		input.value = res_code;

		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
		}
</script>
</head>
<body>
<div id="wrap">
<div id ="left" style="float: left">
<jsp:include page ="design1.jsp"/>
</div>
<div class="_payment-table-container_2hrxu_23"data-testid="paymnet-history-table-container">
	<table style="table-layout: fixed ;width: 100%" data-testid="table"class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
	aria-live="polite" aria-busy="false">
	<thead data-testid="tableHead" class=" _payment-table-head_8ouzs_8">
<tr data-testid="payment-info-row-header"class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
	<th style="width: 5%" data-testid="payment-status-column-header"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
		class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
		data-testid="typography">맛집 번호</span></th>
										<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">맛집 코드</span></th>
										<th style="width: 10%"  data-testid="order-name-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">맛집 상호명</span></th>
										<th style="width: 50%;"   data-testid="buyer-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">맛집 설명</span></th>
										<th style="width: 10% ; text-align: center;" data-testid="buyer-person-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">휴일</span></th>
										<th style="width: 7%" data-testid="cancel-payment-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-cancel-payment_1lui6_50 _column_1lui6_4">
											영업시간</th>
										<th style="width: 7%" data-testid="cancel-payment-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-cancel-payment_1lui6_50 _column_1lui6_4">
											위치</th>
										<th style="width: 7%" data-testid="cancel-payment-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-cancel-payment_1lui6_50 _column_1lui6_4">
											이미지</th>
									</tr></thead>

<tbody>
<c:forEach var ="res" items="${ list }" varStatus="i">
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ i.count }"/></span></td>
<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ res.res_code }"/></span></td>
<td onclick="submitFrm('${res.res_code}')" data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ res.res_name }"/></span></td>
<td style="text-align: left" data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ res.intro }"/></span></td>
<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ res.holiday }"/></span></td>
<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ res.busi_hour }"/></span></td>
<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<c:out value="${ res.res_loc }"/></span></td>
<td data-testid="payment-status-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
	 data-testid="tag">
	<img src="http://127.0.0.1/upload/${ res.img_name }" width="150px" height="150px"/></span></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div>
<a href ="insert_res.jsp">맛집추가</a>

</div>
</body>
</html>