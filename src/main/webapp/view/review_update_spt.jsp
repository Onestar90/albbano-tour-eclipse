<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 02:20
  To change this template use File | Settings | File Templates.
--%>

<%@page import="vo.SpotReviewVO"%>
<%@page import="dao.SpotReviewDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<% 
	request.setCharacterEncoding("UTF-8");
	
	String sptCode = request.getParameter("spt_code");
	String sptName = request.getParameter("spt_name");	
	String spot_doc_no = request.getParameter("spot_doc_no");

	SpotReviewDAO srDAO= SpotReviewDAO.getInstance();
	SpotReviewVO srVO = srDAO.selectSpotReviewDetail(spot_doc_no);
	pageContext.setAttribute("srVO", srVO);
	
	%>
	<%
	String login_id = (String)session.getAttribute("idKey");
	if(login_id == null){ %>
	
	<script>
	location.href = "login_ok.jsp";
	</script>
	
	<% }%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>리뷰 글쓰기 | 알빠노관광</title>

    <%@ include file="common_head.jsp" %>
    
    <script type="text/javascript">

    window.onload = function() {
       	
        var star = ${srVO.star };
        
        for (var i = 1; i <= star; i++) {
            document.getElementById("rating" + i).checked = true;
        }
    };

    $(function(){
  	  	$("#btn_submit").click(function(){
    		chkNull();		
    	});
  	  	
    });
    
    function chkNull(){
    	 if (confirm("리뷰를 수정하시겠습니까?")) {
			$("#fwrite").submit();
    	 }
    }
    </script>
</head>

<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>


<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual05.jpg') no-repeat top center;"></div>
    </div>
</section>

<link rel="stylesheet" href="http://127.0.0.1/front_util/css/star.css">

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
                </div>
                <ul class="">
                    <li>
                        <span>관광지</span>
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
                        <span>관광지 리스트</span>
                        <ul>
                            <li><a href="list_spot.jsp" target="_self">관광지 리스트</a></li>
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
            <li>질문답변</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 리뷰수정</p>
        <p class="stitle"></p>


        <!-- skin : theme/daon_basic -->
        <section id="bo_w">
            <h2 class="sound_only">리뷰수정</h2>

            <!-- 게시물 작성/수정 시작 { -->
            <form name="fwrite" id="fwrite" action="review_update_spt_action.jsp" method="post"
                  style="width:100%">
        
                <div class="bo_w_info write_div">


                </div>

	                <input type="hidden" id="spt_code" name="spt_code" value="<%=sptCode %>">
					<input type="hidden" id="spt_name" name="spt_name" value="<%=sptName %>">
					<input type="hidden" id="spot_doc_no" name="spot_doc_no" value="<%=spot_doc_no %>">
                <div class="bo_w_tit write_div">
                    <label for="wr_subject" class="sound_only"><strong>필수</strong></label>

                    <div id="autosave_wrapper write_div">
                        <input type="text" name="wr_subject" value="${srVO.spot_title }" id="wr_subject" required
                               class="frm_input full_input required" size="50" maxlength="255" placeholder="제목">

                    </div>

                </div>

                <div class="write_div">
                    <label for="wr_content" class="sound_only">제목<strong>필수</strong></label>
                    <div class="wr_content smarteditor2">
                        <span class="sound_only">웹에디터 시작</span>
                        <script src="https://cmtour.co.kr/plugin/editor/smarteditor2/js/service/HuskyEZCreator.js"></script>
                        <script>var g5_editor_url = "https://cmtour.co.kr/plugin/editor/smarteditor2", oEditors = [],
                            ed_nonce = "52kNkUk0bp|1712424678|ed8c8bcef39e04e0cc6f094af2617bc1b8d3a47b";</script>
                        <script src="https://cmtour.co.kr/plugin/editor/smarteditor2/config.js"></script>
                       
                        <textarea id="wr_content" name="wr_content" class="smarteditor2" maxlength="65536"
                                  style="width:100%;height:300px">${srVO.spot_contents}</textarea>
                        <span class="sound_only">웹 에디터 끝</span></div>

                                <fieldset class="rate">
                                <span class="text-bold">별점을 선택해주세요</span>
                                <br>
                                <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                                <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                                <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                                <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                                <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                                <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                                <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                                <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                                <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                                <input type="radio" id="rating1" name="rating" value="1" checked><label class="half" for="rating1" title="0.5점"></label>

                            </fieldset>




                <div class="btn_confirm write_div" style="text-align:center;">
                    <a href="review_spot.jsp?spt_code=<%=sptCode %>&spt_name=<%=sptName %>" class="btn_cancel btn">취소</a>
                    <input type="button" value="작성완료" id="btn_submit" class="btn_submit btn">
                </div>
            </form>

        </section>
        <!-- } 게시물 작성/수정 끝 -->
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