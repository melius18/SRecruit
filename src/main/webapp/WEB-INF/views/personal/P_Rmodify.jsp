<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
	<%-- 	<input type="text" class="form-control" id="rid" name="rid" value="${PTelVO.rid }" readonly> --%>
	 	<input type="text" class="form-control" id="bno" name="bno" value="${ResumeVO.bno}" readonly>
	<%-- 	<input type="text" class="form-control" id="userid" name="userid" value="${ResumeVO.userid}" readonly> --%>
	<%-- 	<input type="text" class="form-control" id="id" name="id" value="${PUserVO.id}" readonly> --%>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title"
				name="title" value="${ResumeVO.title}">
		</div>
	  <div class="company_info_content">
      <div class="table-responsive">
         <table class="table table-bordered">
            <tbody>
               <tr>
                <th class="table-active" scope="row"><label for="pname">이름</label> </th>
	          	<td class="col-sm-4">
	           		<input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}">
	           	</td>
                <th class="table-active" scope="row"><label for="img">사진</label></th>
                <td class="col-sm-4">
                    <div id= 'uploadedList' style = 'width : 127px; height : 152px; border : 1px dotted blue;'>
				    <img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
				   </div>
				   	<!--  사진 보이는 div  -->
				   	
                   	<input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
                   	 <!-- db에 있는 file img 이름 받아오는 hidden input -->
                   	 <input type = 'hidden' id='uploadfilename' name = 'img' >
					<!-- db에 올라갈 file img 이름 받아오는 hidden input -->
					
					<br>
					<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
					<!--파일 업로드 하는 버튼-->
					
				   	<input type = 'hidden' id = 'xornot' value = '0'>
               	 </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>
                  	<div class="form-group">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
				  </td>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
            	  <td>
				  	<div class="form-group">
					 <input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}">
					</div>
				</td>
               </tr>
               
             </tbody>
         </table>
               
    <!-- ------------------------------------------------------handlebar로 수정1 -->
   <hr style="border: solid 4px #ccc;">
	<h4>
		<b>연락처 목록</b>
	</h4>
	<div id="tel_div"></div>
	<hr style="border: solid 4px #ccc;">
	
	<!-- a.code 03/19 : 연락처 목록을  handlebars(template_tel)로 적용 -->
    <!-- ------------------------------------------------------handlebar로 수정1 종료 -->
    <!-- ------------------------------------------------------handlebar로 수정2 -->
            <%-- <c:forEach items="${PWebSiteVOlist}" var="PWebSiteVO" varStatus="status">
                <th class="table-active" scope="row"><label for="webtitle">웹사이트(종류)</label>
                	<input type="text" value="${PWebSiteVO.id }">
                </th>
                <td>
                  <input class="webclass" type='hidden' name="pwebsitesvolist[].rid" value="${ResumeVO.bno}">
			<div class="form-group">
				<input type="text" class="form-control webclass" name="pwebsitesvolist[].webtitle" value="${PWebSiteVO.webtitle}">
			</div>
		  </td>
                <th class="table-active" scope="row"><label for="tel">전화번호</label></th>
                <td>
              	<div class="form-group">
				<input type="text" class="form-control webclass" name="pwebsitesvolist[].webadd" value="${PWebSiteVO.webadd}">
			</div>
                </td>
            </c:forEach>  --%>
    <hr style="border: solid 4px #ccc;">
	<h4>
		<b>사이트 목록</b>
	</h4>
	<div id="web_div"></div>
	<hr style="border: solid 4px #ccc;">
      <!-- ------------------------------------------------------handlebar로 수정2 종료 -->           
<%--               
                <tr>
               	  <th class="table-active" colspan="5" scope="row" style = "text-align: center;">보유자격증 목록</th>            
               </tr>
               <tr>
                <th class="table-active" scope="row"><label for="licensename">자격증명</label></th>
                <th colspan="2" class="table-active" scope="row"><label for="publeoffice">발행기관</label></th>
                <th colspan="2" class="table-active" scope="row"><label for="acquidate">취득일자</label></th>
          	  </tr>
          	   <c:forEach items="${RLicenselist}" var="RLicenseVO">
	               <tr>
	                  <td>
	                    <input class="licenseclass" type='hidden' name="rlicensevolist[].rid" value="${ResumeVO.bno}">
						<div class="form-group">
							<input class="form-control licenseclass" name="rlicensevolist[].licensename" value="${RLicenseVO.licensename}"></input>
						</div>
					  </td>
					  <td colspan="2">
					 	<div class="form-group">
							<input class="form-control licenseclass" name="rlicensevolist[].publeoffice" value="${RLicenseVO.publeoffice}"></input>
						</div>
					  </td>
					  <td colspan="2">
					  	<div class="form-group">
							<input class="form-control licenseclass" name="rlicensevolist[].acquidate" value="${RLicenseVO.acquidate}"></input>
						</div>
					  </td>
	               </tr>
                </c:forEach>
               
                <tr>
               	  <th class="table-active" colspan="5" scope="row" style = "text-align: center;">어학능력 자격증 목록</th>            
               </tr>
               <tr>
                <th class="table-active" scope="row"><label for="lid">언어</label></th>
               	<th class="table-active" scope="row"><label for="test">공인인증시험명</label></th>
                <th class="table-active" scope="row"><label for="score">점수</label> </th>
                <th class="table-active" scope="row"><label for="lanpubleoffice">발행기관</label></th>
                <th class="table-active" scope="row"><label for="lanacquidate">취득일자</label></th>
               </tr> 
                <c:forEach items="${RLanguagelist}" var="ResumeLanguageVO" varStatus="status">
	               <tr>
	                 <td>
	                    <input class="langclass" type='hidden' name="rlangvolist[].rid" value="${ResumeVO.bno}">
	                  	<div class="form-group">
							<input class="form-control langclass" name="rlangvolist[].lid" value="${ResumeLanguageVO.lid}"></input>
						</div>
	                  </td>
	                  <td>
	                  	<div class="form-group">
						 <input class="form-control langclass" name="rlangvolist[].test" value="${ResumeLanguageVO.test}"></input>
						</div>
					  </td>
	                  <td>
	                  	<div class="form-group">
							<input class="form-control langclass" name="rlangvolist[].score" value="${ResumeLanguageVO.score}"></input>
						</div>
	                  </td>
	                  <td>
						<div class="form-group">
						 <input class="form-control langclass" name="rlangvolist[].publeoffice" value="${ResumeLanguageVO.publeoffice}"></input>
						</div>
					 </td>
	                  <td>
	                  	<div class="form-group">
						 <input class="form-control langclass" name="rlangvolist[].acquidate" value="${ResumeLanguageVO.acquidate}"></input>
						</div>
	                  </td>
	               </tr>  
                </c:forEach> 
                       
               <tr>
                  <th class="table-active" colspan="5" scope="row" style="text-align: center;">자기소개서</th>
               </tr> 
               <tr>
                <td colspan="5" rowspan="2">
                  	<div class="form-group">
						<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;">${ResumeVO.coverletter}</textarea>
					</div>
              	 </td>   
               </tr>
            </tbody>
         </table>
         <!-- //table class --> --%>
      </div>
      <!-- //table-responsive -->
   </div>
   <br>
   	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
</div>

<script id="template_tel" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">

	<input type="hidden" class="form-control telid telclass" value="{{telid}}"></input>
	<input type="hidden" class="form-control rid telclass" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="teltitle">전화번호 (종류)</label> 
		<input class="form-control teltitle telclass" name="ptelvolist[].teltitle" value="{{teltitle}}"></input>
	</div>
	
	<div class="form-group col-md-4">
		<label for="tel">전화번호</label> 
		<input class="form-control tel telclass" name="ptelvolist[].tel" value="{{tel}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default tel_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default tel_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>

<script id="template_web" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control webid webclass" value="{{webid}}"></input>
	<input type="hidden" class="form-control rid webclass" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="webtitle">사이트 (종류)</label> 
		<input class="form-control webtitle webclass" name="pwebsitesvolist[].webtitle" value="{{webtitle}}"></input>
	</div>

	<div class="form-group col-md-4">
		<label for="webadd">주소</label> 
		<input class="form-control webadd webclass" name="pwebsitesvolist[].webadd" value="{{webadd}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default web_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default web_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>

   <!--  -------------------------------------------------------------------------- -->

<script type='text/javascript'>
	$(document).ready(function() {
		var formObj = $("form[role = 'form']");
		var xornot = document.getElementById('xornot');
		
		$(function() {
			$('.input-group.date').datepicker({
				calendarWeeks : false,
				todayHighlight : true,
				autoclose : true,
				format : "yyyy-mm-dd",
				language : "kr"
			});
		});
		console.log('${PWebSitelist}');
		var imgsrccheck = ('#imgsrccheck');
		
 		 if($('#imgsrccheck').val()!=""){
			console.log(" val이 널값아님");
			$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
			var str = "";
			str = 
				  "<a href='displayFile?fileName=${ResumeVO.img}' target='_blank'; return false;'>원본 확인"
				  +"</a>"
				  +"<small data-src=${ResumeVO.img}>X</small>";
			  $("#uploadedList").append(str); 
			  console.log("uploadedlist에 x버튼 추가");
		}else{
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}  
	  ////////////img uploadedList start//////////////////////////////////////////////////////////
 	  // var upload = document.getElementsByTagName('input')[0];
	   var upload = document.getElementById('fileupload');
	   var uploadedList = document.getElementById('uploadedList');
	  
		if (typeof window.FileReader === 'undefined') {
		 console.log("window.FileReader 'fail'");
		} else {
		 console.log("window.FileReader 'success'");
		}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
		  
	 	  upload.onchange = function (e) {
		
			 var file = upload.files[0];
			 var reader = new FileReader();
			 //p542다시 보기
			 $("#uploadedList").empty();
			 //reader.onload start
			 reader.onload = function (event) {
				 var image = new Image();
				 image.src = event.target.result;
				  
				 uploadedList.innerHTML = '';
				  // img.width = 200;
				 image.height = 150;
				 uploadedList.appendChild(image);
			 };//reader.onload end
		 //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
		 
		 //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
				 event.preventDefault();
				 //var files = event.originalEvent.dataTransfer.files;
				 
				 console.log("file name");
				 console.log(file);
				 
				 var formData = new FormData();
				 
				 formData.append("file", file);
				 
				 $.ajax({
					 url:'uploadAjax',
					 data: formData,
					 dataType : 'text',
					 processData : false,
					 contentType : false,
					 type : 'POST',
					 success : function(data){
						   var str = "";
						  
						 	console.log(data);
						 	
							  str = 
								  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
								  +"</a>"
								  +"<small data-src="+data+">X</small>";
	
						  $("#uploadedList").append(str); 
						  document.getElementById('uploadfilename').value = getImageLink(data);
					  }//success : function(data){ end
		 		  });//ajax end
			//});//filedrop end
		 console.log(file);
		 reader.readAsDataURL(file);
		};//upload change end   
		
  		$("#uploadedList").on("click", "small", function(event){
			event.preventDefault();
			var that = $(this);
			
			console.log($(this));
			
			fileName = $(this).attr("data-src"); //전역변수로 설정하기
			var front = fileName.substring(0, 12);
			var end = fileName.substring(12);
			
			fileName = front + "s_" + end;
			
			$("#fileupload").val("");
			$("#uploadedList").empty();
			//$("#fileupload").remove();
			console.log("img File appended deleted");
			console.log("fileName"+fileName);
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}); 
		
		function getOriginalName(fileName){
	      	var idx = fileName.indexOf("_")+1;
	      	return fileName.substr(idx);
	      }
		function getImageLink(fileName){
	      	var front = fileName.substr(0,12);
	      	var end = fileName.substr(14);
	      	
	      	return front + end;
	      } 
		 
		$("#write-success").on("click", function() {
			
			console.log("write-success clicked");
			
			  if($("#xornot").val()==0){
				console.log("xornot.val()==0");
				console.log("사진 삭제 안함");
				
				formObj.attr("action", "/personal/Rmodify");
				formObj.attr("method", "post");
				numberingList();
				console.log("사진 삭제 안한 상태에서 submit직전");
				formObj.submit();
				
			}else if($("#xornot").val()==1){
				//삭제 시키기 ajax 실행 후에 Rmodify로 넘어가기
				console.log("xornot.val()==1");
				console.log("사진 삭제함");		
				$.ajax({
					url:"deleteFile",
					type:"post",
					//data : {fileName:$(this).attr("data-src")},
					data: {fileName:fileName},
					dataType:"text",
					succss:function(result){
						if(result=='deleted'){
							console.log("img File on server deleted");
							that.parent("div").remove();
						}
					}
				}); 
				
			/* 	console.log("사진 삭제한 상태에서 submit직전");
				formObj.attr("action", "/personal/Rmodify");
				formObj.attr("method", "post");
				numberingList();
				formObj.submit(); */
			} 
		});
    
		function numberingList() {
 			$(".telclass").each(function(index){
				var num = 3;
				var name = $(this).attr("name");
				name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
				$(this).attr("name", name);
				console.log($(this).attr("name"));
			});
 			 $(".webclass").each(function(index){
				var num = 3;
				var name = $(this).attr("name");
				name = name.substring(0, 16) + parseInt(index/num) + name.substring(16);
				$(this).attr("name", name);
				console.log($(this).attr("name"));
			}); 
 			 $(".langclass").each(function(index){
 				var num = 6;
 				var name = $(this).attr("name");
 				name = name.substring(0, 12) + parseInt(index/num) + name.substring(12);
 				$(this).attr("name", name);
 				console.log($(this).attr("name"));
 			}); 
 			$(".licenseclass").each(function(index){
 				var num = 4;
 				var name = $(this).attr("name");
 				name = name.substring(0, 15) + parseInt(index/num) + name.substring(15);
 				$(this).attr("name", name);
 				console.log($(this).attr("name"));
 			}); 
		}
		
		// tel 추가버튼 이벤트
		$("#tel_div").on("click", ".tel_plus_btn", function(){
			var item = {
					rid : ${ResumeVO.bno}
				};
			add_tel(item);
		});
		
		function add_tel(item) {
			var source_tel = $("#template_tel").html();
			var template_tel = Handlebars.compile(source_tel);
			$("#tel_div").append(template_tel(item));
		}
		function tel_list() {
			var len = (${PTelVOlist.size()});
			
			<c:forEach items="${PTelVOlist}" var="PTelVO">
				var item = {
						telid : ${PTelVO.telid},
						rid : ${PTelVO.rid},
						teltitle : "${PTelVO.teltitle}", 
						tel : "${PTelVO.tel}" 
				};
				add_tel(item);
			</c:forEach>
		}
		
		//웹 추가 버튼 이벤트
		$("#web_div").on("click", ".web_plus_btn", function(){
			var item = {
					rid : ${ResumeVO.bno}
				};
			add_web(item);
		});
		
		function add_web(item) {
			var source_web = $("#template_web").html();
			var template_web = Handlebars.compile(source_web);
			$("#web_div").append(template_web(item));
		}
		function web_list() {
			var len = (${PTelVOlist.size()});
			
			<c:forEach items="${PWebSiteVOlist}" var="PWebSiteVO">
				var item = {
						webid : ${PWebSiteVO.webid},
						rid : ${PWebSiteVO.rid},
						webtitle : "${PWebSiteVO.webtitle}", 
						webadd : "${PWebSiteVO.webadd}"
				};
				add_web(item);
			</c:forEach>
		}
		
		tel_list();
		web_list();
		
	});
</script>
<%@include file="../include/cfooter.jsp"%>