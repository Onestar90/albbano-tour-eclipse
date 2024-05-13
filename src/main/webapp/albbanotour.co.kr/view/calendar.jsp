<%@ page import="java.util.Locale"%>
<%@ page import="java.time.format.TextStyle"%>
<%@ page import="java.time.DayOfWeek"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String yearParam = request.getParameter("year");
    String monthParam = request.getParameter("month");
    String dayParam = request.getParameter("day");
    
    int year = (yearParam != null && !yearParam.isEmpty()) ? Integer.parseInt(yearParam) : LocalDate.now().getYear();
    int month = (monthParam != null && !monthParam.isEmpty()) ? Integer.parseInt(monthParam) : LocalDate.now().getMonthValue();
    int day = (dayParam != null && !dayParam.isEmpty()) ? Integer.parseInt(dayParam) : LocalDate.now().getDayOfMonth();

    LocalDate currentDate = LocalDate.of(year, month, day);
    int daysInMonth = currentDate.lengthOfMonth();
    
    pageContext.setAttribute("daysInMonth", daysInMonth);
    pageContext.setAttribute("currentDate", currentDate);
    pageContext.setAttribute("day", day);
%>

    <c:forEach begin="${day}" end="${daysInMonth}" varStatus="cal">
        <c:set var="date" value="${currentDate.withDayOfMonth(cal.index)}" />
        <c:set var="korWeek" value="${date.dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN)}" />
        
        <c:choose>
            <c:when test="${korWeek eq '토'}">
                <a href="#none" class="dayli live">
                    <span class="txweek box-sat">${korWeek}</span>
                    <span class="txday box-sat">${cal.index}</span>
                </a>
            </c:when>
            <c:when test="${korWeek eq '일'}">
                <a href="#none" class="dayli live">
                    <span class="txweek box-sun">${korWeek}</span>
                    <span class="txday box-sun">${cal.index}</span>
                </a>
            </c:when>
            <c:otherwise>
                <a href="#none" class="dayli live">
                    <span class="txweek">${korWeek}</span>
                    <span class="txday">${cal.index}</span>
                </a>
            </c:otherwise>
        </c:choose>
    </c:forEach>