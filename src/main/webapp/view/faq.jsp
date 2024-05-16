<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-15
  Time: 오후 03:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>자주하시는 질문 | 알빠노관광</title>

    <%@include file="common_head.jsp" %>
</head>
<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('http://127.0.0.1/front_util/images/sub_visual02.jpg') no-repeat top center;">
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
                        <span>고객센터</span>
                        <ul>
                           <li><a href="list_spot.jsp" target="_self">관광지</a></li>
                            <li><a href="list_restaurant.jsp" target="_self">맛집</a></li>
                            <li><a href="booking.jsp" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>자주하시는 질문</span>
                        <ul>
                            <li><a href="main_notice.jsp" target="_self">공지사항</a></li>
                            <li><a href="faq.jsp" target="_self">자주 묻는 질문</a></li>
                            <li><a href="qna.jsp" target="_self">질문답변</a></li>
                            <li><a href="question.jsp" target="_self">1:1문의</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li>고객센터</li>
            <li></li>
            <li>자주하시는 질문</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">

        <div class="bg_vline"></div>
        <p class="eng"><em></em> 자주하시는 질문</p>
        <p class="stitle"></p>

        <!-- FAQ 시작 { -->
        <div id="faq_hhtml"></div>

        <div id="faq_wrap" class="faq_1">
            <section id="faq_con">
                <h2>자주하시는 질문 목록</h2>
                <ol>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>예약은 어떻게
                            하나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>▶전화예약</p>
                            <p><br/></p>
                            <p>투어날짜, 코스, 인원, 승차장소, 연락처를 확인하신 후 고객센터로 연락주시면</p>
                            <p><br/></p>
                            <p>예약가능하며 결제(무통장입금) 시 예약이 완료됩니다.</p>
                            <p><br/></p>
                            <p><br/></p>
                            <p><br/></p>
                            <p>▶인터넷예약</p>
                            <p><br/></p>
                            <p>홈페이지에서 코스 선택 후 예약하기로 진행가능하며 카드결제 또는 무통장입금으로 결제가능합니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>할인 혜택은 있나요?<br/>
                        </p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>투어비는 문화해설사+차량비용이라 특별한 할인혜택을 제공하고 있지 않습니다.</p>
                            <p><br/></p>
                            <p>10명 이상 단체예약 시 총 투어비의 10%를 현장에서 돌려드리고 있습니다.</p>
                            <p><br/></p>
                            <p>만 65세 이상 경로, 국가유공자, 장애인의 경우 증빙서류(신분증) 지참하시면 문화재 입장료 무료입니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>예약취소 시
                            환불절차는 어떻게 되나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>· 환불요청은 영업일 (09~18시) 기준으로 적용됩니다.</p>
                            <p>· 투어 3일전 취소 : 100%</p>
                            <p>· 투어 2일전 취소 : 90%</p>
                            <p>· 투어 1일전 취소 : 80% (15시 이후 취소시 당일취소로 간주됩니다.)</p>
                            <p>· 당일취소 및 불참 : 환불불가</p>
                            <p>· 모객인원미달로 취소 : 100%환불</p>
                            <p>· 천재지변으로 운행불가 : 100%환불</p>
                            <p>· 무통장입금 : 환불 받을 계좌번호 고객센터로 전달, 매주 목요일(17~18시) 환불 진행</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>몇 명 이하일 경우
                            운행취소가 되나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>15명 미만 시 투어가 취소가 됩니다.</p>
                            <p><br/></p>
                            <p>모객현황 미달시 이틀 전에 안내해드리며 하루 전 15:00 예약 마감 후 다시 안내해드리고 있습니다.</p>
                            <p><br/></p>
                            <p>출발확정인 경우 많은 분들이 예약하신 상황이라 따로 연락을 드리고 있지 않습니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>투어버스 탑승은
                            어떻게 하나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>예약하신 승차장소에서만 탑승가능하며 승차시간 5분전까지 도착하여 기다려주시면 감사하겠습니다.</p>
                            <p><br/></p>
                            <p>상황에 따라 5분~10분정도 연착 될 수 있습니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>우천시 시티투어운행은
                            어떻게 되나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>우천 시에도 정상운행됩니다.</p>
                            <p><br/></p>
                            <p>다만, 천재지변(지진, 돌풍 등)으로 운행이 어려울 시 고객님들의 안전을 위해 투어가 취소됩니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>시티투어중
                            점심(식사)은 어떻게 되나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>13시 전후로 식사를 하시게 됩니다.</p>
                            <p><br/></p>
                            <p>투어일정상 한정된 시간내에 점심식사를 하셔야합니다.</p>
                            <p><br/></p>
                            <p>식당은 지정되어있지않으며, 식당이 많은 곳에서 하차해드리니,</p>
                            <p><br/></p>
                            <p>개별적으로 자유롭게 선택하셔서 드시고 계산하시면 됩니다.</p>
                            <p><br/></p>
                            <p><br/></p>
                            <p><br/></p>
                            <p>(도시락을 준비해 점심시간에 자유롭게 식사하셔도 괜찮습니다.)</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>입장료는 어떻게
                            지불하나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>입장료는 고객님께서 관광지마다 직접 지불하셔야하나 시간이 너무 오래걸리는 문제가 있습니다.</p>
                            <p><br/></p>
                            <p>빠른 입장을 위해 문화해설사가 결제 대행할 수 있도록 전체 입장료를 현금으로 준비해</p>
                            <p><br/></p>
                            <p>당일 문화해설사에게 전달 부탁드립니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>터미널 근처 주차장은
                            어디 있나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>터미널(고속,시외버스)에 유료주차장이 있습니다.</p>
                            <p><br/></p>
                            <p>주차료는 시간당 1,000원이며, 시외버스터미널 맞은편 무료주차장(강변둔치)이 있습니다.</p>
                            <p><br/></p>
                            <p>편리한 곳에 주차 하시면 됩니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>단독투어도
                            가능한가요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>네. 그룹의 성격에 맞게 원하는 일정으로 단독투어 진행가능합니다.</p>
                            <p><br/></p>
                            <p>단독투어는 문화해설사+차량 임대 형식으로 진행되고 있습니다. </p>
                            <p><br/></p>
                            <p>차량은 대형버스(45인승)으로 준비되어있으며</p>
                            <p><br/></p>
                            <p>고객센터 02-3483-4632로 문의주시면 상세히 안내해드리겠습니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>하차장소는
                            어디인가요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>코스별 승차장소들 중 한 곳에서 하차 가능합니다.</p>
                            <p>처음 탑승하셨던 장소뿐만 아니라 승차장소로 안내되고 있는 곳에서 하차 가능하며</p>
                            <p><br/></p>
                            <p>당일 문화해설사에게 원하는 하차장소 말씀해주시면 안내받아 하차 가능합니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>투어종료시간은 어떻게
                            됩니까?</p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>주간투어는 17:00~18:00, 야간투어는 21:30~22:30 사이에 하차 가능합니다.</p>
                            <p><br/></p>
                            <p>단, 성수기(연휴, 공휴일, 4월~11월)에는 도로사정상 하차시간이 지연될 수 있습니다.</p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>여행자보험이
                            포함되어있나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>여행자보험은 포함되어있지 않으니, 꼭 필요하다고 느끼시는 분들은 사전에 미리 직접 가입하시고 오시는 것을 추천해드립니다.<br/></p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);">코스별로 문화해설사가
                            있나요?</a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            전문 문화해설사가 전 일정 동행하며 경주와 문화재에 얽힌 이야기를 해드리고 있습니다.
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h3><span class="tit_bg">Q</span><a href="#none" onclick="return faq_open(this);"><p>버스 좌석은 지정되어
                            있나요?<br/></p></a></h3>
                        <div class="con_inner">
                            <span class="tit_bg">A</span>
                            <p>지정좌석제가 아니며 자유석입니다.<br/></p>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                </ol>
            </section>
        </div>

        <nav class="pg_wrap"><span class="pg"><span class="sound_only">열린</span><strong
                class="pg_current">1</strong><span class="sound_only">페이지</span>
<a href="faq2a16.html?&amp;fm_id=1&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="faq2a16.html?&amp;fm_id=1&amp;page=2" class="pg_page pg_end">맨끝</a>
</span></nav>
        <div id="faq_thtml"></div>
        <fieldset id="faq_sch">
            <legend>FAQ 검색</legend>

            <form name="faq_search_form" method="get">
                <!-- <span class="sch_tit">FAQ 검색</span> -->
                <input type="hidden" name="fm_id" value="1">
                <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="stx" value="" required id="stx" class="frm_input " size="15" maxlength="15"
                       placeholder="FAQ 검색">
                <button type="submit" value="검색" class="btn_submit"><i class="fa fa-search" aria-hidden="true"></i> 검색
                </button>
            </form>
        </fieldset>

        <!-- } FAQ 끝 -->

        <script src="../front_util/js/viewimageresize.js"></script>
        <script>
            $(function () {
                $(".closer_btn").on("click", function () {
                    $(this).closest(".con_inner").slideToggle();
                });
            });

            function faq_open(el) {
                var $con = $(el).closest("li").find(".con_inner");

                if ($con.is(":visible")) {
                    $con.slideUp();

                } else {
                    $("#faq_con .con_inner:visible").css("display", "none");

                    $con.slideDown(
                        function () {
                            // 이미지 리사이즈
                            $con.viewimageresize2();
                        }
                    );
                }
                return false;
            }
        </script>
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
