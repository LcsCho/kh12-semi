<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈런볼</title>
    <!-- 외부에 만들어진 css파일을 불러오는 코드 -->

    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/4.css">
    <link rel="stylesheet" type="text/css" href="/css/test.css">
    <link rel="stylesheet" type="text/css" href="/css/semi-layout.css">


    <!-- 아이콘 사용을 위한 font awesomedmf 불러오기 위한  -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">



    <style>
        nav ul.menu li a i {
            display: block;
        }

        #delete-border.btn{
            border: 0px solid;
        }
    </style>
    <!-- js작성공간 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
    <main>
        <header>
            <div class="logo">
                <img src="./image/logo.jpg" width="200" alt="">
            </div>
            <div class="title">
                <input class="form-input" type="text" placeholder="검색어를 입력하세요">
                <button id="delete-border" class="btn"><i class="fa-solid fa-magnifying-glass fa-2x"></i></button>
            </div>

            <div class="etc left">
                <a href="">로그아웃/로그인 </a>|
                <a href="">예매 확인 </a>|
                <a href="">회원아이디</a>

            </div>
        </header>
        <nav>
            <ul class="menu center">
                <li><a href="#"><i class="fa-solid fa-calendar-days fa-2x"></i>경기일정</a></li>
                <li><a href="#"><i class="fa-solid fa-ticket fa-2x"></i>예매하기</a></li>
                <li><a href="#"><i class="fa-solid fa-chair fa-2x"></i>좌석정보</a>
                    <ul>
                        <li><a href="/pocketmon/insert">등록</a></li>
                    </ul>
                </li>
                <li class="menu-right">
                    <a href="#"><i class="fa-solid fa-ranking-star fa-2x"></i>기록/순위</a>
                    <ul>
                        <li><a href="/member/logout">로그아웃</a></li>
                        <li><a href="/admin/home">관리자메뉴</a></li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa-solid fa-baseball-bat-ball fa-2x"></i>구단정보</a></li>
                <li><a href="/board/list"><i class="fa-solid fa-check fa-2x"></i>공지사항</a></li>
                <li class="menu-right">
                    <a href="/member/login"><i class="fa-solid fa-question fa-2x"></i>???</a>
                    <ul>
                        <li><a href="/member/join">회원가입</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <section>