<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<!-- summernote cdn -->
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
     .note-editable {
            line-height: 2 !important;
        }
        
         .form-input {
            height: 40px;
            font-size: 15px;
        }

       .btn, .btn.btn-positive {
            width: 100px;
            height: 40px;
            font-size: 15px;
            border-radius: 0px;
        }
        
        .btn.row{
		padding-top: 0.8em;
		}
        
	/* Summernote 툴바를 왼쪽으로 이동 */
	.note-toolbar {
	    text-align: left; /* 툴바 내용을 왼쪽 정렬 */
	}
	
	/* 툴바 버튼들을 왼쪽 정렬 */
	.note-toolbar button {
	    float: left;
	    margin-right: 5px; /* 버튼 간격 설정 (원하는 간격으로 조절) */
	}
	
	/* 툴바 드롭다운 메뉴들도 왼쪽 정렬 */
	.note-toolbar .dropdown-menu {
	    text-align: left;
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
        $("[name=boardContent]").summernote("fontSize", "20px");
        $("[name=boardContent]").summernote("lineHeight", "1.5em");
    });
</script>

<form action="edit" method="post">
<input type="hidden" name="boardNo" value="${boardDto.boardNo}">

<div class="container w-800">
	<div class="left mb-30">
			<h3>게시글 수정</h3>
        </div>
	
	<div class="row">
		<input class="form-input w-100" type="text" name="boardTitle" value="${boardDto.boardTitle}" required>
	</div>
	
	<div class="row left">
		<textarea class="form-input w-100" name="boardContent" 
			style="min-height:250px" required>${boardDto.boardContent}</textarea>
	</div>
	
	<div class="row right">
		<a href="list" class="btn row">
			목록
		</a>
		<button type="submit" class="btn btn-edit">
			수정하기
		</button>
		
	</div>
</div>

</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>