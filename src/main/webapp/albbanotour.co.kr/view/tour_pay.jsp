<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 03:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 | 알빠노관광</title>

    <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>

    <%@ include file="common_head.jsp" %>
    
    <script>
        function calculateTotalFee() {
            var baseFee = 25000;
            var selectedAdultCount = parseInt(document.getElementById("rm_cnt_0").value);

            var totalFee = baseFee * selectedAdultCount;
            document.getElementById("time-total-0").innerText = totalFee.toLocaleString();
            document.getElementById("all-total").innerText = totalFee.toLocaleString();
            document.getElementById("pg-price-all").innerText = totalFee.toLocaleString();
            document.getElementById("base").innerText = baseFee.toLocaleString();
            
            return totalFee;
        }

        window.onload = function() {
            calculateTotalFee();
        };

        function confirmAgree() {
            var agree1Checked = $('#agree1').is(':checked');
            var agree2Checked = $('#agree2').is(':checked');

            if (!agree1Checked) {
                alert('예약 환불 규정에 동의가 필요합니다.');
            } else if (!agree2Checked) {
                alert('개인 정보 활용 동의가 필요합니다.');
            } else {
                requestPay();
            }
        }

        function requestPay() {
            PortOne.requestPayment({
                storeId: "store-78210a12-d8bc-46bd-8b0a-ce0679096a79",
                paymentId: "testlw4mxlva",
                orderName: "알빠노-동해안투어",
                totalAmount: calculateTotalFee(),
                currency: "KRW",
                channelKey: "channel-key-c2db6c5c-a0f4-402e-a176-5ccdfd775929",
                payMethod: "CARD",
                card: {},
                redirectUrl: "https://sdk-playground.portone.io/",
            });
        }
    </script>
</head>

<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area" style="background:url('../front_util/images/sub_visual02.jpg') no-repeat top center;"></div>
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
            <li></li><li>결제</li>
        </div>
        <div class="title">결제</div>
        <p class="normal_txt">	</p>
    </div>

    <div class="scontents">
        <div class="bg_vline"></div>
        <p class="eng"><em></em> 결제하기</p>
        <p class="stitle"></p>

        <div class="wetoz">
            <div class="col-md-12">
                <div class="navi-wrap">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="booking.jsp">실시간예약</a></li>
                        <li role="presentation" class=""><a href="list_reservation.jsp">예약확인/취소</a></li>
                    </ul>
                    <p class="button-list">
                    </p>
                </div>

                <div class="clearfix" style="height:10px;"></div>
                <form method="post" name="wzfrm" id="wzfrm" autocomplete="off">
                    <div class="panel panel-default">
                        <div class="panel-heading"><strong><i class="fa fa-calculator fa-lg"></i> 이용서비스정보</strong>  </div>
                        <div class="table-responsive">
                            <table class="table form-group form-group-sm table-bordered font-color-gray">
                                <thead>
                                <tr>
                                    <th scope="col">예약서비스</th>
                                    <th scope="col">일자</th>
                                    <th scope="col">인원</th>
                                    <th scope="col">요금</th>
                                    <th scope="col">합계</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td data-title="예약서비스">동해안투어</td>
                                    <td data-title="일자">24/04/10(수)</td>
                                    <td data-title="이용인원">
									    성인
									    <select name="rm_cnt[]" id="rm_cnt_0" class="form-control" style="width:40px;" onchange="calculateTotalFee()">
									        <c:forEach var="i" begin="1" end="5">
									            <option value="${i}">${i}</option>
									        </c:forEach>
									    </select>
									</td>
		                            <td data-title="요금">
		                                <c:set var="baseFee" value="25000" />
		                                <span id="base"><c:out value="${baseFee}" /></span>원<br>
		                            </td>
		                            <td data-title="합계">
									    <c:set var="baseFee" value="25000" />
									    <span id="time-total-0"><c:out value="${baseFee}" /></span>원<br>
									</td>
		                        </tr>
		                    </tbody>
							<thead>
							<tr>
							    <th colspan="4">합계</th>
							    <th><span id="all-total"><c:out value="${baseFee}" /></span>원</th>
							</tr>
							</thead>
		                </table>
		            </div>
		        </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"><strong><i class="fa fa-user fa-lg"></i> 예약자정보</strong></div>

                                <div class="panel-body form-horizontal">

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_name">예약자명</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <input type="text" name="bk_name" value="" id="bk_name" required class="form-control" maxlength="20" aria-describedby="helpblock_bk_name">
                                                    <span class="fa fa-check form-control-feedback"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_hp">핸드폰</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <input type="number" name="bk_hp" value="" id="bk_hp" required class="form-control" maxlength="20">
                                                    <span class="fa fa-phone form-control-feedback"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_email">이메일</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <input type="email" name="bk_email" id="bk_email" value="" required class="form-control email" size="35" maxlength="100">
                                                    <span class="fa fa-envelope form-control-feedback"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading"><strong><i class="fa fa-credit-card fa-lg"></i> 결제정보</strong></div>

                        <div class="panel-body form-horizontal">
                            <div class="form-group form-group-sm">
                                <label class="col-xs-4 col-sm-2 control-label">총이용금액</label>
                                <label class="col-xs-8 col-sm-2 control-label" style="text-align:left">
                                    <span id="pg-price-all" class="price_red"><c:out value="${baseFee}" /></span> 원
                                </label>
                            </div>

                            <div class="form-group form-group-sm">
                                <label class="col-xs-4 col-sm-2 control-label">결제방법</label>
                                <div class="col-xs-8 col-sm-10 radio-line">
                                    <label><input type="radio" name="bk_payment" id="bk_payment_card" class="payment_type" value="신용카드" checked=checked/> 신용카드</label>
                                </div>
                            </div>

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
                                <div>● 예약변경<span style="white-space: pre;">						</span>&nbsp;
                                </div>
                                <div>&nbsp; - 예약변경은 탑승일 하루전 16시까지 1회 변경가능(단, 원하시는코스가 만석일 경우 불가능)<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 변경일 투어모객 미달 시, 취소나 환불 불가<span style="white-space:pre">						</span></div>
                                <div><br></div>
                                <div>● 예약취소 환불안내<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 환불요청은 영업일 (09~18시) 기준으로 적용됩니다.<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 투어 3일전까지 취소가능 : 100% 환불<span style="white-space:pre">						</span></div>
                                <div>&nbsp; -&nbsp;이후 환불불가<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 천재지변으로 운행불가 : 100%</div>
                                <div>&nbsp; - 카드결제 : 카드승인취소</div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <label><input type="checkbox" name="agree1" value="1" id="agree1" /> 상기의 내용을 숙지하고 예약 및 환불규정에 동의 합니다.</label>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	<strong><i class="fa fa-file-text-o fa-lg"></i> 개인정보 활용 동의</strong>
                        </div>
                        <div class="panel-body">

                            귀하의 소중한 개인정보는 개인정보보호법의 관련 규정에 의하여 예약 및 조회 등 아래의 목적으로 수집 및 이용됩니다.
                            <ul class="purpose">
                                <li>1. 개인정보의 수집·이용 목적 - 예약, 조회를 위한 본인 확인 절차</li>
                                <li>2. 개인정보 수집 항목 - 예약자명, 핸드폰, 이메일</li>
                                <li>3. 개인정보의 보유 및 이용기간 - 이용자의 개인정보는 원칙적으로 개인정보의 처리목적이 달성되면 지체 없이 파기합니다.</li>
                            </ul>

                            예약을 위하여 수집된 개인정보는 ‘전자상거래 등에서의 소비자보호에 관한 법률’ 제6조에의거 정해진 기간동안 보유됩니다.<br/>
                            ※ 상기 내용은 고객님께 예약서비스를 제공하는데 필요한 최소한의 정보입니다.<br/>
                            ※ 상기 내용에 대하여 본인이 동의하지 않을 수 있으나, 그러할 경우 예약 서비스 제공에 차질이 발생할 수 있습니다.

                        </div>
                        <div class="panel-footer">
                            <label><input type="checkbox" name="agree2" value="1" id="agree2" /> 개인정보 활용에 동의 합니다.</label>
                        </div>
                    </div>

                    <div class="row">

                        <div id="display_pay_button" class="col-md-12 btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-primary" onclick="location.href='../bbs/board.php?bo_table=booking&cp_code=&mode=step1&sch_day=2024-04-10';"><i class="fa fa-chevron-left fa-sm"></i> 이전단계</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" id="submit_next" data-loading-text="Loading..." autocomplete="off" class="btn btn-success" onclick="confirmAgree()"><i class="fa fa-check"></i> 예약하기</button>
                            </div>
                        </div>

                    </div>
                </form>
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

<%--스크롤_애니메이션_리셋--%>
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>
</body>
</html>