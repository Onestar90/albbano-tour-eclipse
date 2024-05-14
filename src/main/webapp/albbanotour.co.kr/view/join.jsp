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

            <form id="fregisterform" name="fregisterform" action="join_process.jsp" 
                  onsubmit="return fregisterform_submit(this);" method="post" 
                  autocomplete="off">
                <!-- <input type="hidden" name="w" value="">
                <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php">
                <input type="hidden" name="agree" value="1">
                <input type="hidden" name="agree2" value="1">
                <input type="hidden" name="cert_type" value="">
                <input type="hidden" name="cert_no" value="">
                <input type="hidden" name="mb_sex" value=""> -->
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
                                <input type="text" name="id" value="" id="id" required
                                       class="frm_input full_input required " minlength="3" maxlength="20" style="width: 200px;"
                                       placeholder="아이디">
                                <input type="button" value="ID 중복확인" class="btn btn-outline-dark" id="idChk"/>
                                <span id="msg_mb_id"></span>
                            </li>
                            <li class="half_input left_input margin_input">
                                <label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label>
                                <input type="password" name="pass" id="pass" required
                                       class="frm_input full_input required" minlength="3" maxlength="20" style="width: 200px;"
                                       placeholder="비밀번호">
                            </li>
                            <li class="half_input left_input">
                                <label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label>
                                <input type="password" name="mb_password_re" id="reg_mb_password_re" required
                                       class="frm_input full_input required" minlength="3" maxlength="20" style="width: 200px;"
                                       placeholder="비밀번호 확인">
                            </li>
                        </ul>
                    </div>

                    <div class="tbl_frm01 tbl_wrap register_form_inner">
                        <h2>개인정보 입력</h2>
                        <ul>
                            <li>
                                <label for="reg_mb_name">이름<strong class="sound_only">필수</strong></label>
                                <input type="text" id="name" name="name" value="" required
                                       class="frm_input full_input required " size="10" style="width: 200px;" placeholder="이름">
                            </li>

                            <li>
							    <label for="reg_mb_email">이메일<strong class="sound_only">필수</strong></label>
							    <div class="input_wrap">
							        <input type="text" id="email1" name="email1" class="frm_input half_input required" maxlength="100" style="width: 200px;" placeholder="이메일">
							        <span class="at_symbol">@</span>
							        <input type="text" list="selecEmail" id="email2" name="email2" class="frm_input half_input required" style="width: 200px;" placeholder="도메인 선택">
							        <datalist id="selecEmail" class="selecEmail">
							            <option value="">도메인 선택</option>
							            <option value="직접 입력">직접 입력</option>
							            <option value="gmail.com">gmail.com</option>
							            <option value="naver.com">naver.com</option>
							            <option value="daum.net">daum.net</option>
							            <option value="nate.com">nate.com</option>
							            <option value="hotmail.com">hotmail.com</option>
							        </datalist>
							    </div>
							</li>


                            <li>
                            </li>
                            <li>
                                <label for="reg_mb_hp">휴대폰번호<strong class="sound_only">필수</strong></label>

                                <input type="text" name="tel" value="" id="tel" required
                                       class="frm_input full_input required" maxlength="20" style="width: 200px;" placeholder="휴대폰번호">
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
        <script type="text/javascript">
        
        window.onload=function(){
        	//1. 이벤트 등록
        	document.getElementById('idChk').addEventListener('click', idDupWin);
        }
        
        function idDupWin(){
        	//부모창 > 자식창으로 값 전달
        	//자식창에서는 JSP 코드로 값 받기
        	var id = document.fregisterform.id.value;
    		window.open('id_duplication.jsp?id=' + id, 'idDup', 
    			'width=472, height=340, top=' + (window.screenY + 100) + ', left=' + (window.screenX + 100));	// 첫 번째 파라미터엔 http:// 로 시작하는 값을 줘도 됨
    		
        }
        
        
            $(function () {
                $("#reg_zip_find").css("display", "inline-block");

            });

            // submit 최종 폼체크
            function fregisterform_submit(f){
            	// 아이디 중복 확인
                if (!checkId(f.id.value)) {
                    alert("아이디는 영문자, 숫자, _ 만 입력 가능하며 최소 3자 이상이어야 합니다.");
                    f.id.focus();
                    return false;
                }

                // 비밀번호 확인
                if (f.pass.value.length < 3) {
                    alert("비밀번호를 3자 이상 입력하세요.");
                    f.pass.focus();
                    return false;
                }

                // 비밀번호 일치 여부 확인
                if (f.pass.value !== f.mb_password_re.value) {
			        alert("비밀번호가 일치하지 않습니다.");
			        f.mb_password_re.focus();
			        return false;
			    }

                // 이메일 도메인 선택 확인
                if (f.email2.value === "") {
                    alert("이메일 도메인을 선택하세요.");
                    f.email2.focus();
                    return false;
                }

                // 여기에 추가적인 검사 로직을 추가할 수 있습니다.

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
