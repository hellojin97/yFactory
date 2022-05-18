<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
input {
	vertical-align: middle;
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
	<form name="frm" id="frm" action="#" method="post" enctype="multipart/form-data">
	<div class="row">
	<div class="col-8">
	
		<hr />
		<div align="right">
			<button type="reset" class="button btnpart">초기화</button>
			&nbsp;&nbsp;
			<button type="submit" class="button btnpart">저장</button>
		</div>
		<hr />
		<span>설비명*&nbsp;&nbsp;
					<input id="eq_id" size=10 maxlength=8>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					사용여부&nbsp;&nbsp;
						Y<input	type="radio" id="yes" name="chk" value="Y" checked>&nbsp;
						N<input type="radio" id="no" name="chk" value="N">
			&nbsp;&nbsp;&nbsp;&nbsp;
					구분코드&nbsp;&nbsp;<input id="vdr_cd" size=10 	maxlength=8>&nbsp;
					<input type="button" id="eqdiv" value="조회">&nbsp;
					<input id="eq_nm" size=10 maxlength=8>
		</span> <br /><br/>
			<span>
				모델번호&nbsp;&nbsp;<input 	id="eq_mdno" size=10 maxlength=8>
				&nbsp;&nbsp;&nbsp;&nbsp;
				제작업체&nbsp;&nbsp;<input id="vdr_cd" size=10 	maxlength=8>
				&nbsp;&nbsp;&nbsp;&nbsp;
				UPH*&nbsp;&nbsp;&nbsp;&nbsp;<input id="uph" size=10 maxlength=8>

		</span> <br /><br/> 
		<span> 
					가용온도&nbsp;&nbsp;&nbsp;&nbsp;<input id="eq_min" size=10 maxlength=8>&nbsp;&nbsp;~&nbsp;&nbsp;
					<input id="eq_max" size=10 maxlength=8> ℃ &nbsp;
					점검주기&nbsp;&nbsp;<input 	id="eq_chkcyc" size=10 maxlength=8>
					&nbsp;&nbsp;등록인&nbsp;&nbsp;<input	id="eq_inster" size=10 maxlength=8>
		</span><br/><br/>
		<span>
			
			&nbsp;&nbsp;구매일자&nbsp;&nbsp;<input type="date"	id="eq_purdt" size=10 maxlength=8>
	</span>
	
	
	
	
	</div>
	
	<div class="col-4">
	<img id="prevu" src="#" />
	<div class="input-file">
	 	<input type="text" readonly="readonly" class="file-name" /> 
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
// 이미지 파일 업로드 구현 시도중
function readURL(input) {
    	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.readAsDataURL(input.files[0]);

    
        reader.onload = function (e) {
    
        	var tempImage=new Image();
        	tempImage.src=reader.result;
        	console.log(tempImage);
        	tempImage.onload=function(){
        		var canvas=document.createElement('canvas');
        		var canvasContext=canvas.getContext("2d");
        		
        		
            	var img = new Image();
	        	img.src = e.target.result;
	        	
	        	
        		canvas.width=img.width*0.7;
        		canvas.height=img.height*0.7;
        		
        		canvasContext.drawImage(this,0,0,canvas.width,canvas.height);
        		
        		var dataURI=canvas.toDataURL("image/png");
        		
        		document.querySelector("#prevu").src=dataURI;
   
        	}
        };
    
    	}
	}




	//console.log($("#upload02").html());

	$("#upldfile").change(function(){
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
	});
	
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
