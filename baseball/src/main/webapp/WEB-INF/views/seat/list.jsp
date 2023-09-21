<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<table border="1" width="800">
	<thead>
		<tr>
			<th>좌석번호</th>
			<th>좌석상태</th>
		</tr>
	</thead>
	<tbody align="center">
		<!--<c:forEach var="stadiumDto" items="${list}">-->
		<tr>
			<td><a href="detail?seatId=${seatDto.seatId}">${seatDto.seatId}</a></td>
			<td>${seatDto.seatStatus}</td>
		</tr>
		<!--</c:forEach>-->
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    