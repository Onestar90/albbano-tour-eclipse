<%@page import="dao.RestaurantManagementDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트스트랩 시작-->
<!--부트스트랩 끝-->
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!--jQuery CDN 끝-->
<style type="text/css">
	
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
</script>
</head>
<body>
<div>
<jsp:useBean id="rVO" class="vo.ResListVO" scope="page"/>
<%
request.setCharacterEncoding("UTF-8");
File saveDir = new File("C:/dev/albbano-tour-eclipse/src/main/webapp/upload");
int maxSize =1024*1024*100;
try{
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
maxSize,"UTF-8", new DefaultFileRenamePolicy());
String newName = mr.getFilesystemName("img_name");
int limitSize =1024*1024*5;
File readFile = new File(saveDir.getAbsolutePath()+"/"+newName);
boolean flag = false;
if(readFile.length()>limitSize){
	flag =true;
	readFile.delete();
}//end if
if(!flag){
	String res_code =mr.getParameter("res_code");
	String res_cat =mr.getParameter("res_cat");
	String res_name =mr.getParameter("res_name");
	String holiday =mr.getParameter("holiday");
	String busi_hour =mr.getParameter("busi_hour");
	String res_loc =mr.getParameter("res_loc");
	String img_name =mr.getParameter("img_name");
	String intro =mr.getParameter("intro");
	rVO.setRes_code(res_code);
	rVO.setRes_cat(res_cat);
	rVO.setRes_name(res_name);
	rVO.setHoliday(holiday);
	rVO.setBusi_hour(busi_hour);
	rVO.setRes_loc(res_loc);
	rVO.setImg_name(newName);
	rVO.setIntro(intro);
double longitude = Double.parseDouble(mr.getParameter("longitude"));
rVO.setLongitude(longitude);
double latitude = Double.parseDouble(mr.getParameter("latitude"));
rVO.setLatitude(latitude);

RestaurantManagementDAO rDAO = RestaurantManagementDAO.getInstance();
rDAO.insertRest(rVO);
%>
맛집 추가에 성공했습니다!
<c:redirect url="select_res.jsp"/>
<%
}else{
	out.println("파일은 5MByte까지만 가능합니다.");
}//end else
}catch(Exception e){
e.printStackTrace();
%>
맛집 추가에 실패했습니다.
 입력한 값을 다시한번 확인해주세요.<br>
<a href="insert_res.jsp">맛집 추가 화면으로 돌아가기</a>
<a href="select_res.jsp">맛집리스트로 돌아가기</a>
<%
}
%>
</div>
</body>
</html>