<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 01:01
  To change this template use File | Settings | File Templates.
--%>
<%@page import="vo.ResListVO"%>
<%@page import="dao.ResListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%


String resCode = request.getParameter("res_code");

 if( resCode==null){
 	response.sendRedirect("list_restaurant.jsp");
 	return;
 }

ResListDAO rDAO = ResListDAO.getInstance();
ResListVO rVO = rDAO.selectRes(resCode);
pageContext.setAttribute("rVO", rVO);
%>

<!DOCTYPE html>
<html lang="ko">
<head>

    <title>맛집상세정보 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../../../../index.html";
        var g5_bbs_url = "../../../../bbs/index.html";
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
        <div class="visual_area" style="background:url('../front_util/images/sub_visual05.jpg') no-repeat top center;"></div>
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
                        <span>맛집</span>
                        <ul>
                            <li><a href="tour_course.jsp" target="_self">관광지</a></li>
                            <li><a href="booking.jsp?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="map_info_01.html" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>맛집 상세</span>
                        <ul>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">공지사항</a></li>


                            <li><a href="faq.jsp?fm_id=1" target="_self">자주 묻는 질문</a></li>


                            <li><a href="qna.jsp?bo_table=qa" target="_self">질문답변</a></li>


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
            <li>탑승정보</li>
        </div>
        <div class="title">맛집</div>
        <p class="normal_txt">
            홈페이지를 방문해주셔서 감사합니다.
        </p>
    </div>

    <section class="scontents">
        <div class="bg_vline"></div>
        <p class="eng"><em>    ${rVO.res_name }    </em></p>
        <p class="all_map" ><a href="review_restaurant.jsp?res_code=<%=resCode %>&res_name=${rVO.res_name}" >리뷰 보기</a></p>
	                                                      	<%--수정필요!!!!!!!!!!!!!!!!!!!!!!!!!!! --%>
	                                                      	<%--수정필요!!!!!!!!!!!!!!!!!!!!!!!!!!! --%>
	                                                      	<%--수정필요!!!!!!!!!!!!!!!!!!!!!!!!!!! --%>
	                                                      	<%--수정필요!!!!!!!!!!!!!!!!!!!!!!!!!!! --%>
	                                                      	
    </section>
    
    <div>
     <div id ="desc" style="width:50%; float: left; margin-left: 150px;">
       <img src=http://192.168.10.221/albbano-tour-eclipse/upload/<c:out value="${rVO.img_name }"/>  alt="&nbsp;" border="0" width="300" height="200">
       
       ${rVO.res_loc }
       ${rVO.intro}
       ${rVO.busi_hour}
       ${rVO.holiday}

       
    </div>
    <div id="map" style="width:35%;height:450px; margin: 0 auto ; float: right; margin-right: 100px"></div>
    <!--<p><em>지도를 확대 또는 축소 해주세요!</em></p> -->
    <p id="result" style="display: none"></p>

    <script type="text/javascript"
            src="../../dapi.kakao.com/v2/maps/sdk04d1.json?appkey=80568f4d5363291c77cb0f4c34bfb5ff"></script>

    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(${rVO.latitude}, ${rVO.longitude}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'zoom_changed', function () {

            // 지도의 현재 레벨을 얻어옵니다
            var level = map.getLevel();

            var message = '현재 지도 레벨은 ' + level + ' 입니다';
            var resultDiv = document.getElementById('result');
            resultDiv.innerHTML = message;

        });

        var imageSrc = '../front_util/images/location_kakao2.png', // 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(150, 83), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(65, 75)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(${rVO.latitude}, ${rVO.longitude}); // 마커가 표시될 위치입니다

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage // 마커이미지 설정
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
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
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>

</html>
