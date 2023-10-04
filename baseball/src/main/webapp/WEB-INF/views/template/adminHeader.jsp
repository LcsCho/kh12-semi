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
<!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
<link rel="stylesheet" type="text/css" href="/css/semi-layout.css">


<!-- 아이콘 사용을 위한 font awesomedmf 불러오기 위한  -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


<style>
<
style>nav ul.menu li a i {
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
	width: 14%;
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
}

.logo {
	margin-top: -20px;
}

header>.logo {
	width: 25%;
	display: flex;
	justify-content: left;
	align-items: center;
	margin-left: 0em;
}
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
						<a href="/member/logout">로그아웃</a>
					</div>              
                &nbsp;
                <div class="row">|</div>
                 &nbsp;                
                <div class="row">
						<a href="/member/logout"> 예매확인</a>
					</div>
                &nbsp;
                <div class="row">|</div>
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
                <div class="row">|</div>
                &nbsp;
                <div class="row">
						<a href="/member/join">회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<main>
		<header>
			<div class="logo">
				<a href="/admin/home"><img src="/images/logo.jpg" width="200"
					alt=""></a>
			</div>
			<nav>
				<ul class="menu center">
					<div class="title float-container">
						<div class="row col-5">
							<div class="row">
								<li><a href="/admin/team/list"> <i
										class="fa-solid fa-people-group"></i></a></li>
							</div>
							<div class="row i-font">팀관리</div>
						</div>
						<div class="row col-5">
							<div class="row">
								<li><a href="/admin/stadium/list"> <i
										class="fa-solid fa-landmark-dome"></i></a></li>
							</div>
							<div class="row i-font">경기장관리</div>
						</div>
						<div class="row col-5">
							<div class="row">
								<li><a href="/admin/match/list"> <i
										class="fa-solid fa-baseball-bat-ball"></i></a></li>
							</div>
							<div class="row i-font">경기관리</div>
						</div>
						<div class="row col-5">
							<div class="row">
								<li><a href="/admin/seat/list"> <i
										class="fa-solid fa-chair"></i></a></li>
							</div>
							<div class="row i-font">좌석관리</div>
						</div>
						<div class="row col-5">
							<div class="row">
								<li><a href="/admin/reservation/list"> <i
										class="fa-solid fa-ticket"></i></a></li>
							</div>
							<div class="row i-font">예매관리</div>
						</div>
						<div class="row col-5">
							<div class="row">
								<li><a href="/admin/member/list"> <i
										class="fa-solid fa-user"></i></a></li>
							</div>
							<div class="row i-font">회원관리</div>
						</div>

						<div class="row col-5">
							<div class="row">
								<li><a href="/board/list"> <i class="fa-solid fa-check"></i></a></li>
							</div>
							<div class="row i-font">공지사항</div>
						</div>
					</div>
				</ul>
			</nav>
		</header>
		<nav>
			<section>