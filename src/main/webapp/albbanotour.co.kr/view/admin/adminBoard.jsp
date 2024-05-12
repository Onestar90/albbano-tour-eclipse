<%@page import="java.util.List"%>
<%@page import="dao.AdminDashboardDAO"%>
<%@page import="vo.ChartVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script>
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);
    </script>

    <title>Admin Dashboard</title>
</head>
<body>
    <div id="Line_Controls_Chart">
        <!-- 라인 차트 생성할 영역 -->
        <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
        <!-- 컨트롤바를 생성할 영역 -->
        <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
    </div>

    <h1>Admin Dashboard</h1>

    <div id="chart_div" style="width: 900px; height: 500px;"></div>

    <% 
        AdminDashboardDAO dao = AdminDashboardDAO.getInstance();
        List<ChartVO> chartList = dao.selectChart(); 

        dao.selectTotalmembercnt();
        int totalMemberCount = dao.getTotalMemberCount();

        dao.selectTotalspotcnt();
        int totalSpotCount = dao.getTotalSpotCount();

        dao.selectTotalspotreviewcnt();
        int totalSpotreviewCount = dao.getTotalSpotreviewCount();

        dao.selectTotalinquirycnt();
        int totalInquiryCount = dao.getTotalInquiryCount();

        dao.selectTodaymemvercnt();
        int totalTodayMemberCount = dao.getTotalTodayMemberCount();

        dao.selectTotalRescnt();
        int totalResCount = dao.getTotalResCount();

        dao.selectResreviewcnt();
        int totalResreviewCount = dao.getTotalResreviewCount();

        dao.selectReservationcnt();
        int totalReservationCount = dao.getTotalReservationCount();
    %>

    <!-- 여기서부터 원하는 대시보드를 출력하세요 -->
    <p>총 회원수: <%= totalMemberCount %></p>
    <p>관람지 수: <%= totalSpotCount %></p>
    <p>관광지 리뷰수: <%= totalSpotreviewCount %></p>
    <p>답변 예정 문의수: <%= totalInquiryCount %></p>
    <p>오늘의 가입자수: <%= totalTodayMemberCount %></p>
    <p>총 맛집수: <%= totalResCount %></p>
    <p>맛집리뷰 수: <%= totalResreviewCount %></p>
    <p>예약승인 대기 수: <%= totalReservationCount %></p>
</body>
<script>
    // Google Charts 로드 및 그리기
    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', 'Person');

        <%-- 차트 데이터를 반복하여 행으로 추가 --%>
        <% for (ChartVO chart : chartList) { %>
            var chartDate = new Date('<%= chart.getTOUR_DATE() %>');
            var adjustedDate = new Date(chartDate.getFullYear(), chartDate.getMonth(), chartDate.getDate()); // 시간 정보를 제거하여 일단위로 표시
            data.addRow([adjustedDate, <%= chart.getPERSON() %>]);
        <% } %>

        var options = {
            title: 'Tour Date vs Person',
            curveType: 'function',
            legend: {position: 'bottom'}
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>
</html>