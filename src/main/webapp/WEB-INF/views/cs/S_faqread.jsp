<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>


<!-- 개인정보수정 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">



	<h1>FAQ</h1>	
	<form role="form" method="POST">
		<input class="form-control" type="hidden" name="bno" value="${CsfaqVO.bno}" readonly>
	</form>
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>${CsfaqVO.title}</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
<<<<<<< HEAD
=======
			<!-- 문> textarea 부분을 수동으로 늘어나지 못하게 style을 먹였고, 
			cols(세로)와 rows(가로)를 먹여서 가로 세로 폭을 조절했음
			CsfaqVO.content도 content로 바꿨음(컨트롤러에서 model객체 작업을 했기때문에)   -->
>>>>>>> branch 'pbranch9' of https://github.com/LovelyMoonpeel/Recruit.git
			<td>${content}</td>
		</tr>
	</table>
	
	<input type="submit" class="btn btn-primary" value="목록">
		
</div>
<!-- //관리자정보수정 페이지 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

console.log(formObj);

$(".btn-primary").on("click", function(){
	self.location = "/cs/faq";
});

</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>