<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="세션 삭제 후 index_user로 이동"%>
<% 
session.removeAttribute("idKey");
//response.sendRedirect("http://localhost/albbano-tour-eclipse/albbanotour.co.kr/view/index_user.jsp");
%>
<!-- //session.removeAttribute("id");
//response.sendRedirect("http://localhost/albbano-tour-eclipse/albbanotour.co.kr/view/index_user.jsp");
%>
<script type="text/javascript">
alert("로그아웃 되었습니다.");
location.href="http://localhost/albbano-tour-eclipse/albbanotour.co.kr/view/index_user.jsp";
</script> -->
<script type="text/javascript">
alert("로그아웃 되었습니다.");
location.href="http://localhost/albbano-tour-eclipse/albbanotour.co.kr/view/index_user.jsp";
</script>