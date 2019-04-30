<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />    
<!-- begin:: Subheader -->
<div class="kt-subheader   kt-grid__item" id="kt_subheader">
	<div class="kt-subheader__main">
		<h3 class="kt-subheader__title">
			User 수정/삭제 </h3>
		<span class="kt-subheader__separator kt-hidden"></span>
		<div class="kt-subheader__breadcrumbs">
			<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				그룹 MANAGER </a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				User 수정/삭제 </a>
			<!-- <span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				Tables </a> -->
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
			<form class="kt-form" id="userUpdateDeleteFrom" action="" method="post">
			<div class="kt-portlet kt-portlet--last kt-portlet--head-lg kt-portlet--responsive-mobile" id="kt_page_portlet">			
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h3 class="kt-portlet__head-title">그룹 기본 정보</h3>
					</div>
					<div class="kt-portlet__head-toolbar">
																	
						<div class="btn-group">
							<button type="button" class="btn btn-brand" id="userUpdateBtn">
								<i class="la la-check"></i>
								<span class="kt-hidden-mobile">Update</span>
							</button>
							
							<button type="button" class="btn btn-danger" id="userDeleteBtn">
								<i class="flaticon2-trash"></i>
								<span class="kt-hidden-mobile">Delete</span>
							</button>
							
							
							<!-- <button type="button" class="btn btn-brand dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<ul class="kt-nav">
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-reload"></i>
											<span class="kt-nav__link-text">Save & continue</span>
										</a>
									</li>
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-power"></i>
											<span class="kt-nav__link-text">Save & exit</span>
										</a>
									</li>
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-edit-interface-symbol-of-pencil-tool"></i>
											<span class="kt-nav__link-text">Save & edit</span>
										</a>
									</li>
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-add-1"></i>
											<span class="kt-nav__link-text">Save & add new</span>
										</a>
									</li>
								</ul>
							</div> -->
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
												<input class="form-control" type="text" id="userName" name="userName" value="${userInfo.USER_NAME}">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-3 col-form-label">ID</label>
											<div class="col-9">																		
												<input class="form-control" type="text" id="userId" name="userId" readonly="readonly" value="${userInfo.USER_ID}">																		
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-3 col-form-label">Password</label>
											<div class="col-9">
												<input class="form-control" type="password" id="userPw" name="userPw" value="">
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-3 col-form-label">Email Address</label>
											<div class="col-9">
												<div class="input-group validated">
													<div class="input-group-prepend"><span class="input-group-text"><i class="la la-at"></i></span></div>
													<input type="email" class="form-control" id="userMail" name="userMail" aria-describedby="basic-addon1" value="${userInfo.USER_MAIL}">
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
													<input type="tel" class="form-control" id="userPhone" name="userPhone" aria-describedby="basic-addon1" value="${userInfo.USER_PHONE}">
													<!-- <div class="valid-feedback">사용 가능한 번호입니다.</div>	
													<div class="invalid-feedback">이미 사용중인 번호입니다.</div> -->																	
												</div>
											</div>
										</div>
																										
										<div class="form-group row">
											<label class="col-3 col-form-label">소속명</label>
											<div class="col-9">
												<input class="form-control" type="text" id="userCompany" name="userCompany" value="${userInfo.USER_COMPANY}">
											</div>
										</div>	
										
										<div class="form-group row">
											<label class="col-3 col-form-label">기관코드</label>
											<div class="col-9">
												<input class="form-control" type="text" id="groupCode" name="groupCode" readonly="readonly" value="${userInfo.GROUP_CODE}">
											</div>
										</div>	
							
										
										<div class="form-group form-group-last row">
											<label class="col-3 col-form-label">상태</label>
											<div class="kt-radio-inline">
												<label class="kt-radio">
													<input type="radio" name="stateCode" value="A" id="radio_1" > 유효
														<span></span>
													</label>
													<label class="kt-radio">
														<input type="radio" name="stateCode" value="P" id="radio_2" > 일시정지
														<span></span>
													</label>
													<label class="kt-radio">
														<input type="radio" name="stateCode" value="D" id="radio_3" > 삭제됨
														<span></span>
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
<script>
//라디오버튼 세팅
function setRadioChecked(){
	var radioCheck = "${userInfo.STATE_CODE}";
	
	if(radioCheck == "A"){
		$("#radio_1").prop("checked",true);		
	}else if(radioCheck == "P"){
		$("#radio_2").prop("checked",true);
	}else if(radioCheck == "D"){
		$("#radio_3").prop("checked",true);
	}
}

//update 버튼 클릭
var userUpdateDeleteFrom = $("#userUpdateDeleteFrom");
$("#userUpdateBtn").on("click",function(){
	userUpdateDeleteFrom.attr("action",ctx+"/admin/user/update");
	userUpdateDeleteFrom.submit();
});

$(document).ready(function(){
	setRadioChecked();
});


</script>