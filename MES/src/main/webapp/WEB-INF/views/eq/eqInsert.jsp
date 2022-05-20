<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" ></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer" ></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
input {
	vertical-align: middle;
	margin : 3px  2px;
}

input.img-button {
	background: url( "assets/img/glass.png" ) no-repeat; border : none;
	width: 32px;
	height: 32px;
	cursor: pointer;
	border: none;
}

.btnpart {
	background-color: #555555;
	color: white;
}

#title {
	font-size: 30px;
}



</style>
</head>
<body>
<div class="container">
<!-- 	<form name="frm" id="frm" action="eqMng" method="POST" enctype="multipart/form-data"> -->
	<form name="frm" id="frm" method="POST" enctype="multipart/form-data">
	<div class="row">
	<div class="col-8">
		<h2>설비 등록</h2>
		<hr  />
		<div align="right">
			<button type="reset" class="button btnpart">초기화</button>
			&nbsp;&nbsp;
			<button type="button" id="btnok" class="button btnpart">저장</button>
			<!-- <input type="submit" id="btnok" class="button btnpart" value="저장"> -->
		</div>
		<hr />
					설비명*
					<input id="eq_mdnm" name="eq_mdnm"size=10 maxlength=8>
							
					사용여부
						Y<input	type="radio" id="yes" name="eq_actst" value="Y" checked>
						N<input type="radio" id="no" name="eq_actst" value="N">
			
			<br/><br/>
			<!--  eq_cd는 함수로 알아서 생성 > 인자값을 일부러 넘기지 않음 -->
					구분코드<input id="eq_cd" size=10 maxlength=13>
					<input type="button" id="eqdiv" value="조회">
					<input id="eq_nm" name="eq_nm" size=10 maxlength=13>
					모델번호<input id="eq_mdno" name="eq_mdno" size=10 maxlength=13>
				
		<br /><br/>
		
				
				제작업체<input id="vdr_code" name="vdr_code" size=10 	maxlength=8>
				
				UPH*<input type="number" min="1" max="500" id="eq_uph" name="eq_uph" size=10 maxlength=8>
				

		 <br /><br/> 
		
					가용온도<input type="number" min="-20" max="0" id="eq_min" name="eq_min" size=10 maxlength=8 placeholder="최소온도 기입">&nbsp;~&nbsp;
					<input type="number"  min="20" max="200" id="eq_max" name="eq_max" size=10 maxlength=8 placeholder="최대온도 기입"> ℃ 
					점검주기<input type="number" min="3" max="7"	id="eq_chkcyc" name="eq_chkcyc" size=10 maxlength=8>
					
		<br/><br/>
		
			등록인<input type="number" min="1000" id="eq_inster" name="eq_inster" size=10 maxlength=8>
			구매일자<input type="date"	id="eq_purdt" name="eq_purdt" size=10 maxlength=8>
	
	
			<input type="hidden" id="uuid" name="uuid"  size=10 >
			<input type="text" id="img_path" name="img_path" size=10 value="">
			<input type="hidden" id="img_nm" name="img_nm"  size=10 value="">
			
	</div>
	
	<div class="col-4">
	<img id="prevu" src="#" onError="this.style.visibility='hidden'" />
	<div class="input-file">
	 	<input type="text" id="imgNm" readonly="readonly" class="file-name" /> 
		<label for="upload02" class="file-label"></label> 
		<input type="file" name="file" id="upldfile" class="file-upload" onchange="readURL(this)" accept="assets/img/*" />

	</div>
	</div>
	
	
	</div>
	</form>

		<hr />
		<div id="modalDiv"></div>

</div>
</body>
<script>


console.log(  $("input[name='chk']:checked").val()  ); // 사용여부 실시간 체크 Y or N
$("#btnok").on("click",function(){
	$("#frm").attr('action' , "eqMng"); 
	toastr.success('등록완료!');
	$("form").submit();
	
})

// UUID 생성 부 - 미사용 중
// 참고 : https://developyo.tistory.com/110
function makeUUID(){
	
	return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	
	//   	function s4() {
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
	        	
	        	
        		canvas.width=img.width*0.7;
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
	
//$("#btnok").on("click" , function(){
	//makeUUID(file_nm);
	
	
	
	 /* var url = "insertAjax";
	 $.ajax(url , {
		 method : "POST",
		 data: $("#frm").serialize(),
		 dataType:'json',
		 success : function(){alert("DB 접속 완료");}
		 
	 }).done(function(result){
		 // 처리 완료시
		 console.log(result);
		 // 처리후 리턴 페이지 지정
		 $("form").attr('action' , '/eq/eqMng');
		 // submit 진행
		 $("form").submit();
	 }) */
	 
	 
	 
	/* var bytes, blob; 
	bytes = new Uint8Array(data.blob); 
	blob = new Blob([bytes], {type:'image/bmp'}); 
	data['imgSrc'] = URL.createObjectURL(blob);
	console.log(data['imgSrc']); */
	

	
			
	
//})







	//console.log($("#upload02").html());

	/* $("#upldfile").change(function(){
		var formData = new FormData($("#frm"));
		$.ajax({
			method:"post",
			url : "/eqinsert",
			data : formData,
			processData : false,
		    dataType : "json",
		    contentType : false,
		    async    : false,
		    success : function(data) {
		            alert("파일 업로드 성공.");
		    },
		    error : function(error) {
		            alert("파일 업로드에 실패하였습니다.");
		           
		        }
		});
	}); */
	
	
	
	
	// 조회 버튼을 클릭시  > 모달 호출
	eqdiv.addEventListener("click" , function(){
		
		//모달 페이지 호출 부
		$("#modalDiv").load("eqdvmodal" , function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();	
			
			
		})
					
	});

	
		
	/* window.onload = function(){
		   const url = "/eqSelectAjax";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			
			  	console.log(result);
				
   			})
		};  */
		
		/* $("#vdr_cd").value = result.eqCd;
		$("#eq_nm").value = result.eqNm; */
		
		
	
				


	
	

</script>

</html>
