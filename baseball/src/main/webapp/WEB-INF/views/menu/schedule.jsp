<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

            .teamlogo{
                width: 30%;
                margin-right: -2em;
                margin-left: 2em;
            }
            .notice{
                margin-left: -1.5em;
                width: 70%;
                height: 180px;
                box-shadow: 0px 0px 0px 2px #D1CFCF;
            }
            .team-notice{
                width: 20%;
                color: #1AA8BB;
                font-weight: bold;
                font-size: 20px;
                padding-left: 2em;
                padding-top: 4em;
            }
            .pre-notice{
                padding-left: 1em;
                padding-top: 2em;
                width: 80%;
                color: #62676C;
            }

        .col-7.schedule-top {
            box-shadow: 0px 0px 0px 1px #D1CFCF;
            height: 50px;
            padding-top: 1em;
            font-weight: bold;
            font-size: 17px;
        }

        .col-7.schedule-bottom {
            box-shadow: 0px 0px 0px 1px #D1CFCF;
            height: 200px;
            font-weight: bold;
            font-size: 17px;
            margin-top: -1.9em;
        }

        .day{
            padding-left: 1em;
            font-size: 13px;
        }

        .font{
        font-weight: bold;
        font-size: 15px;
        color: #838383;
        margin-top: -1em;
    }

    .btn{
        font-size: 18px;
        margin: 0.5em;
        border-radius: 10px;
        background-color: #360a01;
        color: white;
        border: none;
    }
        </style>

 <div class="container w-1000">

                    <div class="float-container">
                        <div class="col-2 teamlogo">
                            <img src="/images/두산.png" width="200px"> 
                        </div>
                        <div class="col-2 notice">
                            <div class="float-container">
                                <div class="col-2 team-notice">구단공지</div>
                                <div class="col-2 pre-notice">
                                    <pre>
* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능
(단, 경기 시작 2시간 30분 전부터는 취소는 불가하오니 예매 시 참고)
* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
* 36개월 이상 어린이는 티켓 구매 후 입장 가능.
* 권종선택 실수로 인한 예매권은 현장에서 교환/환불 불가합니다.
(현장에서 재구매 해야합니다.)
                                    </pre>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row left mb-20">
                           <label class="open">예매하기 <2023. 10></label>
                    </div>

                    <div class="container w-1000 reservation">

                    <div class="float-container center">
            
                        <div class="col-7 schedule-top">
                            월요일
                        </div>
                        <div class="col-7 schedule-top">
                            화요일
                        </div>
                        <div class="col-7 schedule-top">
                            수요일
                        </div>
                        <div class="col-7 schedule-top">
                            목요일
                        </div>
                        <div class="col-7 schedule-top">
                            금요일
                        </div>
                        <div class="col-7 schedule-top">
                            토요일
                        </div>
                        <div class="col-7 schedule-top">
                            일요일
                        </div>
                        
                    </div>
                    
                    <!-- 1주차 -->
                    <div class="float-container">
        
                        <div class="col-7 schedule-bottom">
                            
                        </div>
        
                        <div class="col-7 schedule-bottom">
                           
                        </div>
        
                        <div class="col-7 schedule-bottom">
                            
                        </div>
                        
                        <div class="col-7 schedule-bottom">
                            
                        </div>

                        <div class="col-7 schedule-bottom">
                            
                        </div>

                        <div class="col-7 schedule-bottom">
                           
                        </div>

             <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">1</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>

                    </div>

                    <!-- 2주차 -->
                    <div class="float-container">
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">2</label>
                            </div>

                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">3</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">4</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>
                        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">5</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">6</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">7</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>

             <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">8</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </div>

                    </div>

                    <!-- 3주차 -->
                    <div class="float-container">
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">9</label>
                            </div>

                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">10</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">11</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
                        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">12</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">13</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">14</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

             <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">15</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                    </div>

                    <!-- 4주차 -->
                    <div class="float-container">
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">16</label>
                            </div>

                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">17</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">18</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
                        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">19</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">20</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">21</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

             <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">22</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                    </div>

                    <!-- 5주차 -->
                    <div class="float-container">
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">23</label>
                            </div>

                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">24</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">25</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
                        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">26</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">27</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">28</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

             <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">29</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>

                    </div>

                    <!-- 6주차 -->
                    <div class="float-container">
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">30</label>
                            </div>

                        </div>
        
                        <div class="col-7 schedule-bottom">
                            <div class="row left">
                                <label class="day left">31</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </div>
        
                        <div class="col-7 schedule-bottom">
                            
                        </div>
                        
                        <div class="col-7 schedule-bottom">
                            
                        </div>

                        <div class="col-7 schedule-bottom">
                            
                        </div>

                        <div class="col-7 schedule-bottom">
                         
                        </div>

             <div class="col-7 schedule-bottom">
                         
                        </div>

                    </div>
        
                    </div>
              
                </div>
            </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>