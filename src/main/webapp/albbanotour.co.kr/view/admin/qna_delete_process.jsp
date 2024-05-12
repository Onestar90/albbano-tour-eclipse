<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="vo.QnaVO" %>
<%@ page import="dao.QnaDAO" %>
<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.SQLException" %>
<body>
<script type="text/javascript">
<%
request.setCharacterEncoding("UTF-8");

String ASK_DOC_NO = request.getParameter("ASK_DOC_NO");
QnaDAO qDao = QnaDAO.getInstance();
try {
	QnaVO qVO = new QnaVO();
	qVO.setASK_DOC_NO(ASK_DOC_NO);

	int cnt = qDao.deleteadQna(qVO);
    if (cnt == 1) {
        response.sendRedirect("../admin/qna.jsp");
    } else {
        response.sendRedirect("javascript:history.back()");
    }
} catch (SQLException se) {
    se.printStackTrace();
}

%>
</script>
</body>