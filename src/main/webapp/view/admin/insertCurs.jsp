<%@page import="vo.SpotListVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info="코스 추가"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
CourseManagementDAO cmDAO = CourseManagementDAO.getInstance();
List<SpotListVO> list = cmDAO.selectAllSpotNames();
pageContext.setAttribute("list", list);
%>
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
	
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
	var rowCount = 0; // 추가된 행의 개수를 추적하기 위한 변수

    function addSpotToList(spotCode) {
        var isDuplicate = false;

        $(".spotList td").each(function() {
            if ($(this).text() === spotCode) {
                isDuplicate = true;
                return false; // 중복이 발견되면 강제 반복 종료
            }});
        if (isDuplicate) {
            alert("중복된 값이 이미 추가되었습니다.");
            return;
        }
        var currentRowCount = $(".spotList tr").length;

        var maxRowCount = 5;

        if (currentRowCount >= maxRowCount) {
            alert("최대 5개까지만 추가할 수 있습니다.");
            return;
        }

        var newRow = $("<tr>").attr("id", "row_" + rowCount).append($("<td>").text(spotCode));
        $(".spotList").append(newRow);

        rowCount++;
    }
	
    function resetTable() {
        $(".spotList tr").remove();
        rowCount = 0;
    }
    
    function sendToProcessPage() {
        var form = document.createElement("form");
        
        form.setAttribute("method", "post");
        form.setAttribute("action", "insertCurs_process.jsp");
        form.setAttribute("enctype", "multipart/form-data");
        
        var file = $("#imgName").val();
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

        
        addInputToForm(form, "crsCode", $("input[name='crsCode']").val());
        addInputToForm(form, "crsName", $("input[name='crsName']").val());
        addInputToForm(form, "crsDesc", $("input[name='crsDesc']").val());
        addInputToForm(form, "fare", $("input[name='fare']").val());
        addInputToForm1(form, "imgName", $("input[id='imgName']").val());
        var spotValues = [];
        $(".spotList td").each(function() {
            spotValues.push($(this).text());
        });
        addInputToForm(form, "spotValues", spotValues.join(","));
        
        document.body.appendChild(form);
        var currentRowCount = $(".spotList tr").length;

        var maxRowCount = 5;
        var flag =false;
        if(currentRowCount!=maxRowCount){
       	 flag = true;
       	 alert("관광지의 개수는 5개가 모두 선택되어야 합니다.")
       	 return;
        }
        
        form.submit();
    }
    function addInputToForm(form, name, value) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", name);
        input.setAttribute("value", value);
        form.appendChild(input);
    }
    function addInputToForm1(form, id, value) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("id", id);
        input.setAttribute("value", value);
        form.appendChild(input);
    }
</script>
</head>
<body>
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
		data-testid="typography">코스 추가</span></th></tr></thead>
<tbody>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>코스 코드 : <input type="text" name ="crsCode"/></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>코스 이름 : <input type="text" name ="crsName"/></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>코스 설명 : <input type="text" name ="crsDesc" maxlength="333"/></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>코스 요금 : <input type="text" name ="fare"/></span></div></td></tr>
<tr  data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>코스 관광지 : 
        <select id="spotSelect" name="crsSpots"> 
            <c:forEach var="spt" items="${list}">
                <option value="${spt.spot_code}">${spt.spot_name}</option>
            </c:forEach>
        </select>
        <input type="button" value="추가" onclick="addSpotToList($('#spotSelect').val())"/></span></div></td></tr>
</tbody>
</table>
</div>
<div>
선택 된 관광지 리스트
<table class="spotList">
</table>
<input type ="button" onclick="resetTable()" value ="테이블 리셋"/>
</div>
<div>
<input type="button" onclick="sendToProcessPage()" value="값 전송">
</div>
</div>
</form>
<a href ="select_curs.jsp">코스 리스트</a>
</body>
</html>