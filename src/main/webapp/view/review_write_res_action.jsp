<%@page import="dao.RestaurantReviewDAO"%>
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
		
		String res_name = request.getParameter("res_name");
		String res_code = request.getParameter("res_code");
		String title = request.getParameter("wr_subject");
		String countents = request.getParameter("wr_content");
		String id = (String)session.getAttribute("idKey");
		String star[] = request.getParameterValues("rating");
		String count = star[0];
		RestaurantReviewDAO rrDAO = RestaurantReviewDAO.getInstance();
		
		int flag = rrDAO.insertResReview(res_code, title, countents, id, count);
		String result = "문제가 발생하여 리뷰를 입력하는데 실패했습니다.";
		if(flag == 0 ){
			result = "리뷰 입력에 성공했습니다.";
		}
		
	%>
	
	<script>
	alert("<%=result %>");
	location.href = "review_restaurant.jsp?res_code=<%=res_code %>&res_name=<%=res_name %>";
	
	</script>

</body>
</html>