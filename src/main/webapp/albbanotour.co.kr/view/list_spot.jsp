<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오전 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@page import="vo.SpotListVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SpotDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관광지리스트 | 알빠노관광</title>

    <script>
        var g5_url = "index_user.jsp";
        var g5_bbs_url = "index_user.jsp";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "";
        var g5_sca = "";
        var g5_editor = "";
        var g5_cookie_domain = "";
    </script>
    <%@ include file="common_head.jsp" %>
</head>

<body>
<%
SpotDAO sDAO =SpotDAO.getInstance();
List<SpotListVO> list =sDAO.selectAlSpot();
pageContext.setAttribute("list", list);
%>
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
                        <span>관광지</span>
                        <ul>
                            <li><a href="tour_course.jsp" target="_self">관광지</a></li>
                            <li><a href="booking.jsp?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="../theme/albbanotour/html/business/map_info_01.html" target="_self">투어예약</a>
                            </li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>관광지 리스트</span>
                        <ul>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">관광지 리스트</a></li>

                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li>관광지</li>
            <li></li>
            <li>관광지 리스트</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div id="container">
        <section id="rolling_box" class="clearfix">
            <div class="con_title wow fadeInUp" id="unique_con_title">
                <p>관광지 리스트</p>
            </div>

            <div class="swiper-btn-wrap">
                <div class="swiper-scrollbar-wrap1">
                    <div class="swiper-scrollbar2">
                    </div>
                </div>
                <div class="swiper-scrollbar-wrap2">
                    <div class="swiper-button-next2"></div>
                    <div class="swiper-button-prev2"></div>
                </div>
                <div class="swiper-pagination2"></div>
            </div>
            <form>
            <div class="swiper-container2">
                <div class="swiper-wrapper">
				<c:forEach var="spt" items="${ list }">
                    <div class="swiper-slide" style="width:285px !important;">
                        <a href="desc_spot.jsp?spot_code=${ spt.spot_code }">
                            <img src=http://192.168.10.221/albbano-tour-eclipse/upload/<c:out value="${ spt.img_name}"/>
                            
                            
                            
                                 alt="&nbsp;">
                            <p class="txtBox">
                                <span class="tit"><c:out value="${ spt.spot_name}" /></span>
                                <span class="txt">&nbsp;</span>
                                <span class="date"><c:out value="${ spt.create_date}" /></span>
                            </p>
                        </a>
                    </div>
				 </c:forEach>

                </div>
            </div>
            </form>
        </section>
        <script src="../front_util/js/g_slide.js"></script>
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
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>
</body>
</html>

