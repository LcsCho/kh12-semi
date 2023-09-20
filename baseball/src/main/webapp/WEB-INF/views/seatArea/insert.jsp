<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="insert" method="post">
	<div class="container w-300">
		<div class="row left">
			경기장: <select name="stadiumNo" class="w-100">
				<option value="1">창원NC파크</option>
				<option value="2">대구삼성라이온즈파크</option>
				<option value="3">고척스카이돔</option>
				<option value="4">광주기아챔피언스필드</option>
				<option value="5">인천SSG랜더스필드</option>
				<option value="6">수원KT위즈파크</option>
				<option value="7">사직야구장</option>
				<option value="8">서울종합운동장 야구장</option>
				<option value="9">대전한화생명이글스파크</option>
				</select>
			구역: <select name="seatAreaZone" class="w-100">
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
			</select> 좌석가격: <input type="number" name="seatAreaPrice"
				value="${seatAreaDto.seatAreaPrice}" class="w-100"> <br>
			<br>
		</div>
		<div class="row w-100">
			<button type="submit" class="btn btn-positive w-100">등록</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>