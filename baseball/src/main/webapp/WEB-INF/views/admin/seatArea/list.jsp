<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>

<style>
table {
	border-collapse: collapse;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	border-right: #D1CFCF 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
	height: 40px;
	padding-top: 0.5em;
	font-size: 16px;
	color: #62676C;
	font-weight: bold;
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	border-right: #D1CFCF 3px solid;
	height: 35px;
	padding-top: 0.4em;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}
</style>


<table width="800">
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