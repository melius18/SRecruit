<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/aheader.jsp"%>


<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->
<!-- 공고 작성 바디 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<!-- <div class="col-md-9"> -->


	<!-- 회사 기본 정보  -->
	<!-- DB에서 값을 불러와서 td에 채워 넣어야 함  -->
	
	<h3>기본정보</h3>
	<table class="table table-bordered">
		<tr>
			<th>기업명</th>
			<td>${CInfoVO.cname}</td>
			<th>대표자명</th>
			<td>${CInfoVO.ceo}</td>
		</tr>
		<tr> 
			<th>업종</th>
			<td colspan="3">${CInfoVO.ctype}</td>
		</tr>
		<tr>
			<th>기업형태</th>
			<td colspan="3">${CInfoVO.form}</td>
		</tr>
		<tr>
			<th>설립일</th>
			<td colspan="3">${CInfoVO.establish}</td>
		</tr>
		<tr>
			<th>매출액</th>
			<td colspan="3">${CInfoVO.sales}</td>
		</tr>
		<tr>
			<th>대표전화</th>
			<td>${CInfoVO.tel}</td>
			<th>FAX</th>
			<td>${CInfoVO.fax}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td><a href="${CInfoVO.homepage}" class="link_site"
				target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
			<th>SNS / 블로그</th>
			<td><a href="{cinfoVO.sns}" class="link_site"
				target="_blank" rel="nofollow">${CInfoVO.sns}</a></td>
		</tr>
		<tr>
			<th>기업주소</th>
			<td colspan="3">${CInfoVO.location}</td>
		</tr>
	</table>
	<br> <br> <br>
	<!-- // 회사 기본 정보 끝 -->
	<!-- 공고 입력 부분 -->
	<h3>모집부문</h3>
	<form role="form" method="POST">
	<input type="hidden" name="id" value="${CInfoVO.id}"/>
	<input type="hidden" name="bno" value="${RecruitVO.bno}"/>
	<h3>공고제목</h3>
	<input type="text" name="title" class="form-control" value="${RecruitVO.title}"> <br>
	
		<table class="table table-bordered" id="my-tbody">
			<tr>
				<th>모집직종</th>
				<td>
				<%-- <input type="text" value="${RecruitVO.jobgroupid}" name="jobgroupid"> --%>
				<select id="jobGroup" name="jobgroupid">
				<option value="">모집직종</option>
					<c:forEach items="${jobgroupList}" var="JobGroupVO">
					<option value="${JobGroupVO.id}"
					<c:if test="${JobGroupVO.id == RecruitVO.jobgroupid}">selected</c:if>
					>${JobGroupVO.jobgroup}</option>
					</c:forEach>
				</select> 
				
				<select id="subjobGroup" name="jobgroupid2">
				</select>
				</td> 
				
			</tr>
			<tr>
				<th>근무지역</th>
				<td>
				<select id="region" name='rgbid'>
					<option value="">근무지역</option>
					<c:forEach items="${regionList}" var="RegionVO">
						<option value="${RegionVO.rgbid}"
						<c:if test="${RegionVO.rgbid == RecruitVO.rgbid}">selected</c:if>
						>${RegionVO.rgbname}</option>
					</c:forEach>
				</select>
				
				<select id="subRegion" name='rgsid'>
				</select>				
				</td>
			</tr>
			<tr>
				<th>담당업무</th>
				<td><textarea class="form-control" name="jobdesc" cols="30" rows="5" style="resize: none;">${RecruitVO.jobdesc}</textarea></td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td><input type="text" name="recruitnum" value="${RecruitVO.recruitnum }">명</td>
			</tr>
			<tr>
				<th>근무형태</th>
				<td>
				<select name="employstatusid">
					<option value="">근무형태</option>
						
					<c:forEach items="${codeList}" var="CodeVO">
					<c:if test="${CodeVO.tid==4}">
					
					<option value="${CodeVO.id}"
					<c:if test="${CodeVO.id == RecruitVO.employstatusid}">selected</c:if>
					>${CodeVO.career}</option>
					
					</c:if>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>급여사항</th>
				<td>
				<select name="salaryid">
					<option value="null">급여사항</option>
					<c:forEach items="${codeList}" var="CodeVO">
						<c:if test="${CodeVO.tid==7}">
							<option value="${CodeVO.id}"
							<c:if test="${CodeVO.id == RecruitVO.salaryid}">selected</c:if>
							>${CodeVO.career}</option>
						</c:if>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>학력</th>
				<td><select name="edu">
						<option value="null">학력</option>
						
						<c:forEach items="${codeList}" var="CodeVO">
						<c:if test="${CodeVO.tid==2}">
						
						<option value="${CodeVO.id}"
						<c:if test="${CodeVO.id == RecruitVO.edu}">selected</c:if>
						>${CodeVO.career}</option>
						
						</c:if>
						</c:forEach>
						
				</select></td>
			</tr>
			<tr>
				<th>경력</th>
				<td><select name="exp">
						<option value="null">경력</option>
						
						<c:forEach items="${codeList}" var="CodeVO">
						<c:if test="${CodeVO.tid==1}">
						
						<option value="${CodeVO.id}"
						<c:if test="${CodeVO.id == RecruitVO.exp}">selected</c:if>
						>${CodeVO.career}</option>
						
						</c:if>
						</c:forEach>
						
				</select></td>
			</tr>
			<tr>
				<th>상세내용 및 우대사항</th>
				<td><textarea class="form-control" name="adddesc" cols="30" rows="10" style="resize: none;">${RecruitVO.adddesc}</textarea></td>
			</tr>
		<!-- 	<tr>
				<th>접수기간</th>
				<td><input type="date" name="period"> -> <input type="date">
				</td>
			</tr> -->
			<tr>
			<th>접수기간</th>
			<td>
				
				
		<div class="form-group">
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" name="period" value="${RecruitVO.period}"/>  <span
					class="input-group-addon"> <i
					class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
		</div>
	
			</td>
			</tr>
			<tr>
				<th>접수방법</th>
				<td><input type="radio" name="acceptmethod" value="홈페이지접수"
				<c:if test="${RecruitVO.acceptmethod=='홈페이지접수'}">checked</c:if>
				>홈페이지접수 &nbsp;
				<input type="radio" name="acceptmethod" value="즉시지원"
				<c:if test="${RecruitVO.acceptmethod=='즉시지원'}">checked</c:if>
				>즉시지원</td>
			</tr>
			
		</table>
	</form>
		<br> <br>
		<input class="btn btn-warning" type="submit" value="수정">
		<input class="btn btn-danger" type="submit" value="삭제">
		<input class="btn btn-primary" type="button" value="목록">
		
	<br>
	<!-- // 공고 입력 부분 끝 -->
</div>
<!-- // 공고 작성 바디 끝 -->

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy/mm/dd",
			language : "kr"
		});
	});	
</script>

<!-- 버튼에 대한 스크립트 -->
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");


		$(".btn-warning").on("click", function() {
			formObj.attr("action", "A_rmodify");
			formObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			
			if(confirm("삭제하시겠습니까?")){
				formObj.attr("action", "/admin/rremove");
				formObj.submit();
			}
		});
		
		$(".btn-primary").on("click", function() {
			self.location = "/admin/cmodify?id=${CInfoVO.id}"
		});

	});
</script>
<!-- //버튼에 대한 스크립트 -->

<script>
$(document).ready(function(){
	var largeNum = $('#jobGroup option:selected').val();
	SubJobGroup2(largeNum);
	var largeNum2 = $('#region option:selected').val();
	SubRegion2(largeNum2);
});

	$("#region").change(function() {

		var largeNum = $(this).val();

		SubRegion(largeNum)

	})

	$("#jobGroup").change(function() {

		var largeNum = $(this).val();

		SubJobGroup(largeNum);

	})
	
	function SubJobGroup(largeNum) {

		$.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
			var str = "";

			$(data).each(
					function() {
						str += "<option value="+this.id+">"
								+ this.jobgroup + "</option>";

					});

			$("#subjobGroup").html(str);
		})
	}

	function SubJobGroup2(largeNum) {

		$.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
			var str = "";
			<c:set value="${RecruitVO.jobgroupid2}" var="select"/>
			var sel = '<c:out value="${select}"/>';
			var selected = "";
			
			$(data).each(
					function() {
						if(sel==this.id){
							selected = "selected";
						}else{
							selected = "";
						}
						str += "<option value="+this.id+
						" "+selected+">"+ this.jobgroup + "</option>";
					});

			$("#subjobGroup").html(str);
		})
	}

	function SubRegion(largeNum) {

		$.getJSON("/companyAjax/region/" + largeNum, function(data) {
			var str = "";

			$(data).each(
					function() {
						str += "<option value="+this.rgsid+">" + this.rgsname
								+ "</option>";

					});

			$("#subRegion").html(str);
		})
	}
	
	function SubRegion2(largeNum) {

		$.getJSON("/companyAjax/region/" + largeNum, function(data) {
			var str = "";
			<c:set value="${RecruitVO.rgsid}" var="sid"/>
			var selec = '<c:out value="${sid}"/>';
			var select = "";

			$(data).each(
					function() {
						if(selec==this.rgsid){
							select = "selected";
						}else{
							select = "";
						}
						str += "<option value="+this.rgsid+
						" " + select + ">" + this.rgsname + "</option>";

					});

			$("#subRegion").html(str);
		})
	}
</script>


<%@include file="../include/cfooter.jsp"%>