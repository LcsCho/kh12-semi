<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ȩ����</title>
    <!-- �ܺο� ������� css������ �ҷ����� �ڵ� -->

    <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/4.css">
    <link rel="stylesheet" type="text/css" href="./css/test.css">
    <link rel="stylesheet" type="text/css" href="./css/semi-layout.css">


    <!-- ������ ����� ���� font awesomedmf �ҷ����� ����  -->
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
    <!-- js�ۼ����� -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
    <main>
        <header>
            <div class="logo">
                <img src="./image/logo.jpg" width="200" alt="">
            </div>
            <div class="title">
                <input class="form-input" type="text" placeholder="�˻�� �Է��ϼ���">
                <button id="delete-border" class="btn"><i class="fa-solid fa-magnifying-glass fa-2x"></i></button>
            </div>

            <div class="etc left">
                <a href="">�α׾ƿ�/�α��� </a>|
                <a href="">���� Ȯ�� </a>|
                <a href="">ȸ�����̵�</a>

            </div>
        </header>
        <nav>
            <ul class="menu center">
                <li><a href="#"><i class="fa-solid fa-calendar-days fa-2x"></i>�������</a></li>
                <li><a href="#"><i class="fa-solid fa-ticket fa-2x"></i>�����ϱ�</a></li>
                <li><a href="#"><i class="fa-solid fa-chair fa-2x"></i>�¼�����</a>
                    <ul>
                        <li><a href="/pocketmon/insert">���</a></li>
                    </ul>
                </li>
                <li class="menu-right">
                    <a href="#"><i class="fa-solid fa-ranking-star fa-2x"></i>���/����</a>
                    <ul>
                        <li><a href="/member/logout">�α׾ƿ�</a></li>
                        <li><a href="/admin/home">�����ڸ޴�</a></li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa-solid fa-baseball-bat-ball fa-2x"></i>��������</a></li>
                <li><a href="/board/list"><i class="fa-solid fa-check fa-2x"></i>��������</a></li>
                <li class="menu-right">
                    <a href="/member/login"><i class="fa-solid fa-question fa-2x"></i>???</a>
                    <ul>
                        <li><a href="/member/join">ȸ������</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <section>