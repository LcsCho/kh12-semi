<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/list.css">

<table width="800">
	<thead>
		<tr>
			<th>경기장</th>
			<th>구역</th>
			<th>좌석번호</th>
			<th>열</th>
			<th>행</th>
			<th>좌석상태</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="seatSeletDto" items="${list}">
			<tr>
				<td>${seatSeletDto.stadiumName}</td>
				<td>${seatSeletDto.seatAreaZone}</td>
				<td>${seatSeletDto.seatNo}</td>
				<td>${seatSeletDto.seatRow}</td>
				<td>${seatSeletDto.seatCol}</td>
				<td>${seatSeletDto.seatStatus}</td>
<td><a href="/admin/seat/update?seatAreaZone=${seatSeletDto.seatAreaZone}&seatCol=${seatSeletDto.seatCol}&seatRow=${seatSeletDto.seatRow}&stadiumName=${seatSeletDto.stadiumName}" class="link">수정</a>
<a href="/admin/seat/detail?seatNo=${seatSeletDto.seatNo}" class="link">상세</a>
</td>


			</tr>
		</c:forEach>
	</tbody>
</table>
</div>


	<div class="row page-navigator mv-30">
		<!-- 이전 버튼 -->
		<c:if test="${!vo.first}">
			<a href="list?${vo.prevQueryString}"> <i
				class="fa-solid fa-angle-left"></i>
			</a>
		</c:if>

		<!-- 숫자 버튼 -->
		<c:forEach var="i"  begin="${vo.begin}" end="${vo.end}" step="1" >
			<c:choose>
				<c:when test="${vo.page == i}">
					<a class="on">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="listByZone?seatAreaZone=${seatVo.seatAreaZone}&stadiumName=${seatVo.stadiumName}&${vo.getQueryString(i)}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${!vo.last}">
			<a href="list?${vo.nextQueryString}"> <i
				class="fa-solid fa-angle-right"></i>
			</a>
		</c:if>
	</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>