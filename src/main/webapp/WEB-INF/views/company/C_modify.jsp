<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>


<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script type="text/javascript" src="/resources/rpjt/js/upload.js"></script>

<!-- Main content -->
<!-- 기업 페이지 -->

<!-- 문> 파일 업로드할 때는 enctype 속성을 추가하고 속성값을 멀티파트 형식인 multipart/form-data로 지정해야 한다. -->
<form role="form" method="post" enctype="multipart/form-data">
	<div class="border border-primary col-md-9">

		<!-- 문> 왼쪽 사이드 바와 높이를 맞추기 위한 전략  -->
		<p class="lead">
			<strong>회사 정보 수정</strong>
		</p>

		<!-- 문> row를 안 붙이면 밑에 항목들과 다르게 위치가 세팅된다. 한마디로 열이 안 맞춰진다. -->
		<div class="row">
			<!-- 문> 이건 가로 길이  -->
			<div class="form-group col-lg-6">
				<label>회사 이미지</label>

				<!-- 문> 사진 틀의 가로와 세로 길이  -->
				<div id='uploadedList' style='width: 127px; height: 152px;'>
					<!-- 문> 여기서 height는 '회사정보수정'페이지에 뿌려주는 사진의 높이로 위에서 설정해준 틀에 맞게 써야 한다. 세로만 지정해도 가로도 자동으로 정해지는 듯  -->
					<img id='imgsrc' height="152px;" alt="${CInfoVO.img}" />
				</div>

				<div>
					<!-- 문Q>디비에 있는 이미지 뿌려주는 거 같은데, hidden??  -->
					<input type='hidden' id='uploadfilename' name='img' value="${CInfoVO.img}"> <br>
				</div>

				<div>
					<!-- 문> 이건 파일 업로드 하는 버튼  -->
					<input type='file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">

					<!-- 문Q> 아래 두개 몰까? 지워도 상관없어서 일단 지움 -->
					<input type='hidden' id='xornot' value='0'> 
					<input type='hidden' id='preexistenceimg' value='0'> 
					
				</div>

			</div>
		</div>




		<div class="row">
			<div class="form-group col-lg-12">
				<label>기업소개</label>
				<textarea class="form-control" cols="7" rows="10" name="intro" style="resize: none;">${CInfoVO.intro}</textarea>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>기업명</label> <input type="text" name="cname" class="form-control" value="${CInfoVO.cname}" readonly>
			</div>
			<div class="form-group col-lg-6">
				<label>대표자명</label> <input type="text" name="ceo" class="form-control" value="${CInfoVO.ceo}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>업종</label> <input type="text" name="ctype" class="form-control" value="${CInfoVO.ctype}">
			</div>
			<div class="form-group col-lg-6">
				<label>기업형태</label> <input type="text" name="form" class="form-control" value="${CInfoVO.form}">
			</div>
		</div>


		<!-- ☆google search : datepicker -->
		<div class="row">
			<div class="form-group col-lg-6">
				<label>설립일</label>
				<div class="input-group date" data-provide="datepicker">
					<input type="text" class="form-control" name="establish" value="${CInfoVO.establish}" /> <span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>사원수</label> <input type="text" name="numemp" class="form-control" value="${CInfoVO.numemp}">
			</div>
			<div class="form-group col-lg-6">
				<label>매출액</label> <input type="text" name="sales" class="form-control" value="${CInfoVO.sales}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>대표전화</label> <input type="text" name="tel" class="form-control" value="${CInfoVO.tel}">
			</div>
			<div class="form-group col-lg-6">
				<label>FAX</label> <input type="text" name="fax" class="form-control" value="${CInfoVO.fax}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>홈페이지</label> <input type="text" name="homepage" class="form-control" value="${CInfoVO.homepage}">
			</div>
			<div class="form-group col-lg-6">
				<label>SNS</label> <input type="text" name="sns" class="form-control" value="${CInfoVO.sns}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-12">
				<label>기업주소</label> <input type="text" name="location" class="form-control" value="${CInfoVO.location}">
			</div>
		</div>


		<!-- 컨트롤러 request에서 인식할 수 있게 임의의 name값을 지정해줘야한다 (controller랑 맞출 필요 X) -->

		<br> <br>


		<p class="lead">
			<strong>기업 아이디 및 이메일</strong>
		</p>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>기업 아이디</label> <input type="text" name="id" class="form-control" value="${CInfoVO.id}" readonly>
			</div>

			<div class="form-group col-lg-6">
				<label>기업 이메일</label> <input type="text" name="email" class="form-control" value="${CInfoVO.email}" readonly>
			</div>
		</div>

<%-- 		<div class="row">
			<div class="form-group col-lg-6">
				<label>담당자</label> <input type="text" name="pname" class="form-control" value="${boardVO.pname}">
			</div>
			<div class="form-group col-lg-6">
				<label>휴대폰 번호</label> <input type="text" name="phone" class="form-control" value="${CInfoVO.phone}">
			</div>
		</div> --%>

		<br>

		<!-- 수정 버튼 -->
		<div class="box-footer">
			<button type="button" class="btn btn-primary">저장하기</button>
			<button type="button" class="btn btn-warning" id="modify">취소하기</button>
		</div>
		<!-- //수정 버튼 -->
		<br> <br>
	</div>
</form>

<!-- 소연 모달 -->
<div class="modal" id="ORIGINAL_modal">
	<div class="modal-dialog modal-dialog-centered">

		<div class="modal-content modal-dialog-centered">
			<div class="modal-head"
				style="text-align: center; vertical-align: middle; margin: 10px;">
				<br>
				<button type="button" class="close" data-dismiss="modal"
					style="margin: 10px;">&times;</button>
				이미지 크게 보기
			</div>

			<div class="modal-body modal-dialog-centered">

				<!--x표시 누르면 창 사라지게 하는 코드 -->
				<div class="row"
					style="border: solid 3px #ccc; padding: 10px; margin: 10px;">
					<img id="modal_get_Imgname1" style="width: 100%; height: auto;">
				</div>
			</div>
			<!--//class="modal-body"  -->
		</div>
		<!--//class="modal-content"-->
	</div>
	<!--//modal-dialog -->
</div>
<!-- 소연 코드 -->

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			self.location = "/company/C_index";
		});
	 	
	});
</script>

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			dateFormat : "yy-mm-dd",
			language : "kr"
		});
	});
</script>


<script>

    var imgsrccheck = ('#imgsrccheck');

    if ($('#imgsrccheck').val() != "") {
        console.log(" val이 널값아님");
        $('#imgsrc').attr("src", 'displayFile?fileName=${CInfoVO.img}');
        var str = "";
        str = "<a id='ORIGINAL'>크게보기</a>"
                + "<small data-src=${CInfoVO.img}>X</small>";
        $("#uploadedList").append(str);

        $("#ORIGINAL").on("click", function() {
            console.log("ORIGINAL click");
            var src = "displayFile?fileName=${CInfoVO.img}";
            $("#ORIGINAL_modal").modal();
            $("#modal_get_Imgname1").attr("src", src);
        });
        $("#preexistenceimg").val("1");
    } else {
        console.log(" val이 널값이다");
        $('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
        $('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
        $("#preexistenceimg").val("0");
    }

    var upload = document.getElementById('fileupload');
    var uploadedList = document.getElementById('uploadedList');
    if (typeof window.FileReader === 'undefined') {
        console.log("window.FileReader 'fail'");
    } else {
        console.log("★★★★★★★★  window.FileReader 'success'  ★★★★★★★");
    } //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때

    upload.onchange = function(e) {

        var file = upload.files[0];
        var reader = new FileReader();
        //p542다시 보기

        //reader.onload start
        reader.onload = function(event) {
            var image = new Image();
            image.src = event.target.result;

            uploadedList.innerHTML = '';
            image.height = 150;
            uploadedList.appendChild(image);
        };//reader.onload end

        //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
        //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
        event.preventDefault();

        console.log("file name");
        console.log(file);

        var formData = new FormData();

        formData.append("file", file);

        $.ajax({
            url : '/company/uploadAjax',
            data : formData,
            dataType : 'text',
            processData : false,
            contentType : false,
            type : 'POST',
            success : function(data) {
                var str = "";

                console.log(data);
                str = "<a id='ORIGINAL'>크게보기</a>"
                        + "<small data-src="+data+">X</small>";

                $("#uploadedList").append(str);
                $("#ORIGINAL").on("click", function() {
                    console.log("ORIGINAL click");
                    console.log("dlrj" + data);
                    console.log(getImageLink(data));
                    var src = "displayFile?fileName=" + data;
                    $("#ORIGINAL_modal").modal();
                    $("#modal_get_Imgname1").attr("src", src);
                });
                document.getElementById('uploadfilename').value = data;
                uploadedfilename_val = data;
            }//success : function(data){ end
        });//ajax end
        //});//filedrop end
        console.log(file);
        reader.readAsDataURL(file);
    };//upload change end

    $("#uploadedList").on("click", "small", function(event) {
        event.preventDefault();
        var that = $(this);
        $("#uploadedList").empty();
        console.log("img File appended deleted");
        var fileName = $(this).attr("data-src");
        console.log(fileName);
        var uploadfilename = document.getElementById('uploadfilename');

        $.ajax({
            url : "deleteFile",
            type : "post",
            data : {
                fileName : $(this).attr("data-src")
            },
            dataType : "text",
            success : function(result) {
                if (result == 'deleted') {
                    console.log("img File on server deleted");
                    that.parent("div").remove();
                    $('#uploadfilename').val('');
                }
            }
        });
    });

    function getOriginalName(fileName) {
        var idx = fileName.indexOf("_") + 1;
        return fileName.substr(idx);
    }

    function getImageLink(fileName) {
        var front = fileName.substr(0, 12);
        var end = fileName.substr(14);

        return front + end;
    }

    //문> btn-primary은 저장하기 클래스 이름 같은데. 뭐 클릭하면 안에꺼 실행
    $(".btn-primary").on("click", function() {

        /* alert(uploadedfilename_val); */
        formObj = $("form[role = 'form']");
        formObj.attr("method", "post");
        formObj.submit();

        // 문> 이 페이지를 보면 수정하기 버튼을 눌렀을 때 어디로 가란 정보가 없다.
        // 그럴 땐 컨트롤러에서 jsp파일명이 적힌 곳을 봐라 그럼 된다.CompanyController의 /C_modify
    });
</script>

<%@include file="../include/cfooter.jsp"%>