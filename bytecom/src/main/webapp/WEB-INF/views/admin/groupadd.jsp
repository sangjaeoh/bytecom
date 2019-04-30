<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!-- begin:: Subheader -->
	<div class="kt-subheader   kt-grid__item" id="kt_subheader">
	
		<div class="kt-subheader__main">
			<h3 class="kt-subheader__title">
				그룹 관리 </h3>
			<span class="kt-subheader__separator kt-hidden"></span>
			<div class="kt-subheader__breadcrumbs">
				<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
				<span class="kt-subheader__breadcrumbs-separator"></span>
				<a href="" class="kt-subheader__breadcrumbs-link">
					ADMININSTRATOR </a>
				<span class="kt-subheader__breadcrumbs-separator"></span>
				<a href="" class="kt-subheader__breadcrumbs-link">
					그룹 관리 </a>							
	
				<!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
			</div>
		</div>							
	</div>

<!-- end:: Subheader -->

<!-- begin:: Content -->
	<div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">
		<div class="row">
			<div class="col-lg-12">
			
			
			
			
	
				<!--begin::Portlet-->
		<form class="kt-form" id="groupUserAddFrom" action="${ctx}/admin/group/userAdd" method="post">
			<input type="hidden" id="rtkList" name="rtkList">				
			<div class="kt-portlet kt-portlet--last kt-portlet--head-lg kt-portlet--responsive-mobile" id="kt_page_portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h3 class="kt-portlet__head-title">그룹 생성</h3>
					</div>
					<div class="kt-portlet__head-toolbar">												
						<div class="btn-group">
							<button type="submit" class="btn btn-brand" id="groupAddBtn">
								<i class="la la-check"></i>
								<span class="kt-hidden-mobile">Save</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
						<div class="row">
							<div class="col-xl-2"></div>
							<div class="col-xl-8">
								<div class="kt-section kt-section--first">
									<div class="kt-section__body">
										<h3 class="kt-section__title kt-section__title-lg">그룹 기본 정보:</h3>
										<div class="form-group row">
											<label class="col-3 col-form-label">그룹 코드</label>
											<div class="col-9">
												<input class="form-control" type="text" id="groupCode" name="groupCode" blank-vaild="grp" required="">												
											
											</div>
										</div>
										<div class="form-group row">
											<label class="col-3 col-form-label">그룹명</label>
											<div class="col-9">
												<input class="form-control" type="text" id="groupName" name="groupName" blank-vaild="grp" required="">
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-3 col-form-label">담당자 이름</label>
											<div class="col-9">
												<input class="form-control" type="text" id="userName" name="userName" blank-vaild="grp" required="">
											</div>
										</div>
																										
										<div class="form-group row validated">
											<label class="col-3 col-form-label">ID</label>
											<div class="col-9">																		
												<input class="form-control" type="text" id="userId" name="userId" blank-vaild="grp" required="">
												<!-- <div class="valid-feedback" id="userIdOk" style="display: none;">사용 가능한 ID 입니다.</div>
												<div class="invalid-feedback" id="userIdNo" style="display: none;">이미 사용중인 ID 입니다.</div> -->
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-3 col-form-label">Password</label>
											<div class="col-9">
												<input class="form-control" type="password" id="userPw" name="userPw" blank-vaild="grp" required="">
											</div>
										</div>
										
										
										
										
										<div class="form-group row validated">
											<label class="col-3 col-form-label">Email Address</label>
											<div class="col-9">
												<div class="input-group">
													<div class="input-group-prepend"><span class="input-group-text"><i class="la la-at"></i></span></div>
													<input type="text" class="form-control" name="userMail" id="userMail" aria-describedby="basic-addon1" blank-vaild="grp" required="">
													<!-- <div class="valid-feedback" id="userMailOk" style="display: none;">사용 가능한 Email 입니다.</div>
													<div class="invalid-feedback" id="userMailNo" style="display: none;">이미 사용중인 Email 입니다.</div> -->
												</div>
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-3 col-form-label">휴대전화</label>
											<div class="col-9">
												<div class="input-group">
													<div class="input-group-prepend"><span class="input-group-text"><i class="la la-phone"></i></span></div>
													<input type="text" class="form-control" name="userPhone" id="userPhone" aria-describedby="basic-addon1" blank-vaild="grp" required="">
												</div>																		
											</div>
										</div>
										
										<div class="form-group form-group-last row">
											<label class="col-3 col-form-label">상태</label>
											<div class="kt-radio-inline">
												<label class="kt-radio">
													<input type="radio" name="stateCode" value="A" checked="checked"> 유효
													<span></span>
												</label>
												<label class="kt-radio">
													<input type="radio" name="stateCode" value="P"> 일시정지
													<span></span>
												</label>
												<label class="kt-radio">
													<input type="radio" name="stateCode" value="D"> 삭제됨
													<span></span>
												</label>
											</div>
										</div>
									</form>																
										
										<!-- <div class="form-group form-group-last row">
											<label class="col-3 col-form-label">Company Site</label>
											<div class="col-9">
												<div class="input-group">
													<input type="text" class="form-control" placeholder="Username" value="loop">
													<div class="input-group-append"><span class="input-group-text">.com</span></div>
												</div>
											</div>
										</div> -->
									</div>
								</div>
								<br>
								<hr>
								<br><br>
								<div class="kt-section">
									<div class="kt-section__body">
										<h3 class="kt-section__title kt-section__title-lg">RTK 사용 계정 정보</h3>
										<div id="rtkUserAddDiv"></div>
										<br>
										<div align="center">
											<button type="button" class="btn btn-primary btn-wide" id="rtkUserAddBtn">RTK 계정 추가하기</button>
										</div>																
									</div>
								</div>
						</div>
					
						
						<div class="col-xl-2"></div>
					</div>
			<!--end::Portlet-->
			</div>
		</div>
	</div>
	
<!-- end:: Content -->
<script type="text/javascript">

var rtkJson = '';


//그룹 생성 버튼
$("#groupAddBtn").on("click",function(){
	
	var userform = $("#groupUserAddFrom");
	
	var user_vaild_list = [];
	//rtk계정 목록 데이터생성 후 히든에 넣기
	var rtkUserViewList_data = [];
	for( i = 0; i < rtkUserCnt; i++ ){
	 	var plan_id = $('input[name="planId_'+i+'"]').val();
	 	var rtk_id = $('input[name="rtkId_'+i+'"]').val();
	 	
	 	var vaild_ids = plan_id+","+rtk_id;
	 	
	 	if(user_vaild_list.indexOf(vaild_ids) == -1){
	 		user_vaild_list.push(vaild_ids);	 		
	 	}else{
	 		alert('중복');
	 		$('input[name="planId_'+i+'"]').focus();
	 		return false;
	 	}
	
	 	var rtk_pw  = $('input[name="rtkPw_'+i+'"]').val();	 		
	 	var json = {
	 		"planId" : plan_id
	 		,"rtkId" : rtk_id
	 		,"rtkPw" : rtk_pw
	 	};
	 	
	 	rtkUserViewList_data.push(json);
	 }	
	var json_rtkUserViewList_data = JSON.stringify(rtkUserViewList_data);	   
	$('#rtkList').val(json_rtkUserViewList_data);
	
	
	//rtk계정 목록 validata 함수 추가용
	for(var i = 0; i < rtkUserCnt; i++ ){
		rtkJson += "planId_"+i+":{required: true},rtkId_"+i+":{required: true},rtkPw_"+i+":{required: true},"		
	}
	
	rtkJson = rtkJson.slice(0,-1);    	
	 userform.validate({
	        rules: {
	        	rtkJson,
	        	groupCode: {
	                required: true
	            },
	            groupName: {
	                required: true                        
	            },            
	        	userName: {
	                required: true                        
	            },  
	            userId: {
	                required: true
	            },
	            userPw: {
	                required: true
	            },                             
	            userMail: {
	                required: true,
	                email: true
	            },                    
	            userPhone: {
	                required: true
	            }
	            
	            
	        }
	    });
	   
	    if (!userform.valid()) {
	        return;
	    }
	
	
    if(idck==0 || emailck == 0 || groupCodeCk ==0){
     	return;
    }
    
    var rtkGroupId = $("#groupName").val();    
    $("#groupId").val(rtkGroupId);
  
});


var vaild_list = [];

function check_list(planId, rtkId) {
	
	var plan_id = $('input[name="'+planId+'"]').val();
	var rtk_id = $('input[name="'+rtkId+'"]').val();
	
	
	if(vaild_list.indexOf(plan_id+","+rtk_id) == -1){
		vaild_list.push(plan_id+","+rtk_id);	
		return 'true';
	}else{
		return 'false';
	}
}

 
var rtkUserCnt = 0;
//RTK 계정 추가하기 버튼
$("#rtkUserAddBtn").on("click",function(){	
	var rtkUserViewList = "";
	
	var id_vaild_flag = check_list('planId_'+(rtkUserCnt-1),'rtkId_'+(rtkUserCnt-1));
	
	if(id_vaild_flag == 'false'){
		alert('중복');
		return false;
	}
	
// 	rtkUserViewList += '<div class="form-group row">';
	rtkUserViewList += '<div class="row" id="rtk_"'+rtkUserCnt+' style="margin-top:2.5%;">';
	//rtkUserViewList += '<input type="hidden" id="groupId" name="groupId">';
	rtkUserViewList += '<label class="col-lg-1 col-form-label">PLAN ID</label>';
	rtkUserViewList += '<div class="col-lg-3">';
	rtkUserViewList += '<input type="text" class="form-control" name="planId_'+rtkUserCnt+'"  required="required">';
	rtkUserViewList += '</div>';
	rtkUserViewList += '<label class="col-lg-1 col-form-label">RTK ID</label>';
	rtkUserViewList += '<div class="col-lg-2">';
	rtkUserViewList += '<input type="text" class="form-control" name="rtkId_'+rtkUserCnt+'"   required="required">';
	rtkUserViewList += '</div>';
	rtkUserViewList += '<label class="col-lg-1 col-form-label">RTK PW</label>';
	rtkUserViewList += '<div class="col-lg-2">';
	rtkUserViewList += '<div class="input-group">';
	rtkUserViewList += '<input type="password" class="form-control" name="rtkPw_'+rtkUserCnt+'"  required="required">';
	rtkUserViewList += '</div>';
	rtkUserViewList += '</div>';	
	rtkUserViewList += '<div class="col-lg-2">';
	rtkUserViewList += '<button type="button" class="btn btn-primary btn-sm" id="rtkAddBtn">등록</button>&nbsp;';
	rtkUserViewList += '<button type="button" class="btn btn-danger btn-sm" id="rtkDeleteBtn">삭제</button>';
 	rtkUserViewList += '</div>';
// 	rtkUserViewList += '</div>';
	$("#rtkUserAddDiv").append(rtkUserViewList);
	rtkUserCnt++;
});





//그룹코드 중복확인
var groupCodeCk = 0;		
$("#groupCode").on("propertychange change keyup paste input keydown", function() {	
 var groupCode = $("#groupCode").val();	
 $.ajax({
     async: true,
     type : 'POST',
     data : groupCode,
     url : ctx+"/admin/group/groupCodeCheck",
     dataType : "json",
     contentType: "application/json; charset=UTF-8",
     success : function(response) {
        	 setTimeout(function() {
        		
         if (response.check > 0) {
        	 $("#groupCode").removeClass("is-valid");
        	 $("#groupCode").addClass("is-invalid");
        	 groupCodeCk = 0;
         } else { 
        	 $("#groupCode").addClass("is-valid");
        	 $("#groupCode").removeClass("is-invalid");         	
        	 groupCodeCk = 1;  
         }
       },500);         
     },
     error : function(error) {      	 
    	 $("#groupCode").removeClass("is-valid");
    	 groupCodeCk = 0;
    	
     }
 });	 
}); 




//아이디 중복 확인
var idck = 0;		
$("#userId").on("propertychange change keyup paste input keydown", function() {
	
 var userId = $("#userId").val();			  
 
 $.ajax({
     async: true,
     type : 'POST',
     data : userId,
     url : ctx+"/register/userIdCheck",
     dataType : "json",
     contentType: "application/json; charset=UTF-8",
     success : function(response) {
    	 setTimeout(function() {
         if (response.check > 0) {
        	 $("#userId").removeClass("is-valid");
        	 $("#userId").addClass("is-invalid");
             idck = 0;
         } else {
        	 $("#userId").addClass("is-valid");
        	 $("#userId").removeClass("is-invalid");        	
             //아이디가 중복하지 않으면  idck = 1 
             idck = 1;
         }
    	},500);
     },
     error : function(error) { 
    	 
    	 $("#userId").removeClass("is-valid");
    	 
    	 idck = 0;
     }
 });	 
}); 
	


//Email 중복 확인
var emailck = 0;

$("#userMail").on("propertychange change keyup paste input keydown", function() {
	
 var userMail = $("#userMail").val();
 
 $.ajax({
     async: true,
     type : 'POST',
     data : userMail,
     url : ctx+"/register/userMailCheck",
     dataType : "json",
     contentType: "application/json; charset=UTF-8",
     success : function(response) {
    	 setTimeout(function() { 
         if (response.check > 0) {	
        	 emailck = 0;
        	 $("#userMail").addClass("is-invalid"); 
         } else {
        	 $("#userMail").removeClass("is-invalid");
             emailck = 1;
         }
      },500);
    	 
     },
     error : function(error) {
    	 
    	 emailck = 0;
            
     }
 });	 
}); 

	
</script>
