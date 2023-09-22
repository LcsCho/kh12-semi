<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- summernote cdn -->
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
        .note-editable {
            line-height: 2 !important;
        }
    </style>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script>
<!-- javascript 작성 공간 -->
    $(function () {
        $('[name=boardContent]').summernote({
            placeholder: '내용을 작성하세요',
            tabsize: 2, //탭을 누르면 이동할 간격
            height: 250, //에디터 높이
            minHeight: 250, //에디터 최소높이
            lineHeight:20, //기본 줄간격(px)
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'italic']],
                ['color', ['color']],
                ['para', ['paragraph']],
                ['table', ['table']],
                ['insert', ['link']],
            ]
        });
    });
</script>

<form action="write" method="post" autocomplete="off" >
	
	<div class="container w-600">
	
        <div class="row">
			<h1>게시글 작성</h1>
        </div>
        
        <div class="row left">
         <label>제목</label>     
		<input type="text" name="boardTitle" class="form-input w-100" >
        </div>
        
        <div class="row left">
            <label>내용</label>
            <textarea name="boardContent" class="form-input w-100" style="min-height:250px" ></textarea>
        </div>
        
        <div class="row right">
            <button type="submit" class="btn btn-positive">
            <i class="fa-solid fa-plus"></i>
            작성하기</button>
            <a href="list" class="btn">목록보기</a>
        </div>
    </div>

</form>