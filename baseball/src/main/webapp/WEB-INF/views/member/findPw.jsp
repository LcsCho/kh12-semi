<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="center">
<h1>비밀번호 찾기</h1>
</dv>

<form action="findPw" method="post" autocomplete="off">
<div class="container w-500">

	<div class="row left">
			<input type="text" name="memberId" 
			class="form-input w-100" placeholder="아이디 입력" required>
		</div>
		
		<div class="row">
			<input type="email" name="memberEmail" class="form-input w-100" 
			placeholder="이메일 입력" required>
		</div>
		<div class="row">
		 	<button type="submit" class="btn btn-positive w-100">비밀번호 찾기</button>
		</div>
			
</div>
</form>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>