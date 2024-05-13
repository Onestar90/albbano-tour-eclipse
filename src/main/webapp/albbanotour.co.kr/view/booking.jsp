<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-13
  Time: 오후 04:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.time.format.TextStyle"%>
<%@ page import="java.time.DayOfWeek"%>
<%@ page import="dao.TourDAO" %>
<%@ page import="vo.CourseManagementVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TourDAO tourDAO = TourDAO.getInstance();
    List<CourseManagementVO> tourList = new ArrayList<>();
    tourList = tourDAO.selectAllTourList();
    pageContext.setAttribute("tourList", tourList);
    
    LocalDate currentDate = LocalDate.now();
    int currentYear = currentDate.getYear();
    int currentMonth = currentDate.getMonthValue();
    int today = currentDate.getDayOfMonth();
    DayOfWeek week = currentDate.getDayOfWeek();
    
    pageContext.setAttribute("currentYear", currentYear);
    pageContext.setAttribute("currentMonth", currentMonth);
    pageContext.setAttribute("today", today);
    pageContext.setAttribute("week", week);
    
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>투어예약 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../index_user.jsp";
        var g5_bbs_url = "index_user.jsp";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "booking";
        var g5_sca = "";
        var g5_editor = "smarteditor2";
        var g5_cookie_domain = "";
    </script>
    
    <script>
    window.onload = function() {
        loadCalendar(<%= currentYear %>, <%= currentMonth %>, <%= today %>);
    };

    
    function loadCalendar(year, month, day) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("targetDiv").innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "calendar.jsp?year=" + year + "&month=" + month + "&day=" + day, true);
        xhttp.send();
    }
    
    function loadPreviousMonth() {
        var currentYearElement = document.getElementById('currentYear');
        var currentMonthElement = document.getElementById('currentMonth');
        
        var currentDate = new Date();
        var year = parseInt(currentYearElement.textContent);
        var month = parseInt(currentMonthElement.textContent);
        var day = 1;
        
        month--;
        
        if (month < 1) {
            month = 12;
            year--;
        }
        
        if (year === currentDate.getFullYear() && month === currentDate.getMonth() + 1) {
            day = currentDate.getDate();
        }
        
        if (year === currentDate.getFullYear() && month <= currentDate.getMonth()){
        	alert("안돼");
        	return;
        }
        
        loadCalendar(year, month, day);
        
        currentYearElement.textContent = year;
        currentMonthElement.textContent = (month < 10 ? '0' : '') + month;
    }


    function loadNextMonth() {
        var currentYearElement = document.getElementById('currentYear');
        var currentMonthElement = document.getElementById('currentMonth');
        
        var currentDate = new Date();
        var year = parseInt(currentYearElement.textContent);
        var month = parseInt(currentMonthElement.textContent);
        var day = 1;
        
        month++;
        
        if (month > 12) {
            month = 1;
            year++;
        }
        
        if (year === currentDate.getFullYear() && month === currentDate.getMonth() + 1) {
            day = currentDate.getDate();
        }
        
        loadCalendar(year, month, day);
        
        currentYearElement.textContent = year;
        currentMonthElement.textContent = (month < 10 ? '0' : '') + month;
    }
	</script>

    <%@include file="common_head.jsp" %>

    <script type="text/javascript" src="../js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="../js/common-booking.js"></script>
</head>

<body>

<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual02.jpg') no-repeat top center;">
        </div>
    </div>
</section>

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
                <ul class="">
                    <li>
                        <span>투어예약</span>
                        <ul>
                            <li><a href="list_spot.jsp" target="_self">관광지</a></li>
                            <li><a href="list_restaurant.jsp" target="_self">맛집</a></li>
                            <li><a href="booking.jsp" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>투어예약</span>
                        <ul>
                            <li><a href="tour_course.jsp" target="_self">투어코스</a></li>
                            <li><a href="booking.jsp" target="_self">투어예약</a></li>
                            <li><a href="list_reservation.jsp" target="_self">예약확인</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    
    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li></li>
            <li>투어예약</li>
        </div>
        <div class="title">투어예약</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">
        <div class="bg_vline"></div>
        <p class="eng"><em></em> 투어예약</p>
        <p class="stitle"></p>

        <script type="text/javascript"> var cp_code = ''; </script>

        <div class="wetoz">
            <div class="col-md-12">
                <div class="navi-wrap">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="booking.jsp">실시간예약</a></li>
                        <li role="presentation" class=""><a href="list_reservation.jsp">예약확인/취소</a></li>
                    </ul>
                    <p class="button-list"></p>
                </div>

                <div class="clearfix" style="height:10px;"></div>

                <div class="bx-reserv">
                    <table cellpadding=0 cellspacing=0 border=0 style="width:100%;">
                        <tbody>
                        <tr>
                            <td class="bxframe fm-room">
                                <div class="head">01. 투어선택 ◀◀코스를 선택하세요▶▶</div>
                                <div class="list">
                                    <c:forEach var="tour" items="${tourList}" varStatus="i">
   										<a href="#" href="#" onclick="loadCalendar(<c:out value='${currentYear}'/>, <c:out value='${currentMonth}'/>, <c:out value='${today}'/> )" class="roomli" data-rm-ix="${i.index}">
        									<div class="media-left">
            									<div class="room-photo-frame">
                									<img src="../front_util/images/tour_booking.png" class="room-photo-main">
            									</div>
        									</div>
        									<div class="media-body info">
            								<h4 class="media-heading" id="top-aligned-media">
          								      <c:out value="${tour.crsName}" />
         								    </h4>
      							      			<div class="desc"></div>
     							   			</div>
  							  			</a>
									</c:forEach>
                                </div>
                            </td>
                            
                            <td class="bxframe fm-day">
                                <div class="head">02. 날짜</div>
                                <div class="list">
                                    <div id="wrap-calendar" class="wrap-calendar">
                                        <nav>
											<ul class="pager">
											    <li>
											        <a href="#" onclick="loadPreviousMonth()">
											            <i class="fa fa-chevron-left" aria-hidden="true"></i>
											        </a>
											    </li>
											    <li>
											        <strong class="ym-title">
											            <span class="text-number" id="currentYear">${currentYear}</span>
											            <span class="text-hangul">.</span> 
											            <span class="text-number" id="currentMonth">${String.format("%02d", currentMonth)}</span>
											        </strong>
											    </li>
											    <li>
											        <a href="#" onclick="loadNextMonth()">
											            <i class="fa fa-chevron-right" aria-hidden="true"></i>
											        </a>
											    </li>
											</ul>
                                        </nav>
										<div class="daylist hidden-xs hidden-sm" id="targetDiv"></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>

                <div class="clearfix" style="height:10px;"></div>

                <form method="post" name="wzfrm" id="wzfrm"
                      action=""
                      onsubmit="return getNext(document.forms.wzfrm);">
                    <input type="hidden" name="mode" id="mode" value="step2"/>
                    <input type="hidden" name="rm_ix" id="rm_ix" value=""/>
                    <input type="hidden" name="sch_day" id="sch_day" value=""/>

                    <div id="hidden-parms"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div id="room-select-list"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success" style="height: 80px;font-size: 24px" ;
                                        onclick="location.href='tour_pay.jsp'">다음단계 <i
                                        class="fa fa-chevron-right fa-sm"></i></button>
                            </div>
                        </div>
                    </div>

                </form>

                <div class="clearfix" style="height:15px;"></div>

                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item"><i class="fa fa-chevron-right fa-sm" aria-hidden="true"></i> 이용서비스
                            선택 후 날짜를 선택해주세요.
                        </li>
                        <li class="list-group-item"><i class="fa fa-chevron-right fa-sm" aria-hidden="true"></i> 예약 전
                            반드시 주의사항을 숙지하시기 바랍니다.
                        </li>
                    </ul>
                </div>

                <div class="clearfix" style="height:10px;"></div>
            </div>
        </div>
    </div>
</section>
<%--footer_jsp_적용_시작--%>
<footer>
    <%@ include file="common_footer.jsp" %>
</footer>
<%--footer_jsp_적용_끝--%>

<%@ include file="common_m_footer.jsp" %>
<%@ include file="common_sidebar.jsp" %>
<%@ include file="common_lower_container.jsp" %>
</body>
</html>
