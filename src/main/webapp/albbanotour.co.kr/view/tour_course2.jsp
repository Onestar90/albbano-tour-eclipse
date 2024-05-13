<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 03:32
To change this template use File | Settings | File Templates.
--%>
<%@page import="vo.CourseManagementVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.SpotListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CourseManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String curs = request.getParameter("curs");
String code = curs;

CourseManagementDAO cmDAO = CourseManagementDAO.getInstance();

List<SpotListVO> list= new ArrayList<SpotListVO>();
list = cmDAO.selectDetailSpot(code);

List<CourseManagementVO> list_curs = new ArrayList<CourseManagementVO>();
list_curs = cmDAO.selectAllCurs();

pageContext.setAttribute("list", list);
pageContext.setAttribute("list_curs", list_curs);


CourseManagementVO cVO = cmDAO.selectCourseDetail(code);
pageContext.setAttribute("cVO", cVO);


%>
<html lang="ko">
<head>
    <title>동해안투어 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../../../../index.html";
        var g5_bbs_url = "../../../../index.html";
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
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual01.jpg') no-repeat top center;"></div>
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
                            <li><a href="booking.jsp" target="_self">투어</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>투어코스</span>
                        <ul>
                            <li><a href="tour_course.html" target="_self">투어코스</a></li>
                            <li><a href="review_spot.jsp" target="_self">투어예약</a></li>
                            <li><a href="review_spot.jsp" target="_self">예약확인</a></li>
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
            <li>${ spt.spot_name }</li>
        </div>
        <div class="title">관광지</div>
        <p class="normal_txt">
            홈페이지를 방문해주셔서 감사합니다.
        </p>
    </div>


    <section class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em>투어 코스</em></p>
       
        <p class="stitle"></p>


        <div class="business">
            <div class="receive-btn">
      
            </div>
        </div>

        <div class="lview" style="height: 50px;"></div>

        <div class="business">
        <c:forEach var="curs" items="${ list_curs }" varStatus="i">
            <div class="course_title"><h5><c:out value="${curs.crsName }"/></h5></div>
            
                        <div class="course_box">
                            <div class="box_wrap">
                                <dd>
                                    <ul>
                                    <c:forEach var="spt" items="${ list }" varStatus="j">
                                        <li><span>${ j.count }</span>${ spt.spot_name }</li>
                                        
                                    </c:forEach>
                                    </ul>

                                </dd>
                            </div>
                        </div>
           </c:forEach>


            <!--타이틀 이미지 시작  -->
            <div id="content1">
                <!-- <div class="cross_img"><img class="wow fadeInLeft"
                                            src="../front_util/images/course_v2_01.png" alt="">
                </div> -->
            </div>
            <!--타이틀 이미지 끝   -->



            <!--
                                <div>
                                 <h3 style="margin: 20px auto" > 방문지별 입장요금 안내 (해당사이트를 연결을 통해서 확인)</h3>
                                  <table cellspacing="0" cellpadding="0" class="tba">
                                    <thead>
                                    <tr>
                                      <th >명주 전시관</th>
                                      <th >감은사지</th>
                                      <th>문무대왕릉</th>
                                      <th >주상절리</th>
                                      <th >골굴사</th>
                                      <th >괘릉</th>
                                    </tr>
                                    </thead>
                                   <tbody>
                                     <tr>
                                      <td> <a href="#" target="_blank">해당사이트연결</a>　</td>
                                      <td> <a href="#" target="_blank">해당사이트연결</a>　</td>
                                      <td> <a href="#" target="_blank">해당사이트연결</a>　</td>
                                      <td> <a href="#" target="_blank">해당사이트연결</a>　</td>
                                      <td> <a href="#" target="_blank">해당사이트연결</a>　</td>
                                      <td> <a href="#" target="_blank">해당사이트연결</a>　</td>

                                    </tr>
                                    </tbody>
                                  </table>
                                  <p>&nbsp;</p>
                                </div>
            -->


        </div>

        <!--
                <div class="lview" style="height: 50px;"></div>
                    <div class="course_title"><h5>코스사진보기 </h5>  </div>
                    <div style="text-align: center"><span>이미지를 클릭하면 확대 사진을 볼 수 있습니다.</span></div>

                <div class="fancy">

                    <p class="imglist">
                      <a href="/fancybox/image/tour_a/tour_a_01.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_01.jpg" /></a>
                      <a href="/fancybox/image/tour_a/tour_a_02.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_02.jpg" /></a>
                      <a href="/fancybox/image/tour_a/tour_a_03.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_03.jpg" /></a>
                      <a href="/fancybox/image/tour_a/tour_a_04.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_04.jpg" /></a>

                    </p>

                    <p class="imglist">

                      <a href="/fancybox/image/tour_a/tour_a_05.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_05.jpg" /></a>
                      <a href="/fancybox/image/tour_a/tour_a_06.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_06.jpg" /></a>
                      <a href="/fancybox/image/tour_a/tour_a_07.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_07.jpg" /></a>
                      <a href="/fancybox/image/tour_a/tour_a_08.jpg" data-fancybox="images"><img src="/fancybox/image/tour_a/thumb_tour_a_08.jpg" /></a>
                    </p>

                </div>
        -->

    </section>


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
