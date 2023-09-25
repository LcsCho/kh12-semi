<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>


  <style>
        .boxborder {
        box-shadow: 0px 0px 0px 1px #2d3436;
        padding: 1em;
    }
        .clickseat {
            height: 550px;
        }

        .seatreservation {
            padding: 5px;
            font-weight: bold;
            font-size: 16px;
            background-color: #360a01;
            color: white;
        }

        .float-container>.float-left {
            float: left;
            width: 70%;
            /* 왼쪽 영역이 70%로 설정 */
        }

        .float-container>.float-right {
            float: right;
            width: 30%;
            /* 오른쪽 영역이 30%로 설정 */
        }

        .image-container img {
            max-width: 100%;
            height: auto;
        }
        .checkbox {
            display: flex;
            align-items: center;
            /* 세로 중앙 정렬 */
            margin-bottom: 2.27%;
        }
        .btn {
            background-color: #360a01;
            color: white;
            width: 120px;
        }


    .seatrow {
        margin: 0.1em;
    }
    </style>

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="multipage.js"></script>
    <!-- javascript 작성 공간 -->
    <script>





$(document).ready(function() {
    for (var i = 0; i < 10; i++) {
        var zone = document.createElement("div"); // 각 구역을 나타내는 <div> 요소 생성
        zone.className = "zone"; // 구역을 나타내는 CSS 클래스 추가
        $(".inputzone").append(zone); // .inputzone에 구역을 추가

        for (var a = 0; a < 12; a++) {
            var input = document.createElement("input");
            input.type = "checkbox";
            input.name = "zone" + i + "seat" + a; // 좌석의 이름 설정 (예: zone0seat0, zone0seat1, ...)

            if (a % 4 === 3 && a !== 19) {
                // 4번째와 8번째 좌석 뒤에 띄어쓰기 추가 (19는 띄어쓰기를 추가하지 않는 조건)
                $(zone).append(input);
                $(zone).append(" "); // 띄어쓰기 추가
            } else {
                $(zone).append(input);
            }
        }
    }
});
    </script>
</head>

<body>
    <form class="" action="" method="post" autocomplete="off">

        <div class="container w-600">


          
            <div class="row page">
                <div class="row seatreservation">
                    <h2 class="left ms-10">예매하기</h2>
                </div>

                <div class="float-container">
                    <div class="float-left">
                        <div class="image-container boxborder">
                            <img src="./image/seatimage.png">
                        </div>
                    </div>


                    <!-- 체크박스를 사용하여 구역 선택 -->
                    <div class="boxborder">
                    <label for="seatAreaZone">구역 선택:</label>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">A</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">B</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">C</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">D</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">E</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">F</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">G</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">H</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">I</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneA" value="A">
                        <label for="zoneA">J</label>
                    </div>
                </div>
            </div>
                <div class="row right">
                    <button type="button" class="btn btn-prev">
                        이전단계
                    </button>
                    <button type="button" class="btn btn-next">
                        다음단계
                    </button>
                </div>
            </div>
                <!-- 2단계 : 좌석선택 -->
                <div class="row page">
                    <div class="row seatreservation">
                        <h2 class="left ms-10">좌석선택</h2>
                    </div>
                    <div class="row float-container boxborder">

                        <div class="float-left clickseat boxborder">
                            <div class="row"
                                style="height: 30%; background-color: green; color: white; font-weight: bold; display: flex; justify-content: center;align-items: center;">
                                GROUND
                            </div>

                            <div class="row">
                                A zone
                            </div>
                            <div class="inputzone">
                            
                            </div>
                        </div>

                        <div class="float-right clickseat">
                            <div style="height: 50%;">
                                <img src="./image/seatimage.png" style="max-block-size: 45%;" class="mt-10 ms-20">
                            </div>
                            <div class="boxborder ms-10">
                                선택좌석(0석)
                            </div>
                        </div>
                    </div>

                    <div class="row right">
                        <button type="button" class="btn btn-prev">
                            이전단계
                        </button>
                        <button type="button" class="btn btn-next">
                            다음단계
                        </button>
                    </div>
                </div>

                <!-- 3단계 : 예매완료 -->
                <div class="row page">
                    <div class="row">
                        <h2>3단계 : 예매완료</h2>
                    </div>


                    <div class="row right">
                        <button type="button" class="btn btn-prev">
                            이전단계
                        </button>
                        <button type="button" class="btn btn-next">
                            다음단계
                        </button>
                    </div>
                </div>

                <!-- 5단계 : 주소 -->
                <div class="row page">
                    <div class="row right">
                        <button type="button" class="btn btn-prev">
                            이전단계
                        </button>
                        <button type="button" class="btn btn-next">
                            다음단계
                        </button>
                        <button type="submit" class="btn btn-positive">가입하기</button>
                    </div>
                </div>

            </div>

    </form>
</body>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>