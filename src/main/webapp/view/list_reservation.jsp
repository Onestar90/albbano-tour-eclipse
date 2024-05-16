<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 02:32
To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.TourReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.TourReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String login_id = (String)session.getAttribute("idKey");
	if(login_id == null){ %>
	
	<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login.jsp";
	</script>
	<% }%>

<%
	TourReservationDAO trDAO = TourReservationDAO.getInstance();
	
	List<TourReservationVO> list = new ArrayList<TourReservationVO>();
	list = trDAO.selectTourReservationList(login_id);
	pageContext.setAttribute("list", list);
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>

    <title>예약내역조회 | 알빠노관광</title>

    <script type="text/javascript"
            src="http://127.0.0.1/front_util/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="http://127.0.0.1/front_util/js/common.js"></script>
   
   
    <%@ include file="common_head.jsp" %>
    

</head>

<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual02.jpg') no-repeat top center;"></div>
    </div>
</section>

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
                </div>
                <ul class="">
                    <li>
                        <span> 예약확인</span>
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
                        <span> 예약확인</span>
                        <ul>
                            <li><a href="tour_course.html" target="_self">투어코스</a></li>
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
            <li> 예약확인</li>
        </div>
        <div class="title"> 예약확인</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">

        <div class="bg_vline"></div>
        <p class="eng"><em></em> 예약확인</p>
        <p class="stitle"></p>

        <script type="text/javascript"> var cp_code = ''; </script>

        <div class="wetoz">

            <div class="col-md-12">


                <div class="navi-wrap">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class=""><a
                                href="booking.jsp">예약</a></li>
                        <li role="presentation" class="active"><a
                                href="list_reservation.jsp">예약확인/취소</a>
                        </li>
                    </ul>
                    <p class="button-list">
                    </p>
                </div>

                <div class="clearfix" style="height:10px;"></div>
                <div class="panel panel-default">

                    <div class="panel-heading"><strong><i class="fa fa-hotel fa-lg"></i> 예약목록</strong></div>
                    <div class="table-responsive">
                        <table class="table form-group form-group-sm table-bordered font-color-gray">
                            <thead>
                            <tr>
                                <th scope="col">예약번호</th>
                                <th scope="col">예약자ID</th>
                                <th scope="col">예약날자</th>                             
                                <th scope="col">이용요금</th>
                                <th scope="col">예약상태</th>
                           
                            </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty list }">
                                <td colspan="7" style="text-align:center">
                                    예약내역이 존재하지 않습니다.
                                </td>                          
                                </c:if>
                                
                                <c:if test="${not empty list }">

                           		<c:forEach var="item" items="${list}" varStatus="i">
                           		<tr>
								        <td><c:out value="${item.resv_code}"/></td>
								        <td><%=login_id %></td>
								        <td><c:out value="${item.create_date}"/></td>
								        <td><c:out value="${item.fare}"/>원</td>
								        <td><c:out value="${item.resv_flag}"/></td>
								        </tr>
								</c:forEach>
                                </c:if>
                            
                            
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading"><strong><i class="fa fa-file-text-o fa-lg"></i> 이용규정안내</strong></div>
                    <div class="panel-body">

                        <div class="bs-callout bs-callout-info">
                            <h4>기본예약안내</h4>
                            <p style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; border: 0px; vertical-align: baseline;">※&nbsp;여행자보험은 포함되어있지 않으니, 꼭 필요하다고 느끼시는 분들은 사전에 미리 직접 가입하시고 오시는 것을 추천해드립니다.<br>
                            </p>
                        </div>
                        <div class="bs-callout bs-callout-warning">
                            <h4>이용 안내</h4>
                            <div>● 예약취소<span style="white-space:pre">						</span></div>
                            <div>&nbsp; - 천재지변으로 운행불가시 : 카드 승인 취소</div>
                        </div>
                    </div>
                </div>
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

<%--스크롤_애니메이션_리셋--%>
<script src="http://127.0.0.1/front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>
</body>
</html>

