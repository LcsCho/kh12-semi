<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	
</script>

<form action="sta" method="post">

	<div class="w-100">
경기장 번호: <input type="text" name="stadiumNo" value="${stadiumDto.stadiumNo}">
	</div>
		<div class="w-100">
경기장 이름: <input type="text" name="stadiumName" value="${stadiumDto.stadiumName}">
	</div>
	
		구역: <select name="seatAreaZone" class="w-100">
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
			</select> 좌석가격: <input type="number" name="seatAreaPrice"
				value="${seatAreaDto.seatAreaPrice}" class="w-100"> <br>
		
		<div class="row w-100">
			<button type="submit" class="btn btn-positive w-100">등록</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>