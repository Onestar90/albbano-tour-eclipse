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

<style type="text/css">
	
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");
		
		String res_name = request.getParameter("res_name");
		String res_code = request.getParameter("res_code");
		String res_doc_no = request.getParameter("res_doc_no");
		
		RestaurantReviewDAO rrDAO = RestaurantReviewDAO.getInstance();
		
		int flag = rrDAO.deleteRestaurantReview(res_doc_no);
		String result = "문제가 발생하여 리뷰를 삭제하는데 실패했습니다.";
		if(flag == 0 ){
			result = "리뷰 삭제에 성공했습니다.";
		}
	%>
	
	<script>
	alert("<%=result%>");
	location.href = "review_restaurant.jsp?res_code=<%=res_code %>&res_name=<%=res_name %>";
	
	</script>

</body>
</html>