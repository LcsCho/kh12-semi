<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈런볼</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/4.css">
<!--     <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
    <link rel="stylesheet" type="text/css" href="/css/semi-layout.css">


    <!-- 아이콘 사용을 위한 font awesomedmf 불러오기 위한  -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


    <style>
         nav ul.menu li a i {
            display: block;
        }

        #delete-border.btn {
            border: 10px solid;
        }

        ul.menu li {
            padding-top: 1.3em;
            color: #360a01;
            background-color: #ffff;
            line-height: 2.5em;
            font-size: 18px;
            font-weight: bold;
        }
        .fa-solid{
            font-size: 40px;
            color: #360a01;
        }
        
    </style>
    <!-- js작성공간 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
    <main>
        <header>
            <div class="logo">
                <a href="/"><img src="/images/logo.jpg" width="200" alt=""></a>
            </div>
            
             <nav>
                <ul class="menu center">

                        <div class="title float-container">
                        <div class="row col-5 flex-container">
                            <li><a href="#">
                                    <i class="fa-solid fa-calendar-days"></i>경기일정</a>
                            </li>
                        </div>

                        <div class="row col-5">
                            <li><a href="#">
                                    <i class="fa-solid fa-ticket"></i>예매하기</a></li>
                        </div>

                        <div class="row col-5">
                            <li><a href="#">
                                    <i class="fa-solid fa-chair"></i>팀정보</a></li>
                        </div>

                        <div class="row col-5">
                            <li><a href="#">
                                    <i class="fa-solid fa-ranking-star"></i>팀순위</a>
                            </li>
                        </div>

                        <div class="row col-5">
                            <li><a href="/board/list">
                                    <i class="fa-solid fa-check"></i>공지사항</a></li>
                            </li>
                        </div>
                    </div>

                    </ul>
                </nav>
                
                <div class="etc">
                
               <c:choose>
			<c:when test="${sessionScope.name != null}">
                <div class="row">
                    <a href="/member/logout">로그아웃 </a>
                </div>
                &nbsp;
                <div class="row">
                    |
                </div>
                <div class="row">
                    <a href="/member/logout">예매확인 </a>
                </div>
                &nbsp;
                <div class="row">
                    |
                </div>
                &nbsp;
                <div class="row">
                    <a href="/member/mypage">마이페이지</a>	              
                </div>        
            </c:when>
            
            <c:otherwise>
            	 <div class="row">
                    <a href="/member/login">로그인</a>
                </div>
                &nbsp;
                <div class="row">
                    |
                </div>
                &nbsp;
                <div class="row">
                    <a href="/member/join">회원가입</a>                    
                </div>        
            </c:otherwise>
            </c:choose>
            </div>
        </header>
        <section>