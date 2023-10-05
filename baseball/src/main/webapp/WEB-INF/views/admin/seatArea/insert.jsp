<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/insert.css">

<script>
</script>

<form action="insert" method="post">
	<table>
		<tr>
			<th>경기장</th>
				<td><select name="stadiumNo" class="form-input w-100" id="stadiumNo">
				<c:forEach var="stadiumDto" items="${list}">
					<option value="${stadiumDto.stadiumNo}">${stadiumDto.stadiumName}</option>
				</c:forEach>
			</select> 
			</td>
		</tr>
		<tr>
			<th>구역</th>
				<td><select name="seatAreaZone" class="form-input w-100">
				<option value="1루네이비석">1루네이비석</option>
				<option value="1루레드석">1루레드석</option>
				<option value="1루블루석">1루블루석</option>
				<option value="1루오렌지석">1루오렌지석</option>
				<option value="1루익사이팅석">1루익사이팅석</option>
				<option value="1루테이블석">1루테이블석</option>
				<option value="3루네이비석">3루네이비석</option>
				<option value="3루레드석">3루레드석</option>
				<option value="3루블루석">3루블루석</option>
				<option value="3루오렌지석">3루오렌지석</option>
				<option value="3루익사이팅석">3루익사이팅석</option>
				<option value="3루테이블석">3루테이블석</option>
				<option value="야외그린석">야외그린석</option>
				<option value="켈리존">켈리존</option>
				
				
			</select> 
			</td>
		</tr>	
		<tr>
			<th>좌석가격</th>
				<td>
			<input type="number" name="seatAreaPrice"
				value="${seatAreaDto.seatAreaPrice}" class="form-input w-100">
			</td>
		</tr>
	</table>
		<div class="row w-100">
			<button type="submit" class="btn">구역 등록</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>