<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!-- begin:: Subheader -->
		<div class="kt-subheader   kt-grid__item" id="kt_subheader">
			<div class="kt-subheader__main">
				<h3 class="kt-subheader__title">
					User 추가 </h3>
				<span class="kt-subheader__separator kt-hidden"></span>
				<div class="kt-subheader__breadcrumbs">
					<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
					<span class="kt-subheader__breadcrumbs-separator"></span>
					<a href="" class="kt-subheader__breadcrumbs-link">
						ADMININSTRATOR </a>
					<span class="kt-subheader__breadcrumbs-separator"></span>
					<a href="" class="kt-subheader__breadcrumbs-link">
						User 추가 </a>
				</div>
			</div>
		</div>
		<!-- end:: Subheader -->
							
	<!-- begin:: Content -->
	<div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">
		<div class="row">
			<div class="col-lg-12">
			
	
				<!--begin::Portlet-->
			<form class="kt-form" id="userAddForm"  action="${ctx}/admin/user/userAdd" method="post">
				<div class="kt-portlet kt-portlet--last kt-portlet--head-lg kt-portlet--responsive-mobile" id="kt_page_portlet">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h3 class="kt-portlet__head-title">그룹 기본 정보</h3>
						</div>
						<div class="kt-portlet__head-toolbar">
																		
							<div class="btn-group">
								<button type="submit" class="btn btn-brand" id="userAddBtn">
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
											<!-- <h3 class="kt-section__title kt-section__title-lg">그룹 기본 정보:</h3> -->
											<div class="form-group row">
												<label class="col-3 col-form-label">이름</label>
												<div class="col-9">
													<input class="form-control" type="text" id="userName" name="userName">
												</div>
											</div>
											<div class="form-group row validated">
												<label class="col-3 col-form-label">ID</label>
												<div class="col-9">																		
													<input class="form-control" type="text" id="userId" name="userId">
													<!-- <div class="valid-feedback">사용 가능한 ID 입니다.</div>
													<div class="invalid-feedback">이미 사용중인 ID 입니다.</div> -->
												</div>
											</div>
											
											
											<div class="form-group row">
												<label class="col-3 col-form-label">Password</label>
												<div class="col-9">
													<input class="form-control" type="password" id="userPw" name="userPw">
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-3 col-form-label">Email Address</label>
												<div class="col-9">
													<div class="input-group validated">
														<div class="input-group-prepend"><span class="input-group-text"><i class="la la-at"></i></span></div>
														<input type="text" class="form-control" id="userMail" name="userMail" aria-describedby="basic-addon1">
														<!-- <div class="valid-feedback">사용 가능한 Email입니다.</div>
														<div class="invalid-feedback">이미 사용중인 Email입니다.</div> -->
													</div>
												</div>
											</div>																
											
											<div class="form-group row">
												<label class="col-3 col-form-label">휴대전화</label>
												<div class="col-9">
													<div class="input-group validated">
														<div class="input-group-prepend"><span class="input-group-text"><i class="la la-phone"></i></span></div>
														<input type="text" class="form-control" id="userPhone" name="userPhone" aria-describedby="basic-addon1">
														<!-- <div class="valid-feedback">사용 가능한 번호입니다.</div>	
														<div class="invalid-feedback">이미 사용중인 번호입니다.</div>	 -->																
													</div>
												</div>
											</div>
																											
											<div class="form-group row">
												<label class="col-3 col-form-label">소속명</label>
												<div class="col-9">
													<input class="form-control" type="text" id="userCompany" name="userCompany">
												</div>
											</div>																
											
											<div class="form-group row">
												<label class="col-3 col-form-label">기관코드</label>
												<div class="col-6">
													<input class="form-control" type="text" id="groupCode" name="groupCode" readonly="readonly" required="required">
												</div>
												<div class="col-3">
													<select class="form-control m-select2" id="kt_select2_1" name="groupName" >
														<option groupCode="" value="">그룹선택</option>
														<c:forEach var="groupList" items="${groupList}">
														<option groupCode="${groupList.GROUP_CODE}" value="${groupList.GROUP_NAME}">${groupList.GROUP_NAME}</option>
														</c:forEach>
													</select>
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
										</div>
									</div>
								</div>
								<div class="col-xl-2"></div>
							</div>
						</form>
					</div>
				</div>
	
				<!--end::Portlet-->
			</div>
		</div>
	</div>
	
	<!-- end:: Content -->
	
<!--begin::Page Scripts(used by this page) -->
<script src="${ctx}/resources/assets/app/custom/general/crud/forms/widgets/select2.js" type="text/javascript"></script>
<!--end::Page Scripts -->

<script>


//그룹 생성 버튼
$("#userAddBtn").on("click",function(){
	
	var userform = $("#userAddForm");

	userform.validate({
	        rules: {	                       
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
	            },
	            userCompany: {
	            	required: true
	            }
	        }
	    });
	   
	    if (!userform.valid()) {
	        return;
	    }	
	
    if(idck==0 || emailck == 0){
     	return;
    }
   
    
    
  
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



//그룹코드세팅


var selectGroupCode ="";
$("#kt_select2_1").on("change",function(){
	selectGroupCode = $(this).children('option:eq('+this.selectedIndex+')').attr('groupCode');
	$("#groupCode").val(selectGroupCode);
});







</script>

