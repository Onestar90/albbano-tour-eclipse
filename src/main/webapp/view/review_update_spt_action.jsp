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

</script>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");
		
		String spt_name = request.getParameter("spt_name");
		String spt_code = request.getParameter("spt_code");
		String spot_doc_no = request.getParameter("spot_doc_no");
		String title = request.getParameter("wr_subject");
		String countents = request.getParameter("wr_content");
		String id = (String)session.getAttribute("idKey");
		String star[] = request.getParameterValues("rating");
		String count = star[0];

		SpotReviewDAO srDAO = SpotReviewDAO.getInstance();
		
		int flag = srDAO.updateSpotReview(spot_doc_no, title, countents, count);
		String result = "문제가 발생하여 리뷰를 수정하는데 실패했습니다.";
		if(flag == 0 ){
			result = "리뷰 수정에 성공했습니다.";
		}
		
	%>
	
	<script>
	alert("<%=result%>");
	location.href = "review_spot.jsp?spt_code=<%=spt_code %>&spt_name=<%=spt_name %>";
	
	</script>

</body>
</html>