<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 02:16
To change this template use File | Settings | File Templates.
--%>
<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@page import="vo.QnaVO" %>
<%@page import="java.util.List" %>
<%@page import="dao.QnaDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String login_id =(String)session.getAttribute("idKey");
if(login_id == null){ %>
	<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login.jsp";
	</script>

	<% }%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>질문답변 1 페이지 | 알빠노관광</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../index.html";
        var g5_bbs_url = "index.html";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "qa";
        var g5_sca = "";
        var g5_editor = "smarteditor2";
        var g5_cookie_domain = "";
    </script>
    <script>
    window.onpageshow = function(event) { //뒤로가기시 페이지를 새로고침하는 코드
        if (event.persisted) {
            window.location.reload();
        }
    };
    $(function() {
        function faq_open(el) {
            var $con = $(el).closest("li").find(".con_inner");

            if ($con.is(":visible")) {
                $con.slideUp();
            } else {
                $(".con_inner").slideUp(); // 모든 슬라이드 닫기
                $con.slideDown(function() {
                    // 이미지 리사이즈
                    $con.viewimageresize2();
                });
            }
            return false;
        }

        $(".bo_tit a").on("click", function() {
            var $answerRow = $(this).closest("tr").next(".answer-row");
            $answerRow.slideToggle(); // 제목 클릭 시 답변 열고 닫기 토글
        });

        $(".closer_btn").on("click", function() {
            $(this).closest(".answer-row").slideUp(); // 버튼 클릭 시 답변 닫기
        });
    }); 
    </script>
    <%@ include file="common_head.jsp" %>
</head>

<body>
<jsp:useBean id="qsVO" class="vo.QnaSearchVO" scope="page"/>
<jsp:setProperty property="*" name="qsVO"/>

	
<%
QnaDAO qDao = QnaDAO.getInstance();


int totalCount=qDao.selecttotalCount(qsVO);
int pageScale=10;

int totalPage=(int)Math.ceil((double)totalCount/pageScale);

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

List<QnaVO> list = qDao.selectQna(qsVO, login_id);

pageContext.setAttribute("list", list);




String ASK_DOC_NO = request.getParameter("ASK_DOC_NO");
String ID = request.getParameter("ID");





QnaDAO qDAO= QnaDAO.getInstance();
QnaVO qVO = qDAO.selectmyQna(ASK_DOC_NO, ID);
pageContext.setAttribute("qVO", qVO);



%> 
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual05.jpg') no-repeat top center;"></div>
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
                            <li><a href="tour_course.jsp" target="_self">관광지</a></li>
                            <li><a href="booking.jsp?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="../theme/albbanotour/html/business/map_info_01.html" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>질문답변</span>
                        <ul>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">공지사항</a></li>


                            <li><a href="faq.jsp?fm_id=1" target="_self">자주 묻는 질문</a></li>


                            <li><a href="#void" target="_self">질문답변</a></li>


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
            <li>질문답변</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 질문답변</p>
        <p class="stitle"></p>


        <!-- 게시판 목록 시작 { -->
        <div id="bo_list" style="width:100%">


            <!-- 게시판 페이지 정보 및 버튼 시작 { -->
            <div id="bo_btn_top">
                <div id="bo_list_total">
                    
                </div>

                <ul class="btn_bo_user">
                    <li><a href="question.jsp" class="btn_b02 btn"><i class="fas fa-pencil-alt"></i> 글쓰기</a></li>        </ul>
            </div>
            <!-- } 게시판 페이지 정보 및 버튼 끝 -->

            <!-- 게시판 카테고리 시작 { -->
            <!-- } 게시판 카테고리 끝 -->

           

                <div class="tbl_head01 tbl_wrap">
                    <table>
                        <caption>질문답변 목록</caption>
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">제목</th>
                            <th scope="col" class="lview">글쓴이</th>
                            
                            <th scope="col" class="lview"><a
                                    href="board62f0.html?bo_table=qa&amp;sop=and&amp;sst=wr_datetime&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">날짜
                                <i class="fa fa-sort" aria-hidden="true"></i></a></th>
                        </tr>
                        </thead>
                        <tbody>
                  
                <form method="post" name="frmDetail" id="frmDetail">       
 <c:forEach var="qna" items="${list}" varStatus="i">
 
                                <tr class="">
                                    <td class="td_num2"></td>
                                    <td class="td_subject" style="padding-left:0px">
                                   
                                   
                                        <div class="bo_tit">
                                            <c:choose>
                                                <c:when test="${not empty qna.ANSWER_CONTENTS}">
                                                    <!-- ANSWER_CONTENTS가 null이 아닌 경우에는 클릭 이벤트 처리 -->
                                                    <a href="javascript:void(0);" onclick="toggleAnswer(${i.index})">
                                                        <c:out value="${qna.ASK_TITLE}"/>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- ANSWER_CONTENTS가 null인 경우에는 링크 작동 -->
                                                    <a href="question_read_frm.jsp?ASK_DOC_NO=${qna.ASK_DOC_NO}">
                                                        <c:out value="${qna.ASK_TITLE}"/>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                        </div>
                                        <c:choose>
                                    <c:when test="${not empty qna.ANSWER_CONTENTS}">
                                    문의답변이 달렸습니다.
                                    </c:when>
                                    </c:choose>
                                    </td>
                                    <td class="td_name sv_use lview">
                                        <span class="sv_member">
                                            <c:out value="${qna.ID}"/>
                                        </span>
                                    </td>
                                    <td class="td_datetime lview">
                                        <c:out value="${qna.CREATE_DATE}"/>
                                    </td>
                                </tr>
                                <tr class="answer-row" style="display: none;">
                                    <td colspan="4">
                                        <div class="con_inner">
                                            <p>문의내용: <c:out value="${qna.ASK_CONTENTS}"/></p>
                                            <p>답변내용:<c:out value="${qna.ANSWER_CONTENTS}"/></p>
                                          
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>


       </form>                  
                   </tbody>
                    </table>
                </div>

           

         
        </div>


        <!-- 페이지 -->
        <nav class="pg_wrap">
        <span class="pg">
       
		<% for(int i=1; i<= totalPage; i++){ %>
		 <a href="qna.jsp?currentPage=<%= i %>" class="pg_page"><%= i %></a> 
		<%} %>
</span></nav>



        <!-- } 게시판 목록 끝 -->

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
