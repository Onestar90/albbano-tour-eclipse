<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="vo.QnaVO" %>
<%@ page import="dao.QnaDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
// 폼 데이터 받아오기
String ID = (String) session.getAttribute("idKey");
String askTitle = request.getParameter("ASK_TITLE");
String askContents = request.getParameter("ASK_CONTENTS");

QnaVO qnaVO = new QnaVO();
qnaVO.setID(ID);
qnaVO.setASK_TITLE(askTitle);
qnaVO.setASK_CONTENTS(askContents);

QnaDAO qDao = QnaDAO.getInstance();

try {
    // QnaDAO의 insertQna 메서드 호출하여 데이터 삽입
    QnaVO insertedQna = qDao.insertQna(qnaVO);
%>
  
<%
} catch (Exception e) {
    // 등록 중 오류 발생 시
%>
    <h1>질문 등록 중 오류가 발생했습니다.</h1>
<%
    e.printStackTrace();
}
%>
    <script>
    alert("성공적으로 등록되었습니다.")
    location.href = "qna.jsp";
    </script>
    
    
    
    
    