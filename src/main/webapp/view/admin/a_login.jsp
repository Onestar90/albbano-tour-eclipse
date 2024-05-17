<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://127.0.0.1/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://127.0.0.1/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	/* 가운데 정렬을 위한 스타일 */
        .center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 폼 넓이 조정을 위한 스타일 */
        .form-width {
            max-width: 400px;
            width: 100%;
        }
	
</style>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("id").addEventListener("keydown",keyChk);
	document.getElementById("pass").addEventListener("keydown",keyChk);
	document.getElementById("btnLogin").addEventListener("click",chkNull);
}//function

function keyChk( evt ){
	if(evt.which == 13 ){
		chkNull()
	}//end if
}//keyChk
function chkNull(  ){
	var loginFrm=document.frm;
	
	if(loginFrm.id.value == ""){
		alert("아이디 필수 입력");
		loginFrm.id.focus();
		return;
	}//end if
	
	if(loginFrm.pass.value == ""){
		alert("비밀번호 필수 입력");
		loginFrm.pass.focus();
		return;
	}//end if
	
	//입력값이 모두 입력되었다면 back-end로 전송
	loginFrm.submit();
	
}//keyChk
</script>
</head>
<body>
<main class="center">
    <form name="frm" action="a_login_process.jsp" method="post" class="form-signin form-width">
        <h1 class="h3 mb-3 fw-normal">관리자 페이지 로그인</h1>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="id" name="id" placeholder="Id">
            <label for="floatingInput">id</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

		<div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
      <label class="form-check-label" for="flexCheckDefault">
        Remember me
      </label>
    </div>
    <input type="button" id="btnLogin" class="btn btn-primary w-100 py-2" value="Sign in"/>
    <p class="mt-5 mb-3 text-body-secondary"></p>
    
    </form>
</main>

</body>
</html>