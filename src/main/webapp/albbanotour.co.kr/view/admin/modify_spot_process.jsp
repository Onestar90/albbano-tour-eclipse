<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="dao.SpotManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.221/jsp_prj/common/favicon.ico" type="image/x-icon">
<!--부트스트랩 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--부트스트랩 끝-->
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/board.css" type="text/css" media="all" />
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
<jsp:useBean id="SpotListVO" class="vo.SpotListVO" scope ="page"/>
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
//curVO.setImgName(newName);
//out.println(newName);
%>
<% 

SpotListVO.setImg_name(newName);
String spot_code =mr.getParameter("spot_code");
SpotListVO.setSpot_code(spot_code);
String spot_name =mr.getParameter("spot_name");
SpotListVO.setSpot_name(spot_name);
String spot_desc =mr.getParameter("spot_desc");
SpotListVO.setSpot_desc(spot_desc);
String spt_loc =mr.getParameter("spt_loc");
SpotListVO.setSpt_loc(spt_loc);

double longitude = Double.parseDouble(mr.getParameter("longitude"));
SpotListVO.setLongitude(longitude);
double latitude = Double.parseDouble(mr.getParameter("latitude"));
SpotListVO.setLatitude(latitude);
SpotManagementDAO smDAO = SpotManagementDAO.getInstance();

out.print(SpotListVO);
smDAO.updateSpot(SpotListVO);
%>
<%
}else{
	out.println("파일은 5MByte까지만 가능합니다.");
}//end else
}catch(Exception e){
e.printStackTrace();
}
%>
<a href ="select_spot.jsp">관광지 리스트로 돌아가기</a>
</div>
</body>
</html>