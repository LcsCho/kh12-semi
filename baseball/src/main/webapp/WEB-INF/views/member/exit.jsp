<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/mypageSidebar.jsp"></jsp:include>

<style>
    .form-input, 
    .btn{
        width: 350px;
        height: 50px;
        font-size: 15px;
        padding: 0.5em 1em;
        outline: none; /* outline은 입력 창 선택 시 강조 효과 */
        border: 1px solid #747171;
        border-radius: 9px; /* 글자 크기의 10%만큼 깎겠다 */
        background-color: #FFFCFC;
    }
    .form-input:focus{/* 선택된 상태를 focus라 한다 */
        border-color: #360A01;
    }

    /*
        버튼은 입력창과 동일하게 구현
        글자를 두껍게 보여주도록 처리(bold)
    */
    .btn{
        font-weight: bold;
        border-color: #D32D2D;
        background-color: #D32D2D;
        color: white;
        cursor: pointer;
        font-size: 15px;
        margin: 0.5em;
        border-radius: 10px;
    }
    .btn:hover{ /* 마우스가 버튼에 올라가면 배경을 조금 더 어둡게 처리 */
        filter: brightness(95%);
    }
    .exit{
        font-weight: bold;
    }

    </style>
    
<form action="exit" method="post">
<div class="container w-400">

	    <div class="row mb-20 exit">
                        탈퇴를 원하시면 비밀번호를 입력해주세요<br>
                        탈퇴 후 정보는 사라집니다
                    </div>
	
	<c:if test="${param.error != null}">
	<div class="row important">
		<h3>비밀번호가 일치하지 않습니다</h3>
	</div>
	</c:if>
	
	<div class="row">
		<input class="form-input w-100" type="password" name="memberPw" placeholder="비밀번호 입력" required>
	</div>
	
	<div class="row">
		<button class="btn w-100">회원 탈퇴</button>	
	</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




