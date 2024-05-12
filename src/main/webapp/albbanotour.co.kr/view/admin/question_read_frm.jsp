<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@page import="vo.QnaVO" %>
<%@ page import="dao.QnaDAO" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>질문답변 글쓰기 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "https://cmtour.co.kr";
        var g5_bbs_url = "https://cmtour.co.kr/bbs";
        var g5_is_member = "1";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "qa";
        var g5_sca = "";
        var g5_editor = "smarteditor2";
        var g5_cookie_domain = "";
    </script>
   
</head>

<body>
<jsp:useBean id="qVO" class="vo.QnaVO" scope="page"/>
<jsp:setProperty property="*" name="qVO"/>
<% request.setCharacterEncoding("UTF-8"); %>




<script type="text/javascript">
		
	$(function(){
		$("#btnUpdate").click(function(){
			if(confirm("글을 수정하시겠습니까")){
				$("#questionForm")[0].action="../admin/qna_answer_process.jsp";
				$("#questionForm").submit();
			}
		})

		$(".btnDelete").click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				$("#questionForm")[0].action="../admin/qna_delete_process.jsp";
				$("#questionForm").submit();
			}
		})
		
	
	
	
	})

</script>

<%
// ASK_DOC_NO 파라미터 받기
String ASK_DOC_NO = request.getParameter("ASK_DOC_NO");

// ASK_DOC_NO가 비어 있거나 null인 경우 예외 처리
if (ASK_DOC_NO == null || ASK_DOC_NO.isEmpty()) {
    out.println("게시글 번호가 올바르지 않습니다.");
    return; // 예외 처리 후 페이지 종료
}

// 게시글 조회
QnaVO qVo = null;
try {
    QnaDAO qDao = QnaDAO.getInstance(); // DAO 인스턴스 생성
    qVo = qDao.selectDetailqna(ASK_DOC_NO); // 해당 게시글 정보 조회
} catch (SQLException se) {
    se.printStackTrace();
    out.println("게시글 조회 중 오류가 발생했습니다.");
    return; // 예외 처리 후 페이지 종료
}

// 조회된 게시글 정보를 화면에 출력

%>



<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual05.jpg') no-repeat top center;"></div>
    </div>
</section>


<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
                </div>
                <ul class="">
                    <li>
                        <span>고객센터</span>
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
                        <span>질문답변</span>
                        <ul>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">공지사항</a></li>
                            <li><a href="/bbs/faq.php?fm_id=1" target="_self">자주 묻는 질문</a></li>
                            <li><a href="/bbs/board.php?bo_table=qa" target="_self">질문답변</a></li>
                            <li><a href="/bbs/qalist.php" target="_self">1:1문의</a></li>
                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li>고객센터</li>
            <li></li>
            <li>질문답변</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>
    <div class="scontents">
        <div class="bg_vline"></div>
        <p class="eng"><em></em> 질문답변</p>
        <p class="stitle"></p>
        <!-- skin : theme/daon_basic -->
        <section id="bo_w">
            <h2 class="sound_only">질문답변</h2>
            <!-- 게시물 작성/수정 시작 { -->
          <form name="questionForm" id="questionForm" method="post">
          
                <input type="hidden" name="ASK_DOC_NO" value="${ qVO.ASK_DOC_NO }"/>
                
<div class="write_div">
    <label for="wr_subject" class="sound_only">제목 <strong>필수</strong></label>
    <div id="autosave_wrapper write_div">
        <span class="readonly-text"><%= qVo != null ? qVo.getASK_TITLE() : "" %></span>
    </div>
</div>
<div class="write_div">
    <label for="wr_content" class="sound_only">내용<strong>필수</strong></label>
    <div class="wr_content smarteditor2">
         <div class="readonly-text" style="width:100%;height:300px" ><%= qVo != null ? qVo.getASK_CONTENTS() : "" %></div>
    </div>
    <input name="ANSWER_CONTENTS" id="ANSWER_CONTENTS" placeholder="답변을 작성하세요" size="50">
    <%=qVo != null? qVo.getANSWER_CONTENTS():"" %>
</div>
                <div class="btn_confirm write_div" style="text-align:center;">
                <input type="button" value="답변작성" class="btn btn-info btn-sm" id="btnUpdate" />
                 <input type="button" value="글삭제" class="btn btn-success btn-sm btnDelete" style="float: right;"/>   
                    <a href="qna.jsp" class="btn_cancel btn">취소</a>
                    
</div>
            </form>
        </section>
    </div>
</section>



</body>
</html>

