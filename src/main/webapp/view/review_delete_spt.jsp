<%@page import="dao.SpotReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");
		
		String spt_name = request.getParameter("spt_name");
		String spt_code = request.getParameter("spt_code");
		String spot_doc_no = request.getParameter("spot_doc_no");
		
		SpotReviewDAO srDAO = SpotReviewDAO.getInstance();
		
		int flag = srDAO.deleteSpotReview(spot_doc_no);
		String result = "문제가 발생하여 리뷰를 삭제하는데 실패했습니다.";
		if(flag == 1 ){
			result = "리뷰 삭제에 성공했습니다.";
		}
		
	%>
	
	<script>
	alert("<%=result%>");
	location.href = "review_spot.jsp?spt_code=<%=spt_code %>&spt_name=<%=spt_name %>";
	</script>

</body>
</html>