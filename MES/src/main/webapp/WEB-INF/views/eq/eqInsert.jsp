<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<!-- 추가 CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" ></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer" ></script>



<style>
/* input {
	vertical-align: middle;
	margin : 3px  2px;
}

*/

.btnpart {
	background-color: #555555;
	color: white;
} 

button:hover {
 	color: black;
 	background-color: white;
}



</style>
</head>
<body>
<h1>설비 등록</h1>
<div id="in/out"></div>
<div align="right">
			<button type="reset" id="reset" class="button btnpart">초기화</button>
			<button type="button" id="btnok" class="button btnpart">저장</button>
			
</div>

	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
	<form name="frm" id="frm" method="POST" enctype="multipart/form-data">
		<div class="row">
		<div class="col-8">
		<hr style="border: solid 2px gray;" />
					<!-- 설비명 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">모델명*</label>
						<input type="text" id="eq_mdnm" name="eq_mdnm" class="form-control" style="width: 30px" placeholder="설비 모델명" required>
						
					</div>
					</div>	
					
					
						
					<!-- 사용여부 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">사용여부</label>
						
					
						<div class="form-check">
					  	<input class="form-check-input" type="radio" name="eq_actst" id="yes" value="1" checked>
					  	<label class="form-check-label" for="flexRadioDefault1" style="width: 30px;">Y</label>
						</div>
						
						<div class="form-check">
					  	<input class="form-check-input" type="radio" name="eq_actst" id="no" value="0" >
					  	<label class="form-check-label" for="flexRadioDefault2">N</label>
						</div>
						
						
					</div>
					</div>	
					
					<!-- 구분코드 --><!--  eq_cd는 함수로 알아서 생성 > 인자값을 일부러 넘기지 않음 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">구분코드</label>
						<input type="text" id="eq_cd" readonly>
						<input type="button" id="eqdiv" value="조회">
						&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;
						<input type="text" id="eq_nm" name="eq_nm"  >
						
					</div>
					</div>	
					<!-- 모델번호 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">모델번호</label>
						<input type="text" class="form-control" id="eqMdno" name="eq_mdno" style="width: 50px" placeholder="모델번호">
						
					</div>
					</div>	
					
					
					<!-- 제작업체 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">제작업체</label>
						<input type="text" id="vdrCode" name="vdr_code" class="form-control" style="width: 20px" readonly>
						&nbsp;&nbsp;
						<label for="inputText" class="col-form-label" style="padding-right: 10px;">UPH*</label>
						<input type="text" id="eq_uph" name="eq_uph" class="form-control" min="1" max="500" style="width: 50px" required>
						
					</div>
					</div>	
					
					<!-- 가용온도 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">가용온도</label>
						<input type="number" id="eq_min" name="eq_min" class="form-control" min="-20" max="0" style="width: 20px" placeholder="최소">
						&nbsp; <h3>~</h3> &nbsp;
						<input type="number" id="eq_max" name="eq_max" class="form-control" min="20" max="200" style="width: 50px" placeholder="최대">
						 <h3>℃</h3>
					</div>
					</div>	
					
					<!-- 점검주기 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">점검주기</label>
						<input type="number" id="eq_chkcyc" name="eq_chkcyc" class="form-control" style="width: 30px" min="3" max="7" placeholder="점검주기">
						
					</div>
					</div>	
					
					
					<!-- 등록인 /  구매일자 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">등록자명</label>
						<input type="text" id="eq_inster" name="eq_inster" class="form-control" style="width: 20px" readonly>
						&nbsp;
						
						
					</div>
					</div>
					
					
					<!-- 구매일자 -->
					<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">구매일자</label>
						<input type="date" id="eq_purdt" name="eq_purdt" class="form-control" min="1" max="500" style="width: 50px">
						
					</div>
					</div>	
					
					
	
			<input type="hidden" id="uuid" name="uuid"  size=10 >
			<input type="hidden" id="img_path" name="img_path" size=10 value="">
			<input type="hidden" id="img_nm" name="img_nm"  size=10 value="">
			
	
	
	</div>
	<div class="col-4">
	<img id="prevu" src="#" onError="this.style.visibility='hidden'" />
	
	<!-- <div class="input-file">
	 	<input type="text" id="imgNm" readonly="readonly" class="file-name" /> 
		<label for="upload02" class="file-label"></label> 
		<input type="file" name="file" id="upldfile" class="file-upload" onchange="readURL(this)" accept="assets/img/*" />

	</div> -->
	
	<div class="mb-2 ">
 	<label for="formFile" class="form-label">FILE UPLOAD</label>
 	<input class="form-control" type="file" id="upldfile" onchange="readURL(this)" accept="assets/img/*" />
	</div>
	
	</div>
	
	</div>
	
	</form>

		<hr style="border: solid 2px gray;" />
		<div id="modalDiv"></div>

</div></div>
<div></div>
</body>
<script>


console.log(  $("input[name='chk']:checked").val()  ); // 사용여부 실시간 체크 Y or N
// 폼 양식 등록 > alert창 출력후 바로 등록
$("#btnok").on("click",function(){
	$("#frm").attr('action' , "eqMngPage"); 
	toastr.success('등록완료!');
	$("form").submit();
	
})


reset.addEventListener("click" , function(){
	$("#prevu").attr("src" , "");
	document.getElementById('frm').reset();
})

// UUID 생성 부 - 사용 중
// 참고 : https://developyo.tistory.com/110
function makeUUID(){
	
	return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	
	   // function s4() {
	   //  return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	   // 	}
	   // 	 return s4() + s4() + s4() + s4() + s4() + s4() + s4() + s4() + file_nm.substr(file_nm.indexOf("."), file_nm.length-1); */
	} 



// 이미지 파일 썸네일 보기 구현완료
function readURL(input) {
    	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.readAsDataURL(input.files[0]);
		
        //파일이름 가져옴
        var imgNm = input.files[0].name;
      	var imgSrc = null;
        
        // 이미지 파일 명 input 에 넣기
        img_nm.value = imgNm;
        
        reader.onload = function (e) {
    	
        	var tempImage=new Image();
        	tempImage.src=reader.result;
        	
        	
        	 // 이미지 고유 경로 input에 넣기
        	//img_path.value=tempImage.src;
        	
        	//console.log("img_path: "+ img_path.value);
        	
        	tempImage.onload=function(){
        		var canvas=document.createElement('canvas');
        		var canvasContext=canvas.getContext("2d");
        		
        		
            	var img = new Image();
	        	img.src = e.target.result;
	        	//console.log("img.src:" + img.src);
	        	
	        	$("#img_path").val(img.src);
	        	$("#imgNm").val(img.src);
	        	
	        	
        		canvas.width=img.width*0.5;
        		canvas.height=img.height*0.7;
        		
        		canvasContext.drawImage(this,0,0,canvas.width,canvas.height);
        		
        		var dataURI=canvas.toDataURL("image/png");
        		
        		document.querySelector("#prevu").src=dataURI; // 
        		document.querySelector("#prevu").style.visibility="visible"; // 엑박이 아닐경우 보이기 
        		
        		imgSrc = img.src;
        		
        		}
        
        	
        	};
        	
    	}
    	uuid.value = makeUUID();
    	
    	
    	console.log("img_nm: "+ img_nm.value);
    	console.log("img_src: "+ $("#img_path").val());
    	
    	console.log("eq_mdnm: "+ eq_mdnm.value);
    	console.log("vdr_code: "+ vdr_code.value);
    	console.log("eq_min: "+ eq_min.value); 
    	console.log("eq_max: "+ eq_max.value); 
    	console.log("eq_uph: "+ eq_uph.value); 
    	console.log("eq_purdt: "+ eq_purdt.value); 
    	
    	console.log("eq_inster: "+ eq_inster.value); 
    	console.log("uuid: "+ uuid.value); 
    	
    	
    	
	}
	

	
	// 조회 버튼을 클릭시  > 모달 호출
	eqdiv.addEventListener("click" , function(){
		
		//모달 페이지 호출 부
		$("#modalDiv").load("eqdvmodal" , function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();	
			
			
		})
					
	});
	
	
	$("#eq_inster").on("click" , function(){
		//모달 페이지 호출 부
		$("#modalDiv").load("eqInstermodal" , function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();	
			
			
		})
		
	});
	
	$("#vdrCode").on("click" , function(){
		//모달 페이지 호출 부
		$("#modalDiv").load("eqvdrmodal" , function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();	
			
			
		})
		
	})
	
	
	
</script>

</html>
