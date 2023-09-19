<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="center">
<h1>비밀번호 찾기</h1>
<form action="findPw" method="post" autocomplete="off">
	<div class="container w-400 mt-50">
		<div class="row">
			<input type="text" name="memberId" 
			class="form-input w-100" placeholder="아이디 입력" required> <br><br>
		</div>
		<div class="row">
			<input type="email" name="memberEmail" 
			 class="form-input w-100" placeholder="이메일 입력" required> <br><br>
		</div>
		<div class="row">
			<button type="submit" class="btn btn-positive w-100">비밀번호 찾기</button>
		</div>
		
	</div>
</form>
</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>