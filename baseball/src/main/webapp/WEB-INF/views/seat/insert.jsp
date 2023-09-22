<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	
</script>

<form action="insert" method="post">
	<div class="container w-300">
		<div class="row left">

			<!-- 좌석 구역 -->
			<!--
				좌석구역: <select class="form-input w-100" name="seatAreaNo" class="w-100" id="seatAreaNo">
					<c:forEach var="seatAreaDto" items="${list}">
						<option value="${seatAreaDto.seatAreaNo}">${seatAreaDto.seatAreaZone} | ${seatStadium.stadiumName} </option>
					</c:forEach>
				</select>
			
					좌석구역: <select class="form-input w-100" name="seatAreaNo"
						id="seatAreaNo">
						<c:forEach var="seatAreaDto" items="${list}">
							<option value="${seatAreaDto.seatAreaNo}">
								${seatAreaDto.seatAreaZone} |
								${requestScope.seatStadium.stadiumName}</option>
						</c:forEach>
					</select>
			 -->
			<div class="row">
				좌석구역: <select class="form-input w-100" name="seatAreaNo"
					id="seatAreaNo">
					<c:forEach var="FindStadiumNameDto" items="${list}">
						<option value="${FindStadiumNameDto.seatAreaNo}">
							${FindStadiumNameDto.seatAreaZone} |
							${FindStadiumNameDto.stadiumName}  |
							${FindStadiumNameDto.seatAreaPrice} 원</option>
					</c:forEach>
				</select>
				<div class="row"></div>
				<div class="row">
					<!-- 				좌석구역: <input name="seatAreaNo" class="form-input w-100" type="number"> -->
				</div>
				<!-- 일단 이렇게 하고  -->
				<!-- 나중에 경기장을 선택하면 자동으로 value에 숫자 값을 넣을 수 있게 만드는게 목표 -->
			</div>
			<div class="row">
				좌석수행: <input name="seatRow" class="form-input w-100" type="number">
			</div>
			<div class="row">

				좌석수열: <input name="seatCol" class="form-input w-100" type="number">
			</div>
			<div class="row">
				예매상태 <select name="seatStatus">
					<option value="Y">가능</option>
					<option value="N">불가능</option>
					<option value="R">예매중</option>
				</select>

			</div>
		</div>
		<div class="row w-100">
			<button type="submit" class="btn btn-positive w-100">등록</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
