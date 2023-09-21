<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<table border="1" width="800">
	<thead>
		<tr>
			<th>좌석번호</th>
			<th>좌석구역번호</th>
			<th>좌석행수</th>
			<th>좌석열수</th>
			<th>좌석상태</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="seatDto" items="${list}">
		<tr>
			<td>${seatDto.seatNo}</td>
			<td>${seatDto.seatAreaNo}</td>
			<td>${seatDto.seatRow}</td>
			<td>${seatDto.seatCol}</td>
			<td>${seatDto.seatStatus}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>