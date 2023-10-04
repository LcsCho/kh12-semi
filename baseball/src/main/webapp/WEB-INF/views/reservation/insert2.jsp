<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript 실습</title>

    <!-- css 파일을 불러오는 코드 -->

    <!-- 아이콘 사용을 위한 Font Awesome 6 CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- 구글 웹 폰트 사용을 위한 CDN -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- 내가 만든 CSS 파일-->
    <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="./css/test.css"> -->
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
    <!-- 1단계 페이지 HTML 파일 -->
<script>
$(document).ready(function () {
    var seatNumber = 1; // 좌석 번호를 나타내는 변수

    // zone의 좌석 생성
    var zone = document.createElement("div"); // 각 구역을 나타내는 <div> 요소 생성
    zone.className = "zone"; // 구역을 나타내는 CSS 클래스 추가

    // 좌석을 생성하고 zone에 추가하는 코드 (이전의 코드와 동일)

    // zone을 .inputzone에 추가
    $(".inputzone").append(zone);

    var selectedSeats = []; // 선택된 좌석을 저장하는 배열
    var maxSeats = 4; // 최대 선택 가능한 좌석 수

    $(".refresh-button").click(function () {
        // 모든 체크박스를 해제
        $("input[type='checkbox']").prop("checked", false);

        // 선택된 좌석 리스트와 표시된 좌석을 지우기
        $(".selected-seats-list").empty();
        $(".selected-seats").empty();

        // 선택된 좌석 배열 초기화
        selectedSeats = [];
    });

    for (var a = 1; a <= 120; a++) {
        var input = document.createElement("input");
        input.type = "checkbox";
        input.name = "seatNo"; // 좌석의 이름 설정 (예: seatNo)
        input.value = seatNumber; // 좌석 번호를 값으로 설정

        // data-zone 속성을 추가하여 구역 정보 저장
        input.setAttribute("data-zone", selectedArea);

        $(zone).append(input);

        if (a % 4 === 0) {
            // 4개의 좌석 뒤에 띄어쓰기 추가
            for (var i = 0; i < 4; i++) {
                var space = document.createElement("span");
                space.textContent = " "; // 띄어쓰기 문자 추가
                $(zone).append(space);
            }
        }

        if (a % 12 === 0) {
            // 12열마다 줄바꿈 추가
            $(zone).append("<br>");
        }

        seatNumber++; // 좌석 번호 증가
    }

    // A zone을 .inputzone에 추가
    $(".inputzone").append(zone);

    // 페이지 로드 시 선택한 구역 정보를 가져옵니다.
    var selectedArea = localStorage.getItem("selectedArea");

    $("input[name='seatAreaZone']").change(function () {
        selectedArea = $(this).data("zone");
        $(".selected-seats-list").text("구역: " + selectedArea);
    });

    $(".inputzone input[type='checkbox']").change(function () {
        // 체크박스가 변경될 때마다 호출됩니다.
        var checked = $(this).prop("checked"); // 체크박스의 체크 여부를 확인합니다.
        var seatNo = $(this).val(); // 선택된 좌석 번호를 가져옵니다.

        if (checked) {
            // 체크박스가 체크되었을 때
            if (selectedSeats.length < maxSeats) {
                // 선택된 좌석이 최대 허용 개수 미만이면 추가합니다.
                selectedSeats.push(seatNo);
            } else {
                // 이미 최대 개수의 좌석을 선택한 경우 체크를 해제합니다.
                $(this).prop("checked", false);
                selectedSeats.pop(); // 선택된 좌석 배열에서 마지막 항목을 제거합니다.
                window.alert("최대 4매까지 예매 가능합니다");
            }
        } else {
            // 체크박스가 해제되었을 때
            var index = selectedSeats.indexOf(seatNo);
            if (index !== -1) {
                // 배열에서 해당 좌석을 제거합니다.
                selectedSeats.splice(index, 1);
            }
        }

        // 선택된 좌석 정보를 업데이트합니다.
        updateSelectedSeats(selectedSeats);
    });

    // 구역 선택이 변경되었을 때
    $("input[name='seatAreaZone']").change(function () {
        $("input[name='seatAreaZone']").not(this).prop("checked", false); // 다른 구역 체크 해제
    });

    $(".btn-next").click(function () {
        // 선택한 구역 정보를 다음 페이지로 전달합니다.
        var selectedArea = $("input[name='seatAreaZone']:checked").data("zone");
        localStorage.setItem("selectedArea", selectedArea);

        // 선택한 좌석 정보를 로컬 스토리지에 저장합니다.
        localStorage.setItem("selectedSeats", JSON.stringify(selectedSeats));
    });

    function updateSelectedSeats(seats) {
        // 선택된 좌석 정보를 업데이트하는 함수
        var selectedSeatsCount = seats.length;
        $(".selected-seats").text("(" + selectedSeatsCount + "석)");

        // 선택된 좌석 번호를 출력합니다.
        $(".selected-seats-list").text("구역: " + selectedArea + ", 좌석: " + seats.join(", "));
        $(".seatAreaNo").text(selectedArea);
        $(".seatNo").text(seats.join(", "));
    }

    $(".btn-prev").click(function () {
        // 이전 단계 버튼을 클릭했을 때 호출되는 함수

        // 모든 체크박스를 해제
        $("input[type='checkbox']").prop("checked", false);

        // 선택된 좌석 리스트와 표시된 좌석을 지우기
        $(".selected-seats-list").empty();
        $(".selected-seats").empty();

        // 선택된 좌석 배열 초기화
        selectedSeats = [];

        // 이전 단계로 이동 (이 부분은 페이지 이동 로직을 구현해야 합니다)
        // 예를 들어, 이전 페이지로 이동하는 코드를 추가하면 됩니다.
        // window.location.href = "이전 페이지 URL";
    });
       
    });

    </script>
</head>

<body>
    <form class="" action="" method="post" autocomplete="off">

        <div class="container w-600">

            <!-- 1단계 : 예매하기 -->
            <div class="row page">
                <div class="row seatreservation">
                    <h2 class="left ms-10">예매하기</h2>
                </div>

                <!-- 왼쪽에 이미지를 추가하는 부분 (col 사용) -->
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
                        <input type="checkbox" name="seatAreaZone" id="zoneA" data-zone="A">
                        <label for="zoneA">A</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneB" data-zone="B">
                        <label for="zoneB">B</label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="seatAreaZone" id="zoneC" data-zone="C">
                        <label for="zoneC">C</label>
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
                            <button type="button" class="refresh-button">새로고침</button>
                            <div class="boxborder ms-10">                           
                                선택된 좌석<label class="selected-seats"></label>
                            </div>
                            <div class="row left">
                            <label class="selected-seats-list"></label>
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
                <div class="row page page3">
                    <div class="row">
                        <h2>3단계 : 예매완료</h2>
                    </div>

                    <h3>예매 정보</h3>
                    구역 : <label class="seatAreaNo"></label><br>
                    좌석번호 : <label class="seatNo"></label>
 

                    <div class="row right">
                        <button type="button" class="btn btn-prev">
                            이전단계
                        </button>
                        <button type="button" class="btn btn-next">
                            다음단계
                        </button>
                    </div>
                </div>


            </div>

    </form>
</body>

</html>