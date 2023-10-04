<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
        border-color: #360A01;
        background-color: #360A01;
        color: white;
        cursor: pointer;
    }
    .btn:hover{ /* 마우스가 버튼에 올라가면 배경을 조금 더 어둡게 처리 */
        filter: brightness(95%);
    }
    

</style>

	 <form action="login" method="post" autocomplete="off">
                <div class="container w-400">
		
                    <div class="row">
                        <input type="text" name="memberId" class="form-input w-100" placeholder="아이디">
                    </div>

                    <div class="row">
                        <input type="password" name="memberPw" class="form-input w-100" placeholder="비밀번호">
                    </div>

                    <div class="row">
                        <button class="btn w-100">로그인</button>
                    </div>

                    <div class="row">
                        <hr width="350px">
                    </div>

                    <div class="float-container">
                    <div class="row col-2 right">
                        <a href="/member/findPw">비밀번호 찾기&nbsp;|</a>
                    </div>
                    <div class="row col-2 left">
                        <a href="/member/join">&nbsp;회원가입 하기</a>
                    </div>
                </div>

                </div>
                </form>

<c:if test="${param.error != null}">
	<h3 style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</h3>
</c:if>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>