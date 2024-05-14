<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 12:33
To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
NoticeDAO noticeDAO= NoticeDAO.getInstance();
List<NoticeVO> list=noticeDAO.selectAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>공지사항 1 페이지 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "	../index.html";
        var g5_bbs_url = "index.html"; 
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "notice";
        var g5_sca = "";
        var g5_editor = "smarteditor2";
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
             style="background:url('../front_util/images/sub_visual02.jpg') no-repeat top center;">
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
                            <li><a href="tour_course.jsp" target="_self">관광지</a></li>
                            <li><a href="booking.jsp?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="../theme/albbanotour/html/business/map_info_01.html" target="_self">투어예약</a></li>
                            <li><a href="main_notice.html?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>공지사항</span>
                        <ul>
                            <li><a href="main_notice.html?bo_table=notice" target="_self">공지사항</a></li>


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
            <li></li>
            <li>공지사항</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 공지사항</p>
        <p class="stitle"></p>


        <!-- 게시판 목록 시작 { -->
        <div id="bo_list" style="width:100%">


            <!-- 게시판 페이지 정보 및 버튼 시작 { -->
            <div id="bo_btn_top">
                <div id="bo_list_total">
                    <span>Total 6건</span>
                    1 페이지
                </div>

                <ul class="btn_bo_user">
                    <li><a href="rss8497.php?bo_table=notice" class="btn_b01 btn"><i class="fa fa-rss"
                                                                                     aria-hidden="true"></i> RSS</a>
                    </li>
                   
                </ul>
            </div>
            <!-- } 게시판 페이지 정보 및 버튼 끝 -->

            <!-- 게시판 카테고리 시작 { -->
            <!-- } 게시판 카테고리 끝 -->

            <form name="fboardlist" id="fboardlist" action="https://cmtour.co.kr/bbs/board_list_update.php"
                  onsubmit="return fboardlist_submit(this);" method="post">
                <input type="hidden" name="bo_table" value="notice">
                <input type="hidden" name="sfl" value="">
                <input type="hidden" name="stx" value="">
                <input type="hidden" name="spt" value="">
                <input type="hidden" name="sca" value="">
                <input type="hidden" name="sst" value="wr_num, wr_reply">
                <input type="hidden" name="sod" value="">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="sw" value="">

                <div class="tbl_head01 tbl_wrap">
                    <table>
                        <caption>공지사항 목록</caption>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col" class="lview">글쓴이</th>
                            <th scope="col" class="lview"><a
                                    href="board0c74.html?bo_table=notice&amp;sop=and&amp;sst=wr_hit&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">조회
                                <i class="fa fa-sort" aria-hidden="true"></i></a></th>
                            <th scope="col" class="lview"><a
                                    href="boarda46b.html?bo_table=notice&amp;sop=and&amp;sst=wr_datetime&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">날짜
                                <i class="fa fa-sort" aria-hidden="true"></i></a></th>
                        </tr>
                        </thead>
                        <tbody>
							<c:forEach var="notice" items="${ list }">
							<c:if test="${notice.del_yn ne 'y'}">
                        <tr class="bo_notice">
                            <td class="td_num2">
                                <strong class="notice_icon"><i class="fa fa-bullhorn" aria-hidden="true"></i><span
                                        class="sound_only">공지</span></strong></td>

                            <td class="td_subject" style="padding-left:0px">

                                <div class="bo_tit">
                                
                                    <a href="desc_notice.jsp?noticeNo=${notice.doc_No }">
                                        ${notice.title }
                                    </a>
                                    <i class="fa fa-heart" aria-hidden="true"></i></div>
                                <div class="mview">
                                    <div class="gall_info">
                                        <span class="sv_member">${notice.id}</span></div>
                                    <div class="gall_info">
                                        <span class="sound_only">조회 </span>Hit 1842 <span class="gall_date"><span
                                            class="sound_only">작성일 </span>${notice.create_Date}</span>
                                    </div>
                                    
                                </div>
                            </td>
                            <td class="td_name sv_use lview"><span class="sv_member">관리자</span></td>
                            <td class="td_num lview">1842</td>
                            <td class="td_datetime lview"><c:out value="${notice.create_Date}"/></td>

                        </tr>
                        	</c:if>
							</c:forEach>
                        </tbody>
                    </table>
                </div>


            </form>

            <!-- 게시판 검색 시작 { -->
            <fieldset id="bo_sch">
                <legend>게시물 검색</legend>

                <form name="fsearch" method="get">
                    <input type="hidden" name="bo_table" value="notice">
                    <input type="hidden" name="sca" value="">
                    <input type="hidden" name="sop" value="and">
                    <label for="sfl" class="sound_only">검색대상</label>
                    <select name="sfl" id="sfl">
                        <option value="wr_subject">제목</option>
                        <option value="wr_content">내용</option>
                        <option value="wr_subject||wr_content">제목+내용</option>
                        <option value="mb_id,1">회원아이디</option>
                        <option value="mb_id,0">회원아이디(코)</option>
                        <option value="wr_name,1">글쓴이</option>
                        <option value="wr_name,0">글쓴이(코)</option>
                    </select>
                    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                    <input type="text" name="stx" value="" required id="stx" class="sch_input" size="25" maxlength="20"
                           placeholder="검색어를 입력해주세요">
                    <button type="submit" value="검색" class="sch_btn"><i class="fa fa-search"
                                                                        aria-hidden="true"></i><span class="sound_only">검색</span>
                    </button>
                </form>
            </fieldset>
            <!-- } 게시판 검색 끝 -->
        </div>


        <!-- 페이지 -->


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

