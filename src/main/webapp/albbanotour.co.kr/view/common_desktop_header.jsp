<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-13
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="header_wrap">
    <div id="header">
        <div class="wrap_box">
            <div id="header_logo">
                <h1><a href="index_user.jsp">
                    <img src="../front_util/images/top_logo.png" alt="로고" title="로고"></a>
                </h1>
            </div>
            <div id="lnb">
                <div id="lnb_wrap">
                    <div class="lnb_area" style="position:relative;">
                        <ul class="ul_1st">
                            <li>
                                <a href="list_spot.jsp" target="_self">관광지</a>
                                <ul class="ul_2nd">
                                    <li>
                                        <a href="list_spot.jsp" target="_self">관광지 리스트</a>
                                        <ul class="ul_3rd"></ul>
                                    </li>
                                    <li>
                                        <a href="review_spot.jsp" target="_self">관광지 리뷰</a>
                                        <ul class="ul_3rd"></ul>
                                    </li>
                                </ul>
                            </li>

                            <li></li>

                            <li>
                                <a href="list_restaurant.jsp" target="_self">맛집</a>
                                <ul class="ul_2nd">
                                    <li>
                                        <a href="list_restaurant.jsp" target="_self">맛집 리스트</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="review_restaurant.jsp" target="_self">맛집 리뷰</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li></li>

                            <li>
                                <a href="tour_course.jsp" target="_self">투어예약</a>
                                <ul class="ul_2nd">
                                    <li>
                                        <a href="tour_course.jsp" target="_self">투어 코스</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="booking.jsp" target="_self">투어 예약</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="list_reservation.jsp" target="_self">예약 확인</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li></li>

                            <li>
                                <a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a>
                                <ul class="ul_2nd">
                                    <li>
                                        <a href="main_notice.jsp?bo_table=notice" target="_self">공지사항</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="faq.jsp?fm_id=1" target="_self">자주 묻는 질문</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="qna.jsp?bo_table=qa" target="_self">질문답변</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="question.jsp" target="_self">1:1문의</a>
                                        <ul class="ul_3rd">
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li></li>

                        </ul>
                    </div>
                </div>
            </div>

            <div id="gnb">
            
            <%
            	String id=(String)session.getAttribute("idKey");
            	if(id ==null ){%>
                <li><a href="login.jsp"><i class="fa fa-power-off" aria-hidden="true"></i> 로그인</a></li>
            	<%}else{%>
                <li><a href="logout.jsp"><i class="fa fa-power-off" aria-hidden="true"></i> 로그아웃</a></li>
                <%} %>
                
                <li><a href="register.jsp"><i class="fa fa-user" aria-hidden="true"></i> 회원가입</a></li> 
            
            </div>

        </div>
    </div>
</section>
