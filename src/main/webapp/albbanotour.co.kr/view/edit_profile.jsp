<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-15
Time: 오전 11:19
To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.UserInfoManagementDAO"%>
<%@page import="vo.UserInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%
request.setCharacterEncoding("UTF-8");

String userId = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String tel = request.getParameter("tel");

UserInfoManagementDAO uiDAO = UserInfoManagementDAO.getInstance();
UserInfoVO uiVO = uiDAO.selectInfo(userId);
pageContext.setAttribute("uiVO", uiVO);

%>
<%
String login_id=(String)session.getAttribute("idKey");
if(login_id == null){ %>

<script>
location.href = "login.jsp";
</script>
 

<% }%> --%>
<%-- <%
	String id=(String)session.getAttribute("idKey");
	UserInfoVO uiVO=UserInfoManagementDAO.getInstance().selectInfo(userId);
%> --%>
<!doctype html>
<html lang="ko">

<head>
    <title>회원 정보 수정 | 경주시티투어</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url       = "index_user.jsp";
        var g5_bbs_url   = "index_user.jsp";
        var g5_is_member = "1";
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





<%@include file="common_m_header.jsp"%>
<%@include file="common_desktop_header.jsp"%>

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
                        <span>맴버쉽</span>
                        <ul>
                            <li><a href="/theme/cmtour/html/business/new_01.php" target="_self">투어소개</a></li>
                            <li><a href="/bbs/board.php?bo_table=booking" target="_self">예약/조회</a></li>
                            <li><a href="/theme/cmtour/html/business/map_info_01.php" target="_self">투어예약</a></li>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>회원 정보 수정</span>
                        <ul>
                            <li><a href="https://cmtour.co.kr/bbs/logout.php" target="_self">로그아웃</a></li>

                            <li><a href="https://cmtour.co.kr/bbs/member_confirm.php?url=https://cmtour.co.kr/bbs/register_form.php" target="_self">정보수정</a></li>

                            <li><a href="https://cmtour.co.kr/bbs/content.php?co_id=privacy" target="_self">개인정보처리방침</a></li>

                            <li><a href="https://cmtour.co.kr/bbs/content.php?co_id=provision" target="_self">이용약관</a></li>

                            <li><a href="https://cmtour.co.kr/bbs/member_confirm.php?url=https://cmtour.co.kr/bbs/member_leave.php" target="_self">회원탈퇴</a></li>



                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li>맴버쉽</li>					<li></li>					<li>회원 정보 수정</li>
        </div>
        <div class="title">맴버쉽</div>
        <p class="normal_txt">	</p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 회원 정보 수정</p>
        <p class="stitle"></p>




        <!-- 회원정보 입력/수정 시작 { -->

        <div class="container">
            <script src="https://cmtour.co.kr/js/jquery.register_form.js"></script>
				<form action="edit_profile_proc.jsp" method="post" id="myForm">
            <!-- <form id="edit_profile" name="edit_profile" action="edit_profile_proc.jsp" onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off"> -->
                <input type="hidden" name="w" value="u">
                <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php%3Fprovider%3DNaver">
                <input type="hidden" name="agree" value="">
                <input type="hidden" name="agree2" value="">
                <input type="hidden" name="cert_type" value="">
                <input type="hidden" name="cert_no" value="">
                <input type="hidden" name="mb_sex" value="">
                <input type="hidden" name="mb_nick_default" value="">
                <input type="hidden" name="mb_nick" value="">

                <%-- <div id="register_form" class="form_01">
                    <div class="register_form_inner">
                        <h2>회원정보 수정</h2>
                        <ul>
                            <li>
                                <!-- <label for="id">
							    아이디<strong class="sound_only">필수</strong>
							    <button type="button" class="tooltip_icon">
							        <i class="fa fa-question-circle-o" aria-hidden="true"></i>
							        <span class="sound_only">설명보기</span>
							    </button>
							    <span class="tooltip">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
							</label> -->
							<input type="text" name="id" value="<%= uiVO.getId() %>" id="id" readonly="readonly" class="frm_input full_input readonly" minlength="3" maxlength="20">
							<span id="msg_mb_id"></span>
							</li>
							<li class="half_input left_input margin_input">
							    <label for="pass">비밀번호<strong class="sound_only">필수</strong></label>
							    <input type="password" name="pass" id="pass" class="frm_input full_input" value="<%= uiVO.getPass() %>" minlength="3" maxlength="20" >
							</li>
							<li class="half_input left_input">
							    <label for="reg_mb_password_re">비밀번호 변경<strong class="sound_only">필수</strong></label>
							    <input type="password" name="mb_password_re" id="reg_mb_password_re" class="frm_input full_input" minlength="3" maxlength="20" placeholder="비밀번호 확인">
							</li>
                        </ul>
                    </div> --%>

                        <!-- <h2>회원정보 수정</h2> -->
                        
					    <ul>
					        <li>
					            <label for="pwd">기존 비밀번호<strong class="sound_only">필수</strong></label>
					            <input type="password" id="pass" name="pass" value="" readonly class="frm_input full_input  size="10" placeholder="기존 비밀번호"/>
					        </li>
					        <li>
					            <label for="newPwd">새 비밀번호<strong class="sound_only">필수</strong></label>
					            <input type="password" id="newPass" name="newPass" value="" readonly class="frm_input full_input  size="10" placeholder="새 비밀번호"/>
					        </li>
					        <li>
					            <label for="newPwd2">새 비밀번호 확인<strong class="sound_only">필수</strong></label>
					            <input type="password" id="newPass2" name="newPass2" value="" readonly class="frm_input full_input  size="10" placeholder="새 비밀번호"/>
					        </li>
					        <li>
					            <label for="name">이름<strong class="sound_only">필수</strong></label>
					            <input type="text" id="name" name="name" value="" readonly class="frm_input full_input  readonly" size="10" placeholder="이름">
					        </li>
					        <li>
					            <label for="email">E-mail<strong class="sound_only">필수</strong></label>
					            <input type="text" name="email" value="" id="email" required class="frm_input email full_input required" size="70" maxlength="100" placeholder="E-mail">
					        </li>
					        <li>
					            <label for="tel">휴대폰번호<strong class="sound_only">필수</strong></label>
					            <input type="text" name="tel" value="" id="tel" required class="frm_input full_input required" maxlength="20" placeholder="휴대폰번호">
					        </li>
					    </ul>
                <!-- </div>
                <div class="btn_confirm"> -->
                    <a href="https://cmtour.co.kr" class="btn_close">취소</a>
                    <button type="submit" id="btn_submit" class="btn_submit" accesskey="s">정보수정</button>
                    </form>
                </div>
        <script>
            $(function() {
                $("#reg_zip_find").css("display", "inline-block");

            });

                /* if (!chk_captcha()) return false;

                document.getElementById("btn_submit").disabled = "disabled";

                return true;
            }

            jQuery(function($){
                //tooltip
                $(document).on("click", ".tooltip_icon", function(e){
                    $(this).next(".tooltip").fadeIn(400).css("display","inline-block");
                }).on("mouseout", ".tooltip_icon", function(e){
                    $(this).next(".tooltip").fadeOut();
                });
            }); */
            
            document.querySelector("#myForm").addEventListener("submit",function(event){
            	var pwd1=document.querySelector("#newPass").value;
            	var pwd2=document.querySelector("#newPass2").value;
            	
            	if(pwd1 != pwd2 ){
            		alert("비밀번호를 확인하세요!");
            		event.preventDefault();
            	}
            });

        </script>

        <!-- } 회원정보 입력/수정 끝 -->
    </div>
</section>

<footer>
    <%@ include file="common_footer.jsp" %>
</footer>
<%--footer_jsp_적용_끝--%>

<%@ include file="common_m_footer.jsp" %>
<%@ include file="common_sidebar.jsp" %>
<%@ include file="common_lower_container.jsp" %>

<script src="https://cmtour.co.kr/theme/cmtour/html/css_js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>
