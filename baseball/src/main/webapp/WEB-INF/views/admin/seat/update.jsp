<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>

<div class="container">
    <h1>좌석 상태 변경 페이지</h1>

    <form action="update" method="post" autocomplete="off">
        <input type="hidden" name="seatCol" value="${seatListDto.seatCol}">
        <input type="hidden" name="seatRow" value="${seatListDto.seatRow}">
        <input type="hidden" name="stadiumName" value="${seatListDto.stadiumName}">
        <input type="hidden" name="seatAreaZone" value="${seatListDto.seatAreaZone}">

        <select class="form-input" name="seatStatus">
            <option value="Y">Y</option>
            <option value="R">R</option>
            <option value="N">N</option>
        </select>

        <button type="submit" class="btn">업데이트</button>
    </form>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>