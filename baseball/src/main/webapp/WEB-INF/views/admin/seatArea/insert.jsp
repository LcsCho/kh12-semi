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
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<option value="D">D</option>
				<option value="E">E</option>
				<option value="F">F</option>
				<option value="G">G</option>
				<option value="H">H</option>
				<option value="I">I</option>
				<option value="J">J</option>
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