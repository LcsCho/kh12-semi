<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<form action="edit" method="post" enctype="multipart/form-data" autocomplete="off">
	<div class="container w-400">
	<div class="row">
	<h2>예매 수정</h2>
	</div>
	예매번호 : <input type="text" name="reservationNo" class="form-input w-100" value="${reservationDto.reservationNo}"><br><br>
	매치아이디 : <input type="text" name="matchNo" class="form-input w-100" value="${reservationDto.matchNo}"><br><br>
	홈팀 : <input type="text" name="teamHome" class="form-input w-100" value="${reservationDto.teamHome}"><br><br>
	어웨이팀 : <input type="text" name="teamAway" class="form-input w-100" value="${reservationDto.teamAway}"><br><br>
	좌석구역번호 : <input type="text" name="seatAreaNo" class="form-input w-100" value="${reservationDto.seatAreaNo}"><br><br>
	좌석번호 : <input type="text" name="seatNo" class="form-input w-100" value="${reservationDto.seatNo}"><br><br>
	예매날짜 : <input type="date" name="reservationDate" class="form-input w-100" value="${reservationDto.reservationDate}"><br><br>

	<button type="submit" class="btn btn-positive w-100">등록</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>