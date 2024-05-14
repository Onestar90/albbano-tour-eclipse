<%@page import="java.sql.SQLException"%>
<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입 폼에서 입력된 값을 받는 jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<title>회원 가입 | 알빠노관광</title>
<link rel="stylesheet" href="https://cmtour.co.kr/theme/cmtour/css/default.css?ver=171222">
<link rel="stylesheet" href="https://cmtour.co.kr/theme/cmtour/skin/member/basic_h/style.css?ver=171222">


<%@ include file="common_head.jsp" %>


<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual06.jpg') no-repeat top center;"></div>
    </div>
</section>

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
                <ul class="">
                    <li>
                        <span>맴버쉽</span>
                        <ul>
                            <li><a href="/theme/cmtour/html/business/new_01.php" target="_self">관광지</a></li>
                            <li><a href="/bbs/board.php?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="/theme/cmtour/html/business/map_info_01.php" target="_self">투어예약</a></li>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>회원 가입</span>
                        <ul>
                            <li><a href="https://cmtour.co.kr/bbs/login.php" target="_self">로그인</a></li>


                            <li><a href="https://cmtour.co.kr/bbs/register.php" target="_self">회원가입</a></li>


                            <li><a href="https://cmtour.co.kr/bbs/content.php?co_id=privacy" target="_self">개인정보처리방침</a>
                            </li>


                            <li><a href="https://cmtour.co.kr/bbs/content.php?co_id=provision" target="_self">이용약관</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li>맴버쉽</li>
            <li></li>
            <li>회원 가입</li>
        </div>
        <div class="title">맴버쉽</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">

        <div class="bg_vline"></div>
        <p class="eng"><em></em> 회원 가입</p>
        <p class="stitle"></p>




<style type="text/css">
	
	
</style>
<script type="text/javascript">
	function goToMainPage() {
	    window.location.href = 'index_user.jsp'; 
	}
</script>
</head>
<!-- <body> -->
<div>
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="uiVO" class="vo.UserInfoVO" scope="page"/>
<jsp:setProperty property="*" name="uiVO"/>

<%-- ${ uiVO } --%>
<c:catch var="e"> 
<%
//입력값 전처리
uiVO.setEmail( uiVO.getEmail1()+"@"+uiVO.getEmail2());

/* uiVO.setIp(request.getRemoteAddr());
uiVO.setPass(DataEncrypt.messageDigest("MD5", uiVO.getPass())); */

//db 추가
UserInfoManagementDAO uiDAO = UserInfoManagementDAO.getInstance();
try{
	if(!"".equals(uiDAO.selectId(uiVO.getId()))){
%>
	<!-- 입력하신 아이디는 이미 사용 중 입니다.<br/>
	다른 아이디로 재가입 해주세요.<br>
	<a href="#void" onclick="history.back()">뒤로</a> -->
<%
	}else{
	uiDAO.insertMember(uiVO);
	uiDAO.insertPassword(uiVO.getId(), uiVO);
}
}catch(SQLException se){
	se.printStackTrace();
}
%>
<body>
<div id="success">
	<div id="result">
		<h4>회원가입해주셔서 감사합니다.</h4>
		<strong>${ param.name }</strong>님의 회원가입을 축하드립니다.<br>
		입력하신 정보는 아래와 같습니다.<br/>
		<ul>
			<li><strong>아이디 : </strong><c:out value="${ param.id }"/></li>
			<li><strong>이메일 : </strong><c:out value="${ param.email1 }@${param.email2 }"/></li> 
			<li><strong>전화번호 : </strong><c:out value="${ param.tel }"/></li>
		</ul>
		
	</div>
	<div style="text-align: center; margin-top: 20px;">
    <button onclick="goToMainPage()" class="btn btn-primary">메인화면으로 이동</button>
</div>
</div>

</c:catch>
<c:if test="${ not empty e }">
${ e }
죄송합니다. 잠시 후 다시 시도해주세요.<br/>
<a href="user_index.jsp">메인으로</a>

<a href="#void" onclick="history.back()">뒤로</a>
</c:if>

</div>
</body>
</html>