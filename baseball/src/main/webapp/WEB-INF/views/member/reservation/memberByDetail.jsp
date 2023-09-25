<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container w-600">
    <ul class="list-group">
        <li class="list-group-item">예매번호: ${reservationDto.reservationNo}</li>
        <li class="list-group-item">경기시간: <fmt:formatDate value="${reservationDto.matchDate}" pattern="yyyy-MM-dd-HH-mm"/></li>
        <li class="list-group-item">경기장: ${reservationDto.stadiumName}</li>
        <li class="list-group-item">홈팀: ${reservationDto.homeTeam}</li>
        <li class="list-group-item">어웨이팀: ${reservationDto.awayTeam}</li>
        <li class="list-group-item">예매 취소: <a href="cancel?reservationNo=${reservationDto.reservationNo}">삭제</a></li>
    </ul>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
