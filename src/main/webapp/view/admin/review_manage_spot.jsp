<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-05-15
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>

<%@page import="vo.SpotReviewVO"%>
<%@ page import="dao.SpotReviewDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
SpotReviewDAO spotReviewDAO = SpotReviewDAO.getInstance();
    List<SpotReviewVO> spotReviewList = new ArrayList<>();
    spotReviewList = spotReviewDAO.selectSptAllReview();
	pageContext.setAttribute("spotReviewList", spotReviewList);
	
	int totalCount = spotReviewList.size();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관광지 리뷰 관리 | 알빠노관광</title>

<link rel="stylesheet" type="text/css" href="http://127.0.0.1/front_util/css/index.css">

<script src="https://cdn.channel.io/plugin/ch-plugin-web.js" async="" defer=""></script>

</head>
<body>
	<div id="root">
		<div class="flex">
			<aside class="_sidebar_txlxk_7">
				<div class="_sidebar-layout-container_txlxk_18">
					<a class="_on-boarding-button_1srlb_7 _on-boarding-button_txlxk_32" role="menuitem" aria-current="false" tabindex="0" data-testid="on-boarding-button" data-trackid="onboarding-lnb-cta">
						<img src="/favicon.png" style="width:20px"/>
						<div class="_on-boarding-button-text_1srlb_26">알빠노 관광</div>
					</a>
					<nav class="_navigation-container_pupui_1">
						<ul class="_menubar_g1ej3_1 " role="menubar">
							<li role="none">
							<a class="_menu-item_1nj6f_7 " role="menuitem" aria-current="false" tabindex="-1" href="http://127.0.0.1/view/index_admin.jsp">
									<span class="_left-addon_1nj6f_36"> 
									<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M5.00002 9.74062V16.2635C5.00002 16.4586 5.0814 16.6457 5.2263 16.7838C5.3712 16.9219 5.56777 16.9996 5.77288 17H7.80573C8.01083 16.9996 8.20741 16.9219 8.35231 16.7838C8.49721 16.6457 8.57859 16.4586 8.57859 16.2635V14.3881C8.57859 14.1928 8.66016 14.0055 8.80537 13.8673C8.95057 13.7292 9.14752 13.6516 9.35287 13.6516H10.6472C10.7494 13.6507 10.8509 13.6691 10.9457 13.7057C11.0404 13.7423 11.1266 13.7964 11.1993 13.8649C11.2719 13.9334 11.3296 14.0149 11.369 14.1047C11.4083 14.1945 11.4286 14.2908 11.4286 14.3881V16.258C11.4286 16.4531 11.51 16.6403 11.6549 16.7784C11.7998 16.9164 11.9963 16.9942 12.2014 16.9946H14.2286C14.4334 16.9938 14.6296 16.9159 14.7742 16.7779C14.9188 16.6398 15 16.4529 15 16.258V9.73518C15 9.5402 14.9186 9.3532 14.7736 9.21533C14.6287 9.07746 14.4321 9 14.2271 9H5.77145C5.66959 9.00018 5.56878 9.0195 5.4748 9.05687C5.38083 9.09423 5.29554 9.1489 5.22385 9.21773C5.15216 9.28656 5.09548 9.36818 5.05707 9.45792C5.01866 9.54765 4.99927 9.64373 5.00002 9.74062Z"
												fill="#FC6B2D"></path>
											<path d="M15.9953 11H4.00465C3.79856 10.9967 3.59825 10.9288 3.43012 10.8051C3.26198 10.6814 3.1339 10.5079 3.06274 10.3072C2.99158 10.1066 2.98067 9.88832 3.03146 9.68113C3.08224 9.47395 3.19234 9.28758 3.34725 9.14655L8.57587 4.54317C8.97337 4.19254 9.47817 4 10 4C10.5218 4 11.0266 4.19254 11.4241 4.54317L16.6528 9.14655C16.8077 9.28758 16.9178 9.47395 16.9685 9.68113C17.0193 9.88832 17.0084 10.1066 16.9373 10.3072C16.8661 10.5079 16.738 10.6814 16.5699 10.8051C16.4017 10.9288 16.2014 10.9967 15.9953 11Z"
												fill="#FFE0D2"></path>
											<path d="M14.2286 9H5.77143C5.5667 9.00033 5.37049 9.07172 5.22586 9.19851C5.08123 9.3253 5 9.49711 5 9.67625V11H15V9.67625C15 9.49711 14.9188 9.3253 14.7741 9.19851C14.6295 9.07172 14.4333 9.00033 14.2286 9Z"
												fill="#FFBB9D"></path>
									</svg>
									</span>
									<span class="_title_1nj6f_41">홈</span>
							</a>
							</li>
							<li role="none">
							<details class="_root_1w85s_7 " open="">
									<summary class="_menu-button_1w85s_12" role="button" aria-haspopup="menu">
										<div class="flex items-center flex-shrink-0 gap-5px">
											<div class="flex-grow-0 flex-shrink-0">
												<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
													xmlns="http://www.w3.org/2000/svg">
													<path
														d="M11.2139 15.7097L16.4969 13.2078C16.6449 13.1377 16.7704 13.0277 16.8592 12.8902C16.9481 12.7527 16.9968 12.5931 16.9998 12.4294C17.0029 12.2657 16.9602 12.1044 16.8765 11.9637C16.7928 11.823 16.6715 11.7084 16.5262 11.6329L11.1923 8.85645C10.8219 8.66382 10.4119 8.55955 9.99445 8.55179C9.577 8.54403 9.16341 8.63299 8.78607 8.81171L3.5031 11.3105C3.35511 11.3806 3.22962 11.4905 3.14076 11.628C3.0519 11.7656 3.0032 11.9252 3.00015 12.0889C2.99711 12.2526 3.03983 12.4139 3.12351 12.5546C3.2072 12.6953 3.32851 12.8099 3.4738 12.8854L8.80767 15.6618C9.17776 15.8553 9.58766 15.9603 10.0052 15.9686C10.4227 15.9769 10.8364 15.8882 11.2139 15.7097Z"
														fill="#FC6B2D"></path>
    												<path
														d="M11.2139 11.1597L16.4969 8.65778C16.6449 8.58774 16.7704 8.47777 16.8592 8.34025C16.9481 8.20274 16.9968 8.04314 16.9998 7.87944C17.0029 7.71574 16.9602 7.55444 16.8765 7.41371C16.7928 7.27298 16.6715 7.15842 16.5262 7.08292L11.1923 4.30647C10.8221 4.11326 10.4122 4.00853 9.99464 4.0005C9.57713 3.99247 9.16344 4.08136 8.78607 4.2602L3.5031 6.76054C3.35511 6.83058 3.22962 6.94056 3.14076 7.07807C3.0519 7.21559 3.0032 7.37519 3.00015 7.53889C2.99711 7.70259 3.03983 7.86389 3.12351 8.00462C3.2072 8.14534 3.32851 8.25991 3.4738 8.33541L8.80767 11.1119C9.17787 11.305 9.58773 11.4098 10.0052 11.4181C10.4226 11.4264 10.8363 11.3379 11.2139 11.1597Z"
														fill="#FFE0D2"></path>
													<path
														d="M8.78246 8.80881L6.46875 9.90088L8.79788 11.1148C9.16832 11.3074 9.57831 11.4117 9.99577 11.4195C10.4132 11.4272 10.8268 11.3383 11.2041 11.1595L13.5179 10.0675L11.1887 8.85354C10.8183 8.66092 10.4083 8.55664 9.99084 8.54888C9.57338 8.54112 9.1598 8.63009 8.78246 8.80881Z"
														fill="#FFBB9D">
													</path>
												</svg>
											</div>
											<div class="flex justify-start items-center">관광지</div>
										</div>
										<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"
											class="_expanding-icon_1w85s_42">
											<path
												d="M9.911 12.902C9.71216 13.189 9.28784 13.189 9.089 12.902L5.54369 7.78474C5.31395 7.45313 5.55128 6.99999 5.95469 6.99999L13.0453 6.99999C13.4487 6.99999 13.6861 7.45313 13.4563 7.78474L9.911 12.902Z"
												fill="currentColor"></path>
										</svg>
									</summary>
									<ul class="_menu_1w85s_12" role="menu">
										<li role="none">
										<a class="_sub-menu-item_m12r4_7 " role="menuitem" aria-current="false" tabindex="-1"
											href="select_spot.jsp">관광지 관리</a></li>
										<li role="none">
										<a class="_sub-menu-item_m12r4_7 " role="menuitem" aria-current="page" tabindex="-1"
											href="review_manage_spot.jsp">관광지 리뷰 관리</a></li>
										<li role="none">
										<a class="_sub-menu-item_m12r4_7 " role="menuitem" aria-current="false" tabindex="-1" 
											href="select_curs.jsp">관광 코스 관리</a></li>
									</ul>
								</details></li>
							<li role="none"><details class="_root_1w85s_7 ">
									<summary class="_menu-button_1w85s_12" role="button"
										aria-haspopup="menu">
										<div class="flex items-center flex-shrink-0 gap-5px">
											<div class="flex-grow-0 flex-shrink-0">
												<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
													xmlns="http://www.w3.org/2000/svg">
													<path
														d="M16 15.3396V6.66044C16 5.7434 15.1937 5 14.1992 5L7.80083 5C6.80626 5 6 5.7434 6 6.66044V15.3396C6 16.2566 6.80626 17 7.80083 17H14.1992C15.1937 17 16 16.2566 16 15.3396Z"
														fill="#FFE0D2"></path>
													<path
														d="M13 12.4779V4.52207C13 3.68145 12.1937 3 11.1992 3L4.80083 3C3.80626 3 3 3.68145 3 4.52207V12.4779C3 13.3185 3.80626 14 4.80083 14H11.1992C12.1937 14 13 13.3185 13 12.4779Z"
														fill="#FC6B2D"></path>
													<path
														d="M7.52463 5C7.12011 5.0004 6.73232 5.13604 6.44644 5.37711C6.16057 5.61819 6 5.94498 6 6.28571V14H11.4754C11.8799 13.9996 12.2677 13.864 12.5536 13.6229C12.8394 13.3818 13 13.055 13 12.7143V5H7.52463Z"
														fill="#FFBB9D"></path></svg>
											</div>
											<div class="flex justify-start items-center">맛집</div>
										</div>
										<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
											xmlns="http://www.w3.org/2000/svg"
											class="_expanding-icon_1w85s_42">
											<path
												d="M9.911 12.902C9.71216 13.189 9.28784 13.189 9.089 12.902L5.54369 7.78474C5.31395 7.45313 5.55128 6.99999 5.95469 6.99999L13.0453 6.99999C13.4487 6.99999 13.6861 7.45313 13.4563 7.78474L9.911 12.902Z"
												fill="currentColor"></path></svg>
									</summary>
									<ul class="_menu_1w85s_12" role="menu">
										<li role="none"><a class="_sub-menu-item_m12r4_7 "
											role="menuitem" aria-current="false" tabindex="-1"
											href="select_res.jsp">맛집 관리</a></li>
										<li role="none"><a class="_sub-menu-item_m12r4_7 "
											role="menuitem" aria-current="false" tabindex="-1"
											href="review_manage_res.jsp">맛집 리뷰 관리</a></li>
									</ul>
								</details></li>
							<li role="none">
							<a class="_menu-item_1nj6f_7 " role="menuitem" aria-current="false" tabindex="-1" href="selectNotice.jsp">
								<span class="_left-addon_1nj6f_36">
								<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    										<path d="M7.38708 8.47561L6.33317 17.1863C6.31469 17.3411 6.34729 17.4977 6.42617 17.6331C6.50505 17.7684 6.62606 17.8753 6.77141 17.9381C6.91676 18.0009 7.07879 18.0163 7.23369 17.9819C7.38859 17.9476 7.5282 17.8654 7.632 17.7474L10.829 14.1127L15.2209 9.19345C15.3137 9.08987 15.3747 8.96255 15.3967 8.82629C15.4188 8.69002 15.401 8.55042 15.3454 8.4237C15.2898 8.29698 15.1987 8.18836 15.0827 8.11047C14.9668 8.03258 14.8306 7.98861 14.6902 7.98369L8.24059 7.7523C8.03201 7.74633 7.82871 7.81727 7.67074 7.95114C7.51276 8.08502 7.41156 8.27212 7.38708 8.47561Z"
												fill="#FFE0D2"></path>
											<path
												d="M6.36449 3.31623L4.23255 11.3637C4.20425 11.4713 4.2014 11.5839 4.22422 11.6928C4.24705 11.8017 4.29495 11.904 4.36425 11.992C4.43355 12.0799 4.52242 12.1511 4.62406 12.2001C4.72569 12.2491 4.8374 12.2746 4.95062 12.2747H6.93041L15.1112 3.72798C15.2105 3.6243 15.2767 3.49434 15.3016 3.35414C15.3265 3.21395 15.3091 3.06965 15.2515 2.93906C15.1939 2.80847 15.0986 2.69731 14.9774 2.61928C14.8562 2.54126 14.7143 2.49979 14.5694 2.5H7.44067C7.19465 2.50017 6.95562 2.58036 6.76092 2.72803C6.56622 2.8757 6.42682 3.08254 6.36449 3.31623Z"
												fill="#FC6B2D"></path>
											<path
												d="M6.92578 12.2762L11.1544 7.85623L8.50108 7.76149C8.2216 7.75134 7.94846 7.84486 7.736 8.02344C7.52353 8.20202 7.3873 8.45258 7.3544 8.72529L6.92764 12.2762H6.92578Z"
												fill="#FFBB9D"></path>
												</svg></span>
												<span class="_title_1nj6f_41">공지사항</span>
								</a></li>
							<li role="none"><a class="_menu-item_1nj6f_7 "
								role="menuitem" aria-current="false" tabindex="-1"
								href="qna.jsp"><span
									class="_left-addon_1nj6f_36"><svg width="20" height="20"
											viewBox="0 0 20 20" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<path
												d="M12.2915 4H5.00874C4.47586 4.00039 3.96493 4.21235 3.58826 4.5893C3.21159 4.96624 3 5.47732 3 6.01021V13.2945C3 13.8274 3.21159 14.3384 3.58826 14.7154C3.96493 15.0923 4.47586 15.3043 5.00874 15.3047H12.2915C12.8247 15.3047 13.336 15.0929 13.713 14.7159C14.09 14.3389 14.3018 13.8276 14.3018 13.2945V6.01021C14.3018 5.47707 14.09 4.96576 13.713 4.58878C13.336 4.21179 12.8247 4 12.2915 4Z"
												fill="#FC6B2D"></path>
    										<path
												d="M5.71947 13.0964C5.5688 13.096 5.42127 13.0534 5.29353 12.9735C5.16579 12.8936 5.06294 12.7795 4.9966 12.6443C4.93025 12.509 4.90306 12.3579 4.91809 12.2079C4.93313 12.058 4.98978 11.9153 5.08166 11.7959L8.52585 7.34145C8.60053 7.24478 8.69619 7.16634 8.80561 7.11205C8.91503 7.05776 9.03536 7.02904 9.1575 7.02805C9.27965 7.02706 9.40042 7.05384 9.51071 7.10635C9.621 7.15886 9.71791 7.23574 9.79414 7.33118L12.2604 10.4235L16.0051 6.10101C16.0727 6.01504 16.1571 5.94371 16.2531 5.89136C16.3491 5.83902 16.4548 5.80674 16.5636 5.79651C16.6725 5.78627 16.7823 5.79829 16.8864 5.83183C16.9905 5.86536 17.0867 5.91972 17.1691 5.99159C17.2515 6.06346 17.3185 6.15134 17.3659 6.2499C17.4133 6.34845 17.4401 6.45561 17.4448 6.56487C17.4495 6.67413 17.4319 6.78319 17.3931 6.88544C17.3543 6.98769 17.2951 7.08097 17.2192 7.15963L12.8439 12.2138C12.7679 12.3009 12.6742 12.3709 12.569 12.4189C12.4638 12.467 12.3496 12.492 12.234 12.4923H12.2178C12.0993 12.4896 11.9829 12.4608 11.8768 12.4081C11.7706 12.3554 11.6773 12.2801 11.6035 12.1874L9.17393 9.14052L6.35875 12.7827C6.28325 12.8803 6.18637 12.9594 6.07555 13.0138C5.96473 13.0682 5.84292 13.0964 5.71947 13.0964Z"
												fill="#FFBB9D"></path>
											<mask id="mask0_29466_19551" maskUnits="userSpaceOnUse" x="3"
												y="4" width="12" height="12" style="mask-type: alpha;">
											<path
												d="M12.2915 4H5.00874C4.47586 4.00039 3.96493 4.21235 3.58826 4.5893C3.21159 4.96624 3 5.47732 3 6.01021V13.2945C3 13.8274 3.21159 14.3384 3.58826 14.7154C3.96493 15.0923 4.47586 15.3043 5.00874 15.3047H12.2915C12.8247 15.3047 13.336 15.0929 13.713 14.7159C14.09 14.3389 14.3018 13.8276 14.3018 13.2945V6.01021C14.3018 5.47707 14.09 4.96576 13.713 4.58878C13.336 4.21179 12.8247 4 12.2915 4Z"
												fill="#FC6B2D"></path></mask>
											<g mask="url(#mask0_29466_19551)">
											<path
												d="M5.72338 13.0964C5.57271 13.096 5.42517 13.0534 5.29743 12.9735C5.16969 12.8936 5.06684 12.7795 5.0005 12.6443C4.93416 12.509 4.90697 12.3579 4.922 12.2079C4.93703 12.058 4.99369 11.9153 5.08557 11.7959L8.52976 7.34145C8.60443 7.24478 8.70009 7.16634 8.80951 7.11205C8.91894 7.05776 9.03926 7.02904 9.16141 7.02805C9.28356 7.02706 9.40433 7.05384 9.51462 7.10635C9.6249 7.15886 9.72182 7.23574 9.79805 7.33118L12.2643 10.4235L16.009 6.10101C16.0766 6.01504 16.161 5.94371 16.257 5.89136C16.353 5.83902 16.4587 5.80674 16.5675 5.79651C16.6764 5.78627 16.7862 5.79829 16.8903 5.83183C16.9944 5.86536 17.0906 5.91972 17.173 5.99159C17.2554 6.06346 17.3224 6.15134 17.3698 6.2499C17.4172 6.34845 17.444 6.45561 17.4487 6.56487C17.4534 6.67413 17.4358 6.78319 17.397 6.88544C17.3582 6.98769 17.299 7.08097 17.2231 7.15963L12.8478 12.2138C12.7718 12.3009 12.6781 12.3709 12.5729 12.4189C12.4677 12.467 12.3535 12.492 12.2379 12.4923H12.2217C12.1033 12.4896 11.9868 12.4608 11.8807 12.4081C11.7745 12.3554 11.6812 12.2801 11.6074 12.1874L9.17783 9.14052L6.36266 12.7827C6.28716 12.8803 6.19028 12.9594 6.07946 13.0138C5.96864 13.0682 5.84683 13.0964 5.72338 13.0964Z"
												fill="#FFE0D2"></path></g></svg></span> <span class="_title_1nj6f_41">1 : 1 문의</span>
												</a></li>
							<li role="none">
								<a class="_menu-item_1nj6f_7 " role="menuitem" aria-current="false" tabindex="-1"
								href="http://127.0.0.1/view/admin/reservation_management.jsp">
									<span class="_left-addon_1nj6f_36">
										<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path
												d="M11.8496 6.56464L8.86073 9.55355C7.70795 10.7063 7.72192 12.5893 8.89194 13.7593C10.062 14.9294 11.9449 14.9433 13.0977 13.7905L16.0866 10.8016C17.2394 9.64885 17.2254 7.76586 16.0554 6.59584C14.8854 5.42583 13.0024 5.41186 11.8496 6.56464Z"
												fill="#FC6B2D">
												</path>
    										<path
												d="M6.53714 6.2082L3.54823 9.19712C2.39545 10.3499 2.40942 12.2329 3.57944 13.4029C4.74945 14.5729 6.63245 14.5869 7.78523 13.4341L10.7741 10.4452C11.9269 9.29242 11.9129 7.40943 10.7429 6.23941C9.57292 5.0694 7.68992 5.05542 6.53714 6.2082Z"
												fill="#FFE0D2">
												</path>
    										<path
												d="M8.86159 9.55063C8.43179 9.98044 8.1473 10.5345 8.04705 11.1371C7.94679 11.7397 8.03567 12.3613 8.30152 12.9169L10.7749 10.4435C11.2045 10.0135 11.4889 9.45943 11.5891 8.85691C11.6894 8.25438 11.6006 7.63284 11.335 7.07723L8.86159 9.55063Z"
												fill="#FFBB9D">
												</path>
										</svg>
									</span>
									<span class="_title_1nj6f_41">예약 관리</span>
								</a>
							</li>
							<li role="none"><a class="_menu-item_1nj6f_7 "
								role="menuitem" aria-current="false" tabindex="-1"
								href="http://127.0.0.1/view/admin/userInfo_list.jsp"><span class="_left-addon_1nj6f_36"><svg
											width="20" height="20" viewBox="0 0 20 20" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<g clip-path="url(#clip0_7527_142503)">
											<path
												d="M7.3723 15.9983C9.78705 15.9983 11.7446 14.0584 11.7446 11.6655C11.7446 9.27261 9.78705 7.33276 7.3723 7.33276C4.95754 7.33276 3 9.27261 3 11.6655C3 14.0584 4.95754 15.9983 7.3723 15.9983Z"
												fill="#FFE0D2"></path>
											<path
												d="M12.6262 15.9983C15.041 15.9983 16.9985 14.0584 16.9985 11.6655C16.9985 9.27261 15.041 7.33276 12.6262 7.33276C10.2115 7.33276 8.25391 9.27261 8.25391 11.6655C8.25391 14.0584 10.2115 15.9983 12.6262 15.9983Z"
												fill="#FFE0D2"></path>
											<path
												d="M10.0012 11.6655C12.416 11.6655 14.3735 9.72568 14.3735 7.33276C14.3735 4.93984 12.416 3 10.0012 3C7.58645 3 5.62891 4.93984 5.62891 7.33276C5.62891 9.72568 7.58645 11.6655 10.0012 11.6655Z"
												fill="#FFE0D2"></path>
    										<path
												d="M10.0013 8.20274C9.38508 7.74446 8.65765 7.4556 7.89261 7.36538C7.12757 7.27517 6.35206 7.38679 5.64453 7.68897C5.71006 8.47237 5.98925 9.22339 6.45225 9.86168C6.91525 10.5 7.54464 11.0015 8.2731 11.3127C8.32298 10.7028 8.50279 10.1102 8.80068 9.57411C9.09857 9.03804 9.50777 8.57064 10.0013 8.20274Z"
												fill="#FFBB9D"></path>
											<path
												d="M10 8.20274C10.6162 7.74446 11.3436 7.4556 12.1087 7.36538C12.8737 7.27517 13.6492 7.38679 14.3567 7.68897C14.2912 8.47237 14.012 9.22339 13.549 9.86168C13.086 10.5 12.4566 11.0015 11.7282 11.3127C11.6783 10.7028 11.4985 10.1102 11.2006 9.57411C10.9027 9.03804 10.4935 8.57064 10 8.20274Z"
												fill="#FFBB9D"></path>
											<path
												d="M10.0016 8.20274C9.50787 8.57041 9.0985 9.03776 8.80059 9.57388C8.50267 10.11 8.32299 10.7027 8.27344 11.3127C8.81944 11.545 9.40743 11.6648 10.0016 11.6648C10.5958 11.6648 11.1838 11.545 11.7298 11.3127C11.6802 10.7027 11.5006 10.11 11.2026 9.57388C10.9047 9.03776 10.4954 8.57041 10.0016 8.20274Z"
												fill="#FC6B2D"></path>
											<path
												d="M11.7297 11.3127C11.1837 11.545 10.5957 11.6648 10.0015 11.6648C9.40736 11.6648 8.81937 11.545 8.27337 11.3127C8.26473 11.4292 8.25781 11.5456 8.25781 11.6655C8.25748 12.3372 8.41485 12.9997 8.7175 13.6007C9.02014 14.2017 9.45975 14.7247 10.0015 15.1283C10.5437 14.7249 10.9836 14.202 11.2866 13.601C11.5895 13 11.7471 12.3373 11.747 11.6655C11.747 11.5542 11.7401 11.4292 11.7297 11.3127Z"
												fill="#FFBB9D"></path></g>
											<defs>
											<clipPath id="clip0_7527_142503">
											<rect width="14" height="13" fill="white"
												transform="translate(3 3)"></rect></clipPath></defs></svg></span><span
									class="_title_1nj6f_41">회원 관리</span></a></li>
						</ul>
					</nav>
				</div>
				<div class="_sidebar-bottom-container_txlxk_37">
					<div>
						<button type="button" class="_feedback-button_txlxk_48" style="align-items:center" onclick="window.location.href='http://localhost/view/admin/a_logout.jsp'">
							<span class="_feedback-message_txlxk_66" style="font-size:14px">로그아웃</span>
						</button>
					</div>
					<div style="margin-top:100px; text-align:right">
						<a class="_outlink_txlxk_80"
							href="http://127.0.0.1/view/index_user.jsp"
							rel="noreferrer" target="_blank" style="display:block; padding:6px; font-size:13px"><span>알빠노 관광</span><span>↗</span></a>
					</div>
					
				</div>
			</aside>
			
			
			<div class="flex-grow-1">
				<header class="w-100% _header_1314p_7">
					<span class="_title-section_1314p_25"><h1 class="_title_1314p_25">예약내역</h1></span>
				</header>
				<main class="_layout-main_4ydtb_4">
					<div class="_main-container_2hrxu_7">
						<div class="_payment-summary-section_2hrxu_15" style="height:100px">
							<div class="_payment-summary-container_1b2ys_7">
								
								<div class="_lower-container_1b2ys_98">
									<nav class="_tabs_5oal5_4 ">
										<button data-testid="tab-header"
											class="_tab-header_57ua2_4 _horizontal_57ua2_19 _tab-header_iuomt_4"
											aria-pressed="true" aria-live="polite" aria-busy="false">
											<span
												class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b2_1uzvq_36 _weight--bold_1uzvq_84 "
												data-testid="typography">전체</span><span
												class="_tag_vwbjt_7 _variant--number_vwbjt_26 _color--black_vwbjt_38 _fill--solid_vwbjt_38 "
												data-testid="tag"><%= totalCount %></span>
										</button>
										
									</nav>
								</div>
							</div>
						</div>
						<div class="_payment-table-container_2hrxu_23"
							data-testid="paymnet-history-table-container">
							<table data-testid="table"
								class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
								aria-live="polite" aria-busy="false">
								<thead data-testid="tableHead"
									class=" _payment-table-head_8ouzs_8">
									<tr data-testid="payment-info-row-header"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
										<th data-testid="payment-status-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">관광지리뷰번호</span></th>
										<th data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">관광지이름</span></th>
										<th data-testid="order-name-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">리뷰제목</span></th>
										<th data-testid="buyer-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">작성자ID</span></th>
										<th data-testid="buyer-person-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">별점</span></th>
										<th data-testid="buyer-person-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography"></span></th>
									</tr>
								</thead>
								<tbody data-testid="tableBody"
									class=" _payment-table-body_8ouzs_13">
									<tr data-testid="date-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10 _date-row_8027u_4 _started-date-row_8ouzs_23 _payment-table-date-row_2hrxu_43">
										<c:forEach var="i" begin="1" end="6">
											<td data-testid="tableCell"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										</c:forEach>
									</tr>
									
									<c:forEach var="item" items="${spotReviewList}" varStatus="i">
										<tr data-testid="payment-info-row"
											class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10 _payment-table-row_8ouzs_17 ">
											<td data-testid="payment-status-column"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4">
														<span class="_tag_vwbjt_7" data-testid="tag">
															<c:out value="${item.spot_doc_no}"/>
														</span>
											</td>
											<td data-testid="iamport-merchant-id-column"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4">
												<div class="_container_1aijn_7">
													<span><c:out value="${item.spot_name}"/></span>
												</div>
											</td>
											<td data-testid="order-name-column"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4">
												<span class="_ellipsis-two-line_a7yez_1"><c:out value="${item.spot_title}"/></span>
											</td>
											<td data-testid="buyer-column"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
												<span class="_ellipsis-two-line_a7yez_1" data-testid="buyer-info"><c:out value="${item.id}"/></span>
											</td>
											<td data-testid="buyer-person-column"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
												<div class="_wrapper_39jul_7">	
													<span class="_container_t52sn_7" data-testid="amount-content">
														<span class="_amount_t52sn_13 "><c:out value="${item.star}"/></span>
														<span class="_currency_t52sn_35">점</span>
													</span>
												</div>
											</td>
											<td data-testid="cancel-payment-column"
												class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column_1lui6_4">
												<span class="_cancel-text_1h0fb_7">삭제</span>
											</td>
										</tr>
									</c:forEach>
									</tbody>
							</table>
							<button
								class="_button_11kek_7 _height--40_11kek_43 _font--pretendard_11kek_28 _size--full-width_11kek_79 _height--40_scibe_11 _variant--secondary_scibe_27  _show-more-button_2hrxu_47">
								<span class="_content_scibe_51 ">10건 더보기</span>
							</button>
						</div>
					</div>
				</main>
			</div>
		</div>
		<div class="select-none pointer-events-none z-pop-over fixed top-0 left-0 w-screen h-screen"></div>
	</div>
	</body>
</html>