<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<form action="update" method="post">
<input type="hidden" name="seatAreaNo" value="${seatAreaDto.seatAreaNo}">
경기장 <input type="text" name="stadiumNo" value="${seatAreaDto.stadiumNo}">
구역 <input type="text" name="seatAreaZone" value="${seatAreaDto.seatAreaZone}">
좌석가격 <input type="text" name="seatAreaPrice" value="${seatAreaDto.seatAreaPrice}">

<button type="submit">수정</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    