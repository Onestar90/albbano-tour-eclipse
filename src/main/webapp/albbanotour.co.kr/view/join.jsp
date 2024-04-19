<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원 가입 | 알빠노관광</title>
    <link rel="stylesheet" href="https://cmtour.co.kr/theme/cmtour/css/default.css?ver=171222">
    <link rel="stylesheet" href="https://cmtour.co.kr/theme/cmtour/skin/member/basic_h/style.css?ver=171222">


    </script>
    <%@ include file="common_head.jsp" %>
</head>

<body>
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

        <!-- 회원정보 입력/수정 시작 { -->

        <div class="register">
            <script src="https://cmtour.co.kr/js/jquery.register_form.js"></script>

            <form id="fregisterform" name="fregisterform" action="https://cmtour.co.kr/bbs/register_form_update.php"
                  onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data"
                  autocomplete="off">
                <input type="hidden" name="w" value="">
                <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php">
                <input type="hidden" name="agree" value="1">
                <input type="hidden" name="agree2" value="1">
                <input type="hidden" name="cert_type" value="">
                <input type="hidden" name="cert_no" value="">
                <input type="hidden" name="mb_sex" value="">
                <div id="register_form" class="form_01">
                    <div class="register_form_inner">
                        <h2>사이트 이용정보 입력</h2>
                        <ul>
                            <li>
                                <label for="reg_mb_id">
                                    아이디<strong class="sound_only">필수</strong>
                                    <button type="button" class="tooltip_icon">
                                        <i class="fa fa-question-circle-o" aria-hidden="true"></i>
                                        <span class="sound_only">설명보기</span></button>
                                    <span class="tooltip">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
                                </label>
                                <input type="text" name="mb_id" value="" id="reg_mb_id" required
                                       class="frm_input full_input required " minlength="3" maxlength="20"
                                       placeholder="아이디">
                                <span id="msg_mb_id"></span>
                            </li>
                            <li class="half_input left_input margin_input">
                                <label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label>
                                <input type="password" name="mb_password" id="reg_mb_password" required
                                       class="frm_input full_input required" minlength="3" maxlength="20"
                                       placeholder="비밀번호">
                            </li>
                            <li class="half_input left_input">
                                <label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label>
                                <input type="password" name="mb_password_re" id="reg_mb_password_re" required
                                       class="frm_input full_input required" minlength="3" maxlength="20"
                                       placeholder="비밀번호 확인">
                            </li>
                        </ul>
                    </div>

                    <div class="tbl_frm01 tbl_wrap register_form_inner">
                        <h2>개인정보 입력</h2>
                        <ul>
                            <li>
                                <label for="reg_mb_name">이름<strong class="sound_only">필수</strong></label>
                                <input type="text" id="reg_mb_name" name="mb_name" value="" required
                                       class="frm_input full_input required " size="10" placeholder="이름">
                            </li>

                            <li>
                                <label for="reg_mb_email">E-mail<strong class="sound_only">필수</strong>

                                </label>
                                <input type="hidden" name="old_email" value="">
                                <input type="text" name="mb_email" value="" id="reg_mb_email" required
                                       class="frm_input email full_input required" size="70" maxlength="100"
                                       placeholder="E-mail">

                            </li>


                            <li>
                            </li>
                            <li>
                                <label for="reg_mb_hp">휴대폰번호<strong class="sound_only">필수</strong></label>

                                <input type="text" name="mb_hp" value="" id="reg_mb_hp" required
                                       class="frm_input full_input required" maxlength="20" placeholder="휴대폰번호">
                            </li>

                        </ul>
                    </div>

                </div>
                <div class="btn_confirm">
                    <a href="register.jsp" class="btn_close">취소</a>
                    <button type="submit" id="btn_submit" class="btn_submit" accesskey="s">회원가입</button>
                </div>
            </form>
        </div>
        <script>
            $(function () {
                $("#reg_zip_find").css("display", "inline-block");

            });

            // submit 최종 폼체크
            function fregisterform_submit(f) {
                // 회원아이디 검사
                if (f.w.value == "") {
                    var msg = reg_mb_id_check();
                    if (msg) {
                        alert(msg);
                        f.mb_id.select();
                        return false;
                    }
                }

                if (f.w.value == "") {
                    if (f.mb_password.value.length < 3) {
                        alert("비밀번호를 3글자 이상 입력하십시오.");
                        f.mb_password.focus();
                        return false;
                    }
                }

                if (f.mb_password.value != f.mb_password_re.value) {
                    alert("비밀번호가 같지 않습니다.");
                    f.mb_password_re.focus();
                    return false;
                }

                if (f.mb_password.value.length > 0) {
                    if (f.mb_password_re.value.length < 3) {
                        alert("비밀번호를 3글자 이상 입력하십시오.");
                        f.mb_password_re.focus();
                        return false;
                    }
                }

                // 이름 검사
                if (f.w.value == "") {
                    if (f.mb_name.value.length < 1) {
                        alert("이름을 입력하십시오.");
                        f.mb_name.focus();
                        return false;
                    }

                    /*
                    var pattern = /([^가-힣\x20])/i;
                    if (pattern.test(f.mb_name.value)) {
                        alert("이름은 한글로 입력하십시오.");
                        f.mb_name.select();
                        return false;
                    }
                    */
                }


                // 닉네임 검사
                if ((f.w.value == "") || (f.w.value == "u" && f.mb_nick.defaultValue != f.mb_nick.value)) {
                    var msg = reg_mb_nick_check();
                    if (msg) {
                        alert(msg);
                        f.reg_mb_nick.select();
                        return false;
                    }
                }

                // E-mail 검사
                if ((f.w.value == "") || (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
                    var msg = reg_mb_email_check();
                    if (msg) {
                        alert(msg);
                        f.reg_mb_email.select();
                        return false;
                    }
                }

                // 휴대폰번호 체크
                var msg = reg_mb_hp_check();
                if (msg) {
                    alert(msg);
                    f.reg_mb_hp.select();
                    return false;
                }

                if (typeof f.mb_icon != "undefined") {
                    if (f.mb_icon.value) {
                        if (!f.mb_icon.value.toLowerCase().match(/.(gif|jpe?g|png)$/i)) {
                            alert("회원아이콘이 이미지 파일이 아닙니다.");
                            f.mb_icon.focus();
                            return false;
                        }
                    }
                }

                if (typeof f.mb_img != "undefined") {
                    if (f.mb_img.value) {
                        if (!f.mb_img.value.toLowerCase().match(/.(gif|jpe?g|png)$/i)) {
                            alert("회원이미지가 이미지 파일이 아닙니다.");
                            f.mb_img.focus();
                            return false;
                        }
                    }
                }

                if (typeof (f.mb_recommend) != "undefined" && f.mb_recommend.value) {
                    if (f.mb_id.value == f.mb_recommend.value) {
                        alert("본인을 추천할 수 없습니다.");
                        f.mb_recommend.focus();
                        return false;
                    }

                    var msg = reg_mb_recommend_check();
                    if (msg) {
                        alert(msg);
                        f.mb_recommend.select();
                        return false;
                    }
                }

                if (!chk_captcha()) return false;

                document.getElementById("btn_submit").disabled = "disabled";

                return true;
            }

            jQuery(function ($) {
                //tooltip
                $(document).on("click", ".tooltip_icon", function (e) {
                    $(this).next(".tooltip").fadeIn(400).css("display", "inline-block");
                }).on("mouseout", ".tooltip_icon", function (e) {
                    $(this).next(".tooltip").fadeOut();
                });
            });

        </script>

        <!-- } 회원정보 입력/수정 끝 -->
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
