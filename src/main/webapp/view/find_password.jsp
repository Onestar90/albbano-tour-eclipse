<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오전 11:17
To change this template use File | Settings | File Templates.
--%>
<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인 | 알빠노관광</title>

    <%@ include file="common_head.jsp" %>
</head>

<body>
<!-- 로그인 시작 { -->
<div id="mb_login" class="mbskin">
    <div class="mbskin_box">
        <h1>로그인</h1>
        <div><a href="index_user.jsp"><h2 style="font-size: 2rem; margin: 20px auto"><img
                src="http://127.0.0.1/front_util/images/top_logo.png" alt="처음으로 "></h2></a></div>

            <form name="passfind" action="find_password_proc.jsp" method="post">

            <fieldset id="login_fs">
                <legend>회원로그인</legend>
                <label for="email" class="sound_only">이메일<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="email" id="email" required class="frm_input required" size="20"
                       maxLength="20" placeholder="EMAIL">
                <label for="id" class="sound_only">아이디<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="id" id="id" required class="frm_input required" size="20"
                       maxLength="20" placeholder="ID">
                <button type="submit" class="btn_b01 btn" name="enter" value="찾기" onClick="pass_search()">비밀번호 찾기</button>
                <!-- <button type="button" class="btn_submit" onclick="confirmCancel()">취소</button> -->
                    <!-- <div class="login_if_auto chk_box">
                        <input type="checkbox" name="auto_login" id="login_auto_login" class="selec_chk">
                        <label for="login_auto_login"><span></span> 로그인 기억하기 </label>
                    </div> -->
                <button type="button" class="btn_b01 btn" name="enter" value="찾기" onClick="window.location.href='login.jsp';">로그인하기</button>
            </fieldset>
            </form>
    </div>
</div>

<script>
function pass_search(){
	var frm = document.passfind;
	
	if(frm.email.value.length < 1){
		 alert("이메일을 입력해주세요");
		 return;	
	}
	if(frm.id.value.length < 1){
		 alert("아이디를 입력해주세요");
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
