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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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
<div id="wrap">
<div id ="left" style="float: left">
<jsp:include page ="design1.jsp"/>
</div>
<%
NoticeDAO ntDAO=NoticeDAO.getInstance();
List<NoticeVO> list= new ArrayList<NoticeVO>();
list=ntDAO.selectAll();
pageContext.setAttribute("list", list);
%>
<div class="_payment-table-container_2hrxu_23"
							data-testid="paymnet-history-table-container">
							<table style="table-layout: fixed ;width: 100%" data-testid="table"
								class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
								aria-live="polite" aria-busy="false">
<thead data-testid="tableHead"
									class=" _payment-table-head_8ouzs_8">
<tr data-testid="payment-info-row-header"class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
	<th style="width: 5%" data-testid="payment-status-column-header"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
		class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
		data-testid="typography">번호</span></th>
<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
										class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">제목</span></th>
<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">글쓴이</span></th>
<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">조회</span></th>
<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">날짜</span></th>
		</tr></thead>
<tbody data-testid="tableBody"class=" _payment-table-body_8ouzs_13">
	<c:forEach var="notice" items="${list}" varStatus="i">
<tr height="300px" data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--red_vwbjt_74 _fill--solid_vwbjt_38 "
											data-testid="tag"><c:out value="${notice.doc_No }"/></span></td>
		<td onclick="submitForm('${notice.doc_No}')" data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7"><span><c:out value="${notice.title }"/></span></td>
<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value="${notice.id }"/></span></td>
<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value="1523"/></span></td>
<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value="${notice.create_Date }"/></span></td>
		</tr>
	</c:forEach>
	</tbody>	
	</table>
</div>
<div><a href="insertNotice.jsp">공지사항 작성</a></div>
</body>
</html>