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
                text-align: center;
                padding-top: 0.2em;
                box-shadow: 0px 0px 5px 2px #D1CFCF;
                border-radius: 15px;
                color: #360a01;
                background-color: #ffff;
                font-size: 15px;
                font-weight: bold;
                width: 65px;
                height: 65px;
                margin: 1.2em; 
            }
    
            .col-5 {
                width: 20%;
            }
    
            .i-font {
                margin-top: -5px;
                font-size: 15px;
                color: #360a01;
                font-weight: bold;
    
            }
    
            .fa-solid {
                font-size: 40px;
                color: #360a01;
				padding: auto;
                padding-top: 0.05em;
            }
    
            .logo{
                margin-top: -20px;
            }
            
    </style>
    <!-- js작성공간 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body class="center">
<div class="right">
        <div class="etc">
                
               <c:choose>
			<c:when test="${sessionScope.name != null}">
			
                <div class="row">
                    <a href="/member/logout" class="link">로그아웃</a>
                </div>              
                &nbsp;
                <div class="row">
                    |
                </div>
                 &nbsp;                
                <div class="row">
                    <a href="/reservation/list" class="link"> 예매확인</a>
                </div>
                &nbsp;
                <div class="row">
                    |
                </div>
                &nbsp;
                <div class="row">
                    <a href="/member/mypage" class="link">마이페이지</a>	              
                </div>        
            </c:when>
            
            <c:otherwise>
            	 <div class="row">
                    <a href="/member/login" class="link">로그인</a>
                </div>
                &nbsp;
                <div class="row">
                    |
                </div>
                &nbsp;
                <div class="row">
                    <a href="/member/join" class="link">회원가입</a>                    
                </div>        
            </c:otherwise>
            </c:choose>
            </div>
    </div>
    
    <main>
        <header>
            <div class="logo">
                <a href="/"><img src="/images/logo.jpg" width="200" alt=""></a>
            </div>
            
             <nav>
                   <ul class="menu center">
    
                        <div class="title float-container">
    
                            <div class="row col-5">
                                <div class="row">
                                    <li><a href="/schedule/doosan">
                                            <i class="fa-solid fa-calendar-days"></i></a></li>
                                </div>
                                <div class="row i-font">
                                    경기일정
                                </div>
                            </div>
    
    
                            <div class="row col-5">
                                <div class="row">
                                    <li><a href="/reservationList">
                                            <i class="fa-solid fa-ticket"></i></a></li>
                                </div>
                                <div class="row i-font">
                                    예매하기
                                </div>
                                
                            </div>
    
                            <div class="row col-5">
                                <div class="row">
                                    <li><a href="/teamInfo">
                                            <i class="fa-solid fa-baseball-bat-ball"></i></a></li>
                                </div>
                                <div class="row i-font">
                                    팀정보
                                </div>
                            </div>
    
                            <div class="row col-5">
                                <div class="row">
                                    <li><a href="/ranking">
                                            <i class="fa-solid fa-ranking-star"></i></a></li>
                                </div>
                                <div class="row i-font">
                                    팀순위
                                </div>
                            </div>
    
                            <div class="row col-5">
                                <div class="row">
                                    <li><a href="/board/list">
                                            <i class="fa-solid fa-check"></i></a></li>
                                </div>
                                <div class="row i-font">
                                    공지사항
                                </div>
                            </div>
    
                        </div>
    
                    </ul>
                </nav>

        </header>
        <nav>
        <section>
