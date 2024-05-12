<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 찾기 | 알빠노관광</title>
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "../index.html";
var g5_bbs_url   = "index.html";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
    <%@ include file="common_head.jsp" %>
</head>
<body>

<!-- 회원정보 찾기 시작 { -->
<div id="find_info" class="new_win">
    <h1 id="win_title">회원정보 찾기</h1>
    <div class="new_win_con">
        <form name="fpasswordlost" action="find_password_proc" onsubmit="return fpasswordlost_submit(this);" method="post" autocomplete="off">
        <fieldset id="info_fs">
            <p>
                회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
                해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.
            </p>
            <label for="mb_email" class="sound_only">E-mail 주소<strong class="sound_only">필수</strong></label>
            <input type="text" name="mb_email" id="mb_email" required class="required frm_input full_input email" size="30" placeholder="E-mail 주소">
        </fieldset>
            <div class="win_btn">
            <button type="submit" class="btn_submit">확인</button>
            <button type="button" onclick="window.close();" class="btn_close">창닫기</button>  
        </div>
        </form>
        	<p id="user_id_display" style="display:none;"></p>
    </div>
</div>

<script>
function fpasswordlost_submit(f)
{
    /* if (!chk_captcha()) return false;

    return true; */
	// 이메일 입력값 가져오기
    var email = document.getElementById('mb_email').value;
    
    // 이메일이 비어 있는지 확인
    if(email.trim() === '') {
        alert('이메일을 입력해주세요.');
        return false;
    }
    
    // 여기에 이메일을 서버로 보내고, 해당하는 아이디를 받아오는 로직을 구현합니다.
    // 이 부분은 서버와의 통신을 통해 이메일에 해당하는 아이디를 가져오는 과정을 포함합니다.
    // 임시로 아이디를 지정하겠습니다.
    var userId = 'your_username'; // 이 부분을 서버에서 받은 아이디로 대체해야 합니다.
    
    // 아이디를 보여줄 요소 가져오기
    var userIdDisplay = document.getElementById('user_id_display');
    
    // 아이디가 존재하면 보여주고, 존재하지 않으면 알림
    if(userId) {
        userIdDisplay.innerText = "회원님의 아이디는 '" + userId + "' 입니다.";
        userIdDisplay.style.display = 'block'; // 아이디 보여주기
    } else {
        alert('입력하신 이메일로 등록된 아이디가 없습니다.');
    }

    // 폼 제출 중단
    return false;
}

$(function() {
    var sw = screen.width;
    var sh = screen.height;
    var cw = document.body.clientWidth;
    var ch = document.body.clientHeight;
    var top  = sh / 2 - ch / 2 - 100;
    var left = sw / 2 - cw / 2;
    moveTo(left, top);
});




</script>
<!-- } 회원정보 찾기 끝 -->

<%--스크롤_애니메이션_리셋--%>
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>
