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

<!doctype html>
<html lang="ko">

<head>
    <title>회원 정보 수정 | 경주시티투어</title>
    <%@ include file="common_head.jsp" %>
  </head>
<body>

<%@include file="common_m_header.jsp"%>
<%@include file="common_desktop_header.jsp"%>
<% 
	String userId=(String)session.getAttribute("idKey");
	
	try{
		UserInfoManagementDAO uiDAO=UserInfoManagementDAO.getInstance();
		UserInfoVO uiVO=uiDAO.selectInfo(id);
		
		pageContext.setAttribute("uiVO", uiVO);
	}catch(SQLException se){
		se.printStackTrace();
	}
%> 
<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('http://127.0.0.1/front_util/images/sub_visual02.jpg') no-repeat top center;">
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
                            <li><a href="list_spot.jsp" target="_self">관광지</a></li>
                            <li><a href="list_restaurant.jsp" target="_self">맛집</a></li>
                            <li><a href="booking.jsp" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>회원 정보 수정</span>
                        <ul>
                            <li><a href="logout.jsp" target="_self">로그아웃</a></li>
                            <li><a href="edit_profile.jsp" target="_self">정보수정</a></li>
                            <li><a href="policy.jsp" target="_self">개인정보처리방침</a></li>
                            <li><a href="service_terms.jsp" target="_self">이용약관</a></li>
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

		<c:if test="${ empty uiVO }">
			<c:redirect url="http://http://127.0.0.1/view/index_user.jsp"/>
		</c:if>

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

                        <!-- <h2>회원정보 수정</h2> -->
					    <ul>
					     <li>
					            <label for="pwd">기존 비밀번호<strong class="sound_only">필수</strong></label>
					            <input type="password" id="pass" name="pass" value="" class="frm_input full_input  size="10" placeholder="기존 비밀번호"/>
					        </li> 
					        <li>
					            <label for="newPwd">새 비밀번호<strong class="sound_only">필수</strong></label>
					            <input type="password" id="newPass" name="newPass" value="" class="frm_input full_input  size="10" placeholder="새 비밀번호"/>
					        </li>
					        <li>
					            <label for="newPwd2">새 비밀번호 확인<strong class="sound_only">필수</strong></label>
					            <input type="password" id="newPass2" name="newPass2" value="" class="frm_input full_input  size="10" placeholder="새 비밀번호"/>
					        </li>
					        <li>
					            <label for="name">이름<strong class="sound_only">필수</strong></label>
					            <input type="text" id="name" name="name" value="${ uiVO.name }" class="frm_input full_input  readonly" size="10" placeholder="이름">
					        </li>
					        <li>
					            <label for="email">E-mail<strong class="sound_only">필수</strong></label>
					            <input type="text" name="email" value="${ uiVO.email }" id="email" required class="frm_input email full_input required" size="70" maxlength="100" placeholder="E-mail">
					        </li>
					        <li>
					            <label for="tel">휴대폰번호<strong class="sound_only">필수</strong></label>
					            <input type="text" name="tel" value="${ uiVO.tel }" id="tel" required class="frm_input full_input required" maxlength="20" placeholder="휴대폰번호">
					        </li>
					    </ul>
                <!-- </div>
                <div class="btn_confirm"> -->
                    <a href="https://cmtour.co.kr" class="btn_close">취소</a>
                    <button type="submit" id="btn_submit" class="btn_submit" accesskey="s">정보 변경</button>
                    </form>
                </div>
        <script>
            $(function() {
                $("#reg_zip_find").css("display", "inline-block");
				
                $("#btn_submit").click(function(){
                	//$("#myForm").submit();
                	chkNull();
                });//click
                
            });//ready
            
            function chkNull(){
            	/* if($("#pass").val().trim() ==""){
            		alert("기존 비밀번호를 입력해주세요.");
            		$("#pass").focus();
            		return;
            	}//end if */
            	if($("#newPass").val().trim() ==""){
            		alert("새 비밀번호를 입력해주세요.");
            		$("#newPass").focus();
            		return;
            	}//end if
            	if($("#newPass2").val().trim() ==""){
            		alert("변경할 비밀번호를 확인해주세요.");
            		$("#newPass2").focus();
            		return;
            	}//end if
            	if($("#name").val().trim() ==""){
            		alert("이름을 입력해주세요.");
            		$("#name").focus();
            		return;
            	}//end if
            	if($("#email").val().trim() ==""){
            		alert("이메일 주소를 입력해주세요.");
            		$("#email").focus();
            		return;
            	}//end if
            	if($("#tel").val().trim() ==""){
            		alert("연락처를 입력해주세요.");
            		$("#tel").focus();
            		return;
            	}//end if
            	
            	$("#myForm")[0].action="edit_profile_proc.jsp";
            	alert($("#myForm")[0].action);
            	$("#myForm").submit();
            	
            }//chkNull

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
            
            /*
            document.querySelector("#myForm").addEventListener("submit",function(event){
            	var pwd1=document.querySelector("#newPass").value;
            	var pwd2=document.querySelector("#newPass2").value;
            	
            	if(pwd1 != pwd2 ){
            		alert("비밀번호를 확인하세요!");
            		event.preventDefault();
            	}
            });*/

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

<script src="http://127.0.0.1/front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>
