<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 02:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@page import="vo.QnaVO" %>
<%@ page import="dao.QnaDAO" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String login_id =(String)session.getAttribute("idKey");
if(login_id == null){ %>
	<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login.jsp";
	</script>
	<% 
	}
	%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>질문답변 글쓰기 | 알빠노관광</title>

    <%@ include file="common_head.jsp" %>
</head>

<body>
<jsp:useBean id="qVO" class="vo.QnaVO" scope="page"/>
<jsp:setProperty property="*" name="qVO"/>
<% request.setCharacterEncoding("UTF-8"); %>

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
                        <span>고객센터</span>
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
                        <span>질문답변</span>
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
            <li>질문답변</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 질문답변</p>
        <p class="stitle"></p>


    
        <section id="bo_w">
            <h2 class="sound_only">질문답변</h2>

           
          <form name="questionForm" id="questionForm" action="question_process.jsp" method="post">
                <div class="write_div">
                    <label for="wr_subject" class="sound_only">제목 <strong>필수</strong></label>
                    <div id="autosave_wrapper write_div">
                       <input type="text" name="ASK_TITLE" required
                               class="frm_input full_input required" placeholder="제목을 적으세요" size="50" maxlength="20">

                    </div>
                </div>
                <div class="write_div">
                    <label for="wr_content" class="sound_only">내용<strong>필수</strong></label>
                    <div class="wr_content smarteditor2">
                       <textarea name="ASK_CONTENTS" placeholder="내용을 적으세요" maxlength="65536"
                                  style="width:100%;height:300px"></textarea>

                    </div>
                </div>
                <div class="btn_confirm write_div" style="text-align:center;">
                    <a href="qna.jsp" class="btn_cancel btn">취소</a>
                    <button type="submit" id="submitBtn" class="btn_submit btn">작성완료</button>
				</div>
            </form>
        </section>
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
