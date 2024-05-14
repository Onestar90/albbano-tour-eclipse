<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오전 11:17
To change this template use File | Settings | File Templates.
--%>
<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String id = (String)session.getAttribute("idKey");
	if(id!=null){
%>
	<script>
	alert("로그인 되었습니다.");
	location.href = "login_ok.jsp";
	</script>
	
<% } %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인 | 알빠노관광</title>

    <script>
        var g5_url = "../index.html";
        var g5_bbs_url = "index.html";
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
<!-- 로그인 시작 { -->
<div id="mb_login" class="mbskin">
    <div class="mbskin_box">
        <h1>로그인</h1>
        <div><a href="index_user.jsp"><h2 style="font-size: 2rem; margin: 20px auto"><img
                src="../front_util/images/top_logo.png" alt="처음으로 "></h2></a></div>

        <div class="mb_log_cate">
            <h2>로그인 </h2>
            <a href="register.jsp" class="join">회원가입 </a>
        </div>
        <!-- <form name="flogin" action="https://cmtour.co.kr/bbs/login_check.php" onsubmit="return flogin_submit(this);"
              method="post">
            <input type="hidden" name="url" value="https%3A%2F%2Fcmtour.co.kr"> -->
            <form action="login_proc.jsp" method="post">

            <fieldset id="login_fs">
                <legend>회원로그인</legend>
                <label for="login_id" class="sound_only">회원아이디<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="mb_id" id="login_id" required class="frm_input required" size="20"
                       maxLength="20" placeholder="ID">
                <label for="login_pw" class="sound_only">비밀번호<strong class="sound_only"> 필수</strong></label>
                <input type="password" name="mb_password" id="login_pw" required class="frm_input required" size="20"
                       maxLength="20" placeholder="PASSWORD">
                <button type="submit" class="btn_submit">로그인</button>
                <div id="login_info">
                    
                    <div class="login_if_lpl">
                        <a href="find_id.jsp" >아이디찾기 </a>|
                        <a href="find_password.jsp" >비밀번호찾기 </a>
                    </div>
                </div>
            </fieldset>
            </form>
    </div>
</div>

<script>
    jQuery(function ($) {
        $("#login_auto_login").click(function () {
            if (this.checked) {
                this.checked = confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?");
            }
        });
    });

    function flogin_submit(f) {
        if ($(document.body).triggerHandler('login_sumit', [f, 'flogin']) !== false) {
            return true;
        }
        return false;
    }
</script>
<!-- } 로그인 끝 -->


<%--스크롤_애니메이션_리셋--%>
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>
