<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 02:43
To change this template use File | Settings | File Templates.
--%>
<%@page import="vo.SpotReviewVO"%>
<%@page import="dao.SpotReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SpotDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관광지 리뷰 | 알빠노관광</title>

<%
	String sptCode = request.getParameter("spt_code");
	String sptName = request.getParameter("spt_name");
	String login_id = (String)session.getAttribute("idKey");
	if( sptCode==null){
      	response.sendRedirect("http://127.0.0.1/view/list_spot.jsp");
      	return;
      }
	
	pageContext.setAttribute("login_id",login_id);

%>

<jsp:useBean id="qsVO" class="vo.QnaSearchVO" scope="page"/>
<jsp:setProperty property="*" name="qsVO"/>

	
<%

SpotReviewDAO sDAO = SpotReviewDAO.getInstance();

int totalCount= sDAO.selecttotalCount(qsVO);
int pageScale=5;

int totalPage=(int)Math.ceil((double)totalCount/pageScale)-1;

String tempPage=qsVO.getCurrentPage();
int currentPage=1;
if(tempPage != null){
	try{
		currentPage=Integer.parseInt(tempPage);
	}catch(NumberFormatException nfe){
		
	}
}
int startNum=currentPage * pageScale-pageScale +1;
int endNum=startNum+pageScale-1;

qsVO.setStartNum(startNum);
qsVO.setEndNum(endNum);



List<SpotReviewVO> list = new ArrayList<SpotReviewVO>();
list = sDAO.selectSptAllReview(qsVO, sptCode);
pageContext.setAttribute("list", list);

%> 

</head>
    <%@ include file="common_head.jsp" %>
<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual05.jpg') no-repeat top center;"></div>
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
                        <span>관광지 리뷰</span>
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
            <li>관광지</li>
            <li></li>
            <li>관광지 리뷰</li>
        </div>
        <div class="title">관광지</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">

        <div class="bg_vline"></div>
        <p class="eng"><em></em> <%=sptName %> 리뷰</p>
        <p class="stitle"></p>

        <!-- FAQ 시작 { -->
        <div id="faq_hhtml"></div>

        <div class="select_bo_cate mview">
            <a class="sel" rel="선택">관광지 리뷰</a>
            <ul style="display:none;">
                <li><a href="#none">선택</a></li>
                <li><a href="review_spot.jsp"><span
                        class="sound_only">열린 분류 </span>관광지 리뷰</a></li>
            </ul>
        </div>
        <nav id="bo_cate" class="snone">
            <h2>관광지 분류</h2>
            <ul id="bo_cate_ul">
                <li><a href="review_write_spt.jsp?spt_code=<%=sptCode %>&spt_name=<%=sptName %>" id="bo_cate_on" style="background-color: white">
                <span class="sound_only">열린 분류 </span>리뷰 작성</a></li>
            </ul>
        </nav>

        <div id="faq_wrap" class="faq_1">
            <section id="faq_con">
                <h2>관광지 목록</h2>
                <ol>
                
                <c:if test="${ not empty list}">
                  <c:forEach var="review" items="${ list }" varStatus="i">
                    <li>
                        <h3>
                           
                            <a href="#none" onclick="return faq_open(this);" style="
    display: block;
">
                                <span class="tit_bg" style="position: static">제목</span>
                                <p style="
    display: inline;
">											
                                    <c:out value=" ${review.spot_title }"/>
                                    <span class="id" style="float: right;">작성자 : <c:out value=" ${review.id }"/></span>
                                    <br>
                                </p>
                                별점 : <span class="starRating" ><c:out value="${review.star}"/>점</span>
                            </a>
                        </h3>
                        <div class="con_inner">
                            <span class="tit_bg">내용</span>
                           		   <c:out value="${review.spot_contents}"/>
                             <div class="con_closer">
                            	<c:if test="${review.id eq login_id }">
                            	
                                <a href="review_update_spt.jsp?spt_code=<%=sptCode%>&spt_name=<%=sptName%>&spot_doc_no=${review.spot_doc_no}" style="background-color: white">                             
                                <span class="sound_only">열린 분류 </span>수정</a>
                                <a href="review_delete_spt.jsp?spt_code=<%=sptCode%>&spt_name=<%=sptName%>&spot_doc_no=${review.spot_doc_no}" style="background-color: white">                             
                                <span class="sound_only">열린 분류 </span>삭제</a>
                                </c:if>
                            </div>
                        </div>
                    </li>
				 </c:forEach>
				 </c:if>
				 
				 <c:if test="${ empty list}">
				 	<li>
                     	작성된 리뷰가 없습니다.
                    </li>
				 </c:if>

                </ol>
            </section>
        </div>

        <nav class="pg_wrap"> 
        
        <span class="pg">
  		<% for(int i=1; i<= totalPage; i++){ %>
		 <a href="review_spot.jsp?spt_code=<%=sptCode%>&spt_name=<%=sptName%>&currentPage=<%= i %>" class="pg_page"><%= i %></a> 
		<%} %>
		
		</span>
		
		</nav>


        <script src="https://cmtour.co.kr/js/viewimageresize.js"></script>
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

