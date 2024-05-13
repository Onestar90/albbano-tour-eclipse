<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@page import="vo.SpotListVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SpotDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>알빠노관광</title>
    <script>
        var g5_url = "index.html";
        var g5_bbs_url = "bbs/index.html";
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
<%-- <%@ include file="common_desktop_header.jsp" %> --%>

<jsp:include page="common_desktop_header.jsp"/>
<div id="container">
    <section id="main_visual" class="clearfix">
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper">
                <div class="swiper-slide swiper-lazy" data-swiper-autoplay="8000">
                    <div class="sliderkit-text">
                        <h1 class="lviewa animated" data-swiper-animation="fadeInUp" data-duration="3.2s"
                            data-delay="0.2">이건 좀 쉬웠다. </h1>
                        <h1 class="sviewa animated" data-swiper-animation="fadeInLeft" data-duration="3.2s"
                            data-delay="0.2">왜냐하면 <br>형태가 단순했거든 </h1>
                        <div class="animated" data-swiper-animation="fadeInRight" data-duration="3.2s" data-delay="0.2">
                            <span><h2><a href="question.jsp">문의</a></h2></span></div>
                    </div>
                    <div class="backgroundimg5"
                         style="background:url('../front_util/images/main_visual05.jpg') top center no-repeat;"></div>
                    <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                </div>

                <div class="swiper-slide swiper-lazy" data-swiper-autoplay="8000">
                    <div class="sliderkit-text">
                        <h1 class="lviewa animated" data-swiper-animation="fadeInUp" data-duration="3.9s"
                            data-delay="0.2">이건 제가 생각해도 잘했어요 </h1>
                        <h1 class="sviewa animated" data-swiper-animation="fadeInLeft" data-duration="3.2s"
                            data-delay="0.2">누가봐도 <br>돌탑 같이 생겼습니다 </h1>
                        <div class="animated" data-swiper-animation="fadeInRight" data-duration="3.9s" data-delay="0.2">
                            <span><h2><a href="question.jsp">문의</a></h2></span></div>
                    </div>
                    <div class="backgroundimg2"
                         style="background:url('../front_util/images/main_visual02.jpg') top center no-repeat;"></div>
                    <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                </div>

                <div class="swiper-slide swiper-lazy" data-swiper-autoplay="8000">
                    <div class="sliderkit-text">
                        <h1 class="lviewa animated" data-swiper-animation="fadeInUp" data-duration="3.2s"
                            data-delay="0.2">이것은 첫 작품. </h1>
                        <h1 class="sviewa animated" data-swiper-animation="fadeInLeft" data-duration="3.2s"
                            data-delay="0.2"><strong>손가락에 <br>마비가 옵니다 </strong></h1>
                        <div class="animated" data-swiper-animation="fadeInRight" data-duration="3.2s" data-delay="0.2">
                            <span><h2><a href="question.jsp">문의</a></h2></span></div>
                    </div>
                    <div class="backgroundimg1"
                         style="background:url('../front_util/images/main_visual01.jpg') top center no-repeat;"></div>
                    <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                </div>

                <div class="swiper-slide swiper-lazy" data-swiper-autoplay="8000">
                    <div class="sliderkit-text">
                        <h1 class="lviewa animated" data-swiper-animation="fadeInUp" data-duration="3.2s"
                            data-delay="0.2">감은사지의 석탑은 퍼블리셔의 발전된 실력.
                        </h1>
                        <h1 class="sviewa animated" data-swiper-animation="fadeInLeft" data-duration="3.2s"
                            data-delay="0.2">편집은 역시 <br>윈도우 기본 그림판 </h1>
                        <div class="animated" data-swiper-animation="fadeInRight" data-duration="3.2s" data-delay="0.2">
                            <span><h2><a href="question.jsp">문의</a></h2></span></div>
                    </div>
                    <div class="backgroundimg4"
                         style="background:url('../front_util/images/main_visual04.jpg') top center no-repeat;"></div>
                    <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                </div>
                <div class="swiper-slide swiper-lazy" data-swiper-autoplay="8000">
                    <div class="sliderkit-text">
                        <h1 class="lviewa animated" data-swiper-animation="fadeInUp" data-duration="3.2s"
                            data-delay="0.2">돌탑도 불국사에 있던 것 같은데
                        </h1>
                        <h1 class="sviewa animated" data-swiper-animation="fadeInLeft" data-duration="3.2s"
                            data-delay="0.2">경주에 <br>생각보다 볼 데가 없어요 </h1>
                        <div class="animated" data-swiper-animation="fadeInRight" data-duration="3.2s" data-delay="0.2">
                            <span><h2><a href="question.jsp">문의</a></h2></span></div>
                    </div>
                    <div class="backgroundimg9"
                         style="background:url('../front_util/images/main_visual09.jpg') top center no-repeat;"></div>
                    <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                </div>

            </div>
            <div class="swiper-pagination"></div>

            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        <script src="../front_util/js/main.js"></script>

    </section>

    <section>
        <div class="con_title wow fadeInUp mobile_view">
            <a href="booking.jsp?bo_table=booking">
                <img src="../front_util/images/dm.jpg" alt="예약바로가기" width="100%"></a>
        </div>
    </section>
    <section>
        <div class="con_title wow fadeInUp mobile_view">
            <a href="tour_course.jsp">
                <img src="../front_util/images/tour_btn.jpg" alt="관광지"
                     width="100%"></a>
        </div>
    </section>

    <section>
        <div class="con_title wow fadeInUp mobile_view">
            <a href="theme/albbanotour/html/business/map_info_01.html">
                <img src="../front_util/images/jangso_btn.jpg" alt="승차장소"
                     width="100%"></a>
        </div>
    </section>

    <section>
        <div class="con_title wow fadeInUp mobile_view">
            <a href="http://pf.kakao.com/_ukxghC">
                <img src="../front_util/images/kakao.jpg" alt="카톡문의" width="100%"></a>
        </div>
    </section>

    <section id="rolling_box" class="clearfix">
        <div class="con_title wow fadeInUp">
            <p>관광지 리스트</p>
            <span>경주의 다양한 모습을 엄청난 그림으로 만나보세요.</span>
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
        <div class="swiper-container2">
            <div class="swiper-wrapper">

               <c:forEach var="spt" items="${ list }">
                    <div class="swiper-slide" style="width:285px !important;">
                        <a href="desc_spot.jsp?spot_code=${ spt.spot_code }">
                            <img src=http://localhost/albbano-tour-eclipse/upload/<c:out value="${ spt.img_name}"/>
                            
                            
                            
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
    </section>

    <script src="../front_util/js/g_slide.js"></script>

    <section id="comm_wrap" class="clearfix">
        <div class="comm_area">
            <div class="cs_box" style="float:left; width:330px; height:250px; padding:30px; margin-right:20px; background:#9d0d0d no-repeat right bottom; background-size:cover; overflow:hidden; ">
                <a href="tel:02-3483-4632">
                    <li>고객센터</li>
                    <li><strong>1588-1234</strong></li>
                    <li><p>02-3483-4632</p></li>
                    <li>
							<span>
								평일 09:00~18:30<br>
								점심시간 13:00~14:00
							</span>
                    </li>
                </a>
            </div>

            <div class="notice_area">
                <ul class="tab">
                    <li>공지사항</li>
                    <a href="main_notice.jsp?bo_table=notice" class="more"><img
                            src="../front_util/images/btn_more.png"></a>
                </ul>
                <ul class="notice_list">
                    <li>
                        <a href="view/notice06.html?bo_table=notice&amp;wr_id=41">
                            <strong><em>30</em>2024.03</strong>
                            <p class="txt">
                                <strong>승차장소 제한 안내 </strong>
                                <span>04.06(토) 경주벚꽃마라톤 보문단지 도로통제로 아래 승차장소에서만 탑승이 가능합니다.(…</span>
                            </p>
                        </a>
                    </li>

                    <li>
                        <a href="view/notice03.html?bo_table=notice&amp;wr_id=40">
                            <strong><em>24</em>2024.02</strong>
                            <p class="txt">
                                <strong>2월26일이부로 일부 승차장소 변경 … <span class="hot_icon">H<span
                                        class="sound_only">인기글</span></span> </strong>
                                <span>승차장소 변경 안내02월26일부로 일부 승차장소가 아래와 같이 변경됩니다.구)경주역 → 황…</span>
                            </p>
                        </a>
                    </li>


                </ul>
            </div>

            <div class="quick_service">
                <ul>
                    <li>
                        <dl>
                            <dd>
                                <a href="list_spot.jsp">
                                    <i class="fas fa-camera" aria-hidden="true"></i>
                                    <p>관광지</p>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dd>
                                <a href="qna.jsp?bo_table=qa">
                                    <i class="fas fa-comments" aria-hidden="true"></i>
                                    <p>질문과답변</p>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dd>
                                <a href="main_notice.jsp?bo_table=notice">
                                    <i class="fas fa-edit" aria-hidden="true"></i>
                                    <p>공지사항</p>
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
                <ul>
                    <li>
                        <dl>
                            <dd>
                                <a href="faq.jsp">
                                    <i class="fas fa-question-circle" aria-hidden="true"></i>
                                    <p>자주묻는질문</p>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dd>
                                <a href="booking.jsp?bo_table=booking">
                                    <i class="fas fa-users" aria-hidden="true"></i>
                                    <p>예약바로가기</p>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dd>
                                <a href="company_location.jsp">
                                    <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                                    <p>오시는길</p>
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
    </section>

</div>

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
