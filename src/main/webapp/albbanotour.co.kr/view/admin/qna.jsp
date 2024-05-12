<%@page import="java.util.ArrayList"%>
<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@page import="vo.QnaVO" %>
<%@page import="java.util.List" %>
<%@page import="dao.QnaDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	String ASK_DOC_NO = request.getParameter("ASK_DOC_NO");
	String ASK_TITLE = request.getParameter("ASK_TITLE");
	String ASK_CONTENTS = request.getParameter("ASK_CONTENTS");
	String CREATE_DATE = request.getParameter("CREATE_DATE");
	

%>

<jsp:useBean id="qsVO" class="vo.QnaSearchVO" scope="page"/>
<jsp:setProperty property="*" name="qsVO"/>

<%
QnaDAO qDao = QnaDAO.getInstance();

int totalCount = qDao.selecttotalCount(qsVO);
int pageScale = 10;

int totalPage = (int)Math.ceil((double)totalCount / pageScale)-1;

String tempPage = qsVO.getCurrentPage();
int currentPage = 1;
if(tempPage != null){
	try{
		currentPage=Integer.parseInt(tempPage);
	}catch(NumberFormatException nfe){
		
	}
}
int startNum=currentPage * pageScale-pageScale +1;
int endNum=startNum+pageScale-1;

qsVO.setStartNum(startNum);
qsVO.setEndNum(endNum);

List<QnaVO> list = qDao.selectAlladQna(qsVO);
pageContext.setAttribute("list", list);
%>




<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual05.jpg') no-repeat top center;"></div>
    </div>
</section>


<section id="sub_wrapper">
  

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 질문답변</p>
        <p class="stitle"></p>


        <!-- 게시판 목록 시작 { -->
        <div id="bo_list" style="width:100%">


            <!-- 게시판 페이지 정보 및 버튼 시작 { -->
            <div id="bo_btn_top">
                <div id="bo_list_total">
                    
                </div>

            </div>
            <!-- } 게시판 페이지 정보 및 버튼 끝 -->

            <!-- 게시판 카테고리 시작 { -->
            <!-- } 게시판 카테고리 끝 -->

           

                <div class="tbl_head01 tbl_wrap">
                    <table>
                        <caption>질문답변 목록</caption>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col" class="lview">글쓴이</th>
                            
                            <th scope="col" class="lview"><a
                                    href="board62f0.html?bo_table=qa&amp;sop=and&amp;sst=wr_datetime&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">날짜
                                <i class="fa fa-sort" aria-hidden="true"></i></a></th>
                                <th scope="col">답변여부</th>
                        </tr>
                        </thead>
                        <tbody>
                  
                <form method="post" name="frmDetail" id="frmDetail">       
      <c:forEach var="qna" items="${list}" varStatus="i">
    <tr class="">
        <td class="td_num2">
        
	
        </td>
        <td class="td_subject" style="padding-left:0px">
            <div class="bo_tit">
              <a href="../admin/question_read_frm.jsp?ASK_DOC_NO=${qna.ASK_DOC_NO}">
    <c:out value="${qna.ASK_TITLE}"/>
</a>
              <%--   <span class="tit_bg">내용 : </span>
                <c:out value=" ${qna.ASK_CONTENTS }"/><br> --%>
                
            </div>
        </td>
        <td class="td_name sv_use lview">
            <span class="sv_member">
                <c:out value="${qna.ID}"/>
            </span>
        </td>
       
        <td class="td_datetime lview">
            <c:out value="${qna.CREATE_DATE}"/>
        </td>
        
    <td>
    <c:choose>
                    <c:when test="${empty qna.ANSWER_CONTENTS}">
                        <div>답변없음</div>
                    </c:when>
                    
                </c:choose>
    </td>
    </tr>
</c:forEach>

       </form>                  
                   </tbody>
                    </table>
                </div>
         
        </div>


<nav class="pg_wrap">
        <span class="pg">
       
		<% for(int i=1; i<= totalPage; i++){ %>
		 <a href="../admin/qna.jsp?currentPage=<%= i %>" class="pg_page"><%= i %></a> 
		<%} %>
</span></nav>

 

    </div>
    
    
</section>



<%--스크롤_애니메이션_리셋--%>
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>
</body>

</html>
