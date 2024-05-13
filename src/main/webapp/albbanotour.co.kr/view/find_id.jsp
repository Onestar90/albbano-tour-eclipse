<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오전 11:17
To change this template use File | Settings | File Templates.
--%>
<%-- <%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String id = (String)session.getAttribute("idKey");
	if(id!=null){
%>
	<script>
	alert("로그인 되었습니다.");
	location.href = "index_user.jsp";
	</script>
	
<% }%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

            <form name="idfind" action="find_id_proc.jsp" method="post">

            <fieldset id="login_fs">
                <legend>회원로그인</legend>
                <label for="email" class="sound_only">이메일<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="email" id="email" required class="frm_input required" size="20"
                       maxLength="20" placeholder="EMAIL">
                <label for="name" class="sound_only">이름<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="name" id="name" required class="frm_input required" size="20"
                       maxLength="20" placeholder="NAME">
                <button type="submit" name="enter" value="찾기" onClick="id_search()">아이디 찾기</button>
                <!-- <button type="button" onclick="openIdSearchPage()">아이디 찾기</button> -->
                <div id="login_info">
                    <!-- <div class="login_if_auto chk_box">
                        <input type="checkbox" name="auto_login" id="login_auto_login" class="selec_chk">
                        <label for="login_auto_login"><span></span> 로그인 기억하기 </label>
                    </div> -->
                    <div class="login_if_lpl">
                        <a href="find_password.jsp">비밀번호찾기 </a>
                    </div>
                </div>
            </fieldset>
            </form>
    </div>
</div>

<script>
function id_search(){
	var frm = document.idfind;
	
	if(frm.email.value.length < 1){
		 alert("이메일을 입력해주세요");
		 return;	
	}
	if(frm.name.value.length < 1){
		 alert("이름을 입력해주세요");
		 return;	
	}
	
}
 

</script>
<!-- } 로그인 끝 -->


<%--스크롤_애니메이션_리셋--%>
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>
