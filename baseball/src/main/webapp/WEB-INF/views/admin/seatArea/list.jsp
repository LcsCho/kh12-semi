<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>
<table border="1" width="800">
	<thead>
		<tr>
			<th>경기장</th>
			<th>구역</th>
			<th>좌석가격</th>

		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="seatAreaDto" items="${list}">
		<tr>
			
			<td>${seatAreaDto.stadiumNo}</td>
			<td>${seatAreaDto.seatAreaZone}</td>
			<td>${seatAreaDto.seatAreaPrice}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>