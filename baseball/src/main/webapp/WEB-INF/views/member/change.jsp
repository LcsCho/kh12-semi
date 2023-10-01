<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h2>개인정보 변경</h2>

<c:if test="${param.error != null}">
	<h3 style="color:red">입력하신 비밀번호가 일치하지 않습니다</h3>
</c:if>

<form action="change" method="post" autocomplete="off">

		닉네임 <input type="text" name="memberNick" value="${memberDto.memberNick}" required><br>
		이메일 <input type="email" name="memberEmail" value="${memberDto.memberEmail}" > <br>
		전화번호 <input type="tel" name="memberTel" value="${memberDto.memberTel}" > <br>
		생년월일 <input type="date" name="memberBirth" value="${memberDto.memberBirth}" > <br>
		주소 <br>
		<input type="text" name="memberPost" size="6" maxlength="6"
			placeholder="우편번호" value="${memberDto.memberPost}"><br>
		<input type="text" name="memberAddr1" size="50" 
			placeholder="기본주소" value="${memberDto.memberAddr1}"><br>
		<input type="text" name="memberAddr2" size="50" 
			placeholder="상세주소" value="${memberDto.memberAddr2}"><br><br>
			
			비밀번호 확인 <input type="password" name="memberPw" required><br><br>

	<button>정보변경</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>