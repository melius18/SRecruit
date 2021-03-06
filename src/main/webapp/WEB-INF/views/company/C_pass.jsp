<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- 문> 이 페이지는 천문필이 작성 -->
<div class="col-md-9">
	<p class="lead"><strong>비밀번호 변경</strong></p>

<table class="table table-bordered">
		<tr class="active gobox2">
		<td style="line-height: 200%">

			<ul style="list-style-type : circle">
				<li>6~20자의 영문 대문자, 소문자, 숫자를 조합하여 비밀번호를 만드실 수 있습니다.</li>
				<li>개인정보 보호를 위해 <b>6개월마다 주기적으로 비밀번호를 변경</b>해 사용하는 것이 안전합니다.</li>
				<li>여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해 주는 것이 안전합니다. </li>
			</ul>
		</td>
		</tr>
</table>





<!-- 문> 아래 내용은 일단 구린 거 같아서 주석처리  -->
<!-- 	<table class="table">
		<tr>
			<td>&nbsp;8~32자의 영문 대문자, 소문자, 숫자, 특수문자를 조합하여 비밀번호를 사용하실 수 있습니다.</td>
		</tr>
		<tr>
			<td>&nbsp;개인정보 보호를 위해 <b>6개월마다 주기적으로 비밀번호를 변경</b>해 사용하는 것이
				안전합니다.
			</td>
		</tr>
		<tr>
			<td>&nbsp;여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해 주는 것이
				안전합니다.</td>
		</tr>
	</table> -->
<br>

	<form role="form" class="form-horizontal" method="post">

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">현재 비밀번호</label>
			<div class="col-sm-6" id="beforePw">
				<input type="password" class="form-control" id="pw1" name="pw"
					placeholder="기존의 Password를 입력해주세요.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">새 비밀번호</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw2" name="pw2"
					placeholder="Password입력해주세여.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">다시 확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw3"
					name="pw3reinput" placeholder="한 번 더 입력해주세여.">
			</div>
			<!--여기 span태그 속에는 잘못된 비밀번호라고 알려줌  -->
			<span id="chk"></span> 
		</div>

		<br>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" id="changePw">확인</button>
			</div>
		</div>

	</form>




	<script>

		$("#changePw").on("click", function(event) { //changePw는 확인 버튼 id값
			var formObj = $("form[role='form']");
			var ajaxchk = "no";
			var Pw = $("#pw1"); //pw1은 기존 비번 확인할 때 입력받은 값
			var inputPw = Pw.val();
			var answer = "";
			
			var Pw2 = $("#pw2"); //pw1은 기존 비번 확인할 때 입력받은 값
			var inputPw2 = Pw2.val();
			

 
			
			
			
			//일단, 확인 버튼이 안 먹도록 만들었다. 되는 것들을 밖으로 빼서 실핼시킬 예정임
			event.preventDefault();
			
			$.ajax({
				type : 'POST',
				//아래 코드에 적힌 컨트롤러를 찾아간다.
				url : '/companyAjax/changePassword',
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',

				//dto의 pw로 비밀번호 확인하는 과정에서 받은 값(inputPw)을 보낸다. pw2는 새로받은 비밀번호이다.
				//왜 dto냐? 컨트롤러쪽에서 @RequestBody를 dto앞에 붙였기때문에, 그리고 @RequestBody는 한 번만 사용할 수 있다.
				data : JSON.stringify({
					pw : inputPw,
					pw2 : inputPw2
					
				}),

				//result값을 데리고 온다.
				success : function(result) {

					//비밀번호가 이전 거랑 맞으면 진행하는데 result값이 success이면 된다.
					if (result == 'success') {
						
						//새로운 비밀번호와 다시 입력받은 두 값이 같으면 진행 
						if ($("#pw2").val() == $("#pw3").val()) {
							
							//ajaxchk에 ok값을 주입한다.왜냐? 얘는 되는거니깐 풀어야지
							ajaxchk = "ok";
							console.log("1010");
							alert("비밀번호가 성공적으로 바뀌었습니다.")
							console.log("1011");
								
						} else {
							
							//위에서 진행한 두 비밀번호가 다를 때
							alert("비밀번호를 확인해주세요.");
							
							//다음 코드는 alert창을 껐을 때, id가 pw2인 곳에 커서가 위치하게 하는 코드
							$("#pw2").focus();
						}

					//비밀번호가 이전 비밀번호랑 맞는지 확인하는 과정에서 삑사리 난 경우
					} else {
						alert("비밀번호가 틀렸습니다.");
						
						//다음 코드는 alert창을 껐을 때, id가 pw1인 곳에 커서가 위치하게 하는 코드
						$("#pw1").focus();

					}

				}
			}); //$.ajax 끝났음
			
			
			//setTimeout함수는 일정시간 뒤에 코드가 실행되게 하는 함수이다.
			//확인을 누르는 동시에 비밀번호 테스트 동작이 돌아간다. 그런데 다 끝나면 페이지가 새로고침이 된다.
			//그 시간을 지정하는 것이다.
			setTimeout(function(event){
				if(ajaxchk=="ok"){
					formObj.submit();
					
				} //if끝
				
			}, 500); //setTimeout끝
			
			
			
		});
		
	</script>


	<script>
		/* var ppwc = ""; */
		
		//A~Z랑 a~z랑 0~9만 허용, 한글은 허용 안 하기 위해
		var cpwReg = /[A-Za-z0-9]$/;   
		
		//특수문자는 허용 안 하기 위해
		var cexpReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;
		
		//chk는 잘못된 값이 들어갔을 때 제대로 값을 입력하라고 문구를 뿌리는 span태그 공간이다.
		var chk = $('#chk');

		
/* 		$('#pw3').keyup(function() {
			if ($('#pw2').val() == $('#pw3').val()) {
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
			} else {
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
			}
		})

		// Q> 얜 모지??
		$('#pw2').keyup(function() {
			if ($('#pw2').val() == $('#pw3').val()) {
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
			} else {
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
			}
		}) */
		
		
		//pw3는 새로운 비밀번호 확인 값, pw2는 새로운 비밀번호 값, keyup은 키보드를 눌렀다가 떼면 작동하는 기능
		$('#pw3').keyup(function(){	
			
		
		var cpwcval = $('#pw3').val();
		var cpwval = $('#pw2').val();
		
		// \s는 공백을 의미한다.
		if(cpwcval.search(/\s/) != -1){
			alert("공백 금지");
			
			//공백인데 썼으니깐 썼던거 삭제하는 기능
			$('#pw3').val(cpwcval.slice(0, -1));
		}
		
		//
		if(!(cpwReg.test(cpwcval)) && cexpReg.test(cpwcval)){
			alert("특수문자 금지");
			
			//특수문자 금지인데 썼으니깐 썼던거 삭제하는 기능
			$('#pw3').val(cpwcval.slice(0, -1));
		}
		
		//다음 두 줄은 지우면 안 됨. 특수문자를 쓴 값을 데리고 오면 안 되니깐. 쓰기 전 값을 데리고 온 것임
		cpwcval = $('#pw3').val();
		cpwval = $('#pw2').val();
		
		//글자 수 제한 6이상 20이하
		if(!(cpwcval.length > 5 && cpwcval.length <= 20)){
			console.log("1");
        	document.getElementById("chk").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
        	chk.attr("style", "color:red");		
			/* ppwc = "no"; */
		}else{
			if(cpwval == cpwcval){
				console.log("2");
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
				/* ppwc = "ok"; */
			}else{
				console.log("3");
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
				/* ppwc = "no"; */
			}
		}
		
	})

	$('#pw2').keyup(function(){
		var cpwval = $('#pw2').val();
		var cpwcval = $('#pw3').val();
		
		if(cpwval.search(/\s/) != -1){
			alert("공백 금지");
			$('#pw2').val(cpwval.slice(0, -1));
		}
		
		if(!(cpwReg.test(cpwval)) && cexpReg.test(cpwval)){
			alert("특수문자 금지");
			$('#pw2').val(cpwval.slice(0, -1));
		}
		
		cpwval = $('#pw2').val();
		cpwcval = $('#pw3').val();
		
		if(!(cpwval.length > 5 && cpwval.length <= 20)){
			console.log("4");
        	document.getElementById("chk").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
        	chk.attr("style", "color:red");
			/* ppwc = "no"; */
		}else{
			if(cpwval == cpwcval){
				console.log("5");
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
				/* ppwc = "ok"; */
			}else{
				console.log("6");
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
				/* ppwc = "no"; */
			}
		}
	})
	</script>

</div>

<%@include file="../include/cfooter.jsp"%>