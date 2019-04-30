<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!-- begin:: Subheader -->
	<div class="kt-subheader   kt-grid__item" id="kt_subheader">
	
		<div class="kt-subheader__main">
			<h3 class="kt-subheader__title">
				그룹 추가&#183;삭제 </h3>
			<span class="kt-subheader__separator kt-hidden"></span>
			<div class="kt-subheader__breadcrumbs">
				<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
				<span class="kt-subheader__breadcrumbs-separator"></span>
				<a href="" class="kt-subheader__breadcrumbs-link">
					ADMININSTRATOR </a>
				<span class="kt-subheader__breadcrumbs-separator"></span>
				<a href="" class="kt-subheader__breadcrumbs-link">
					그룹 추가&#183;삭제 </a>
			</div>
		</div>
	</div>

	<!-- end:: Subheader -->

	<!-- begin:: Content -->

	<div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">
		<div class="row">
			<div class="col-lg-12">
				<!--begin::Portlet-->
				<form class="kt-form"  id="groupUserUpdateDeleteFrom" action="" method="post">
				<input type="hidden" id="rtkList" name="rtkList">
				<input type="hidden" id="beforeGroupName" name="beforeGroupName" value="${groupInfo[0].GROUP_NAME}">				
				<div class="kt-portlet kt-portlet--last kt-portlet--head-lg kt-portlet--responsive-mobile" id="kt_page_portlet">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h3 class="kt-portlet__head-title">그룹 추가&#183;삭제</h3>
						</div>
						<div class="kt-portlet__head-toolbar">												
							<div class="btn-group">												
								
								<button type="button" class="btn btn-brand" id="groupUpdateBtn">
									<i class="la la-check"></i>
									<span class="kt-hidden-mobile">Update</span>
								</button>
								
								<button type="button" class="btn btn-danger" id="groupDeleteBtn">
									<i class="flaticon2-trash"></i>
									<span class="kt-hidden-mobile">Delete</span>
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
													<input class="form-control" type="text" id="groupCode" name="groupCode" readonly="readonly" value="${groupInfo[0].GROUP_CODE}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-3 col-form-label">그룹명</label>
												<div class="col-9">
													<input class="form-control" type="text" id="groupName" name="groupName" value="${groupInfo[0].GROUP_NAME}">
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-3 col-form-label">담당자 이름</label>
												<div class="col-9">
													<input class="form-control" type="text" id="userName" name="userName" value="${groupInfo[0].USER_NAME}">
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-3 col-form-label">ID</label>
												<div class="col-9">																		
													<input class="form-control" type="text" id="userId" name="userId" readonly="readonly" value="${groupInfo[0].USER_ID}">
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
													<div class="input-group">
														<div class="input-group-prepend"><span class="input-group-text"><i class="la la-at"></i></span></div>
														<input type="email" class="form-control"  name="userMail" aria-describedby="basic-addon1" value="${groupInfo[0].USER_MAIL}">
													</div>
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-3 col-form-label">휴대전화</label>
												<div class="col-9">
													<div class="input-group">
														<div class="input-group-prepend"><span class="input-group-text"><i class="la la-phone"></i></span></div>
														<input type="tel" class="form-control" name="userPhone" aria-describedby="basic-addon1" value="${groupInfo[0].USER_PHONE}">
													</div>																		
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
													</label>
												</div>
											</div>																
											
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
											<c:forEach  var="rtkList" items="${groupInfo}" varStatus="i">
											<input type="hidden" id="beforePlanId" name="beforePlanId_${i.index}" value="${rtkList.PLAN_ID}">
											<div class="row" id="rtk_${i.index}"style="margin-top:2.5%;">
													<label class="col-lg-1 col-form-label">PLAN ID</label>
													<div class="col-lg-3">
														<input type="text" class="form-control" value="${rtkList.PLAN_ID}"  name="planId_${i.index}">
													</div>
													<label class="col-lg-1 col-form-label">RTK ID</label>
													<div class="col-lg-2">
														<input type="text" class="form-control" value="${rtkList.RTK_ID}" name="rtkId_${i.index}" >
													</div>
													<label class="col-lg-1 col-form-label">RTK PW</label>
													<div class="col-lg-2">
														<div class="input-group">
															<input type="password" class="form-control" value="${rtkList.RTK_PW}" name="rtkPw_${i.index}" >
														</div>
													</div>
													<div class="col-lg-2">
													<button type="button" class="btn btn-primary  btn-sm">등록</button>&nbsp;
													<button type="button" class="btn btn-danger btn-sm">삭제</button>
													</div>																	
											</div>
											</c:forEach>										
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
						</form>
					</div>
				</div>

				<!--end::Portlet-->
			</div>
		</div>
	</div>
	<!-- end:: Content -->
	
<script>
var rtkUserCnt = 0;
var addList = [];
//RTK 계정 추가하기 버튼
$("#rtkUserAddBtn").on("click",function(){	
	var rtkUserViewList = "";	
	
	rtkUserViewList += '<input type="hidden" id="beforePlanId" name="beforePlanId_'+rtkUserCnt+'" value="">';
	rtkUserViewList += '<div class="row" id="rtk_"'+rtkUserCnt+' style="margin-top:2.5%;">';
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
 	
	$("#rtkUserAddDiv").append(rtkUserViewList);
	rtkUserCnt++;
});

//라디오버튼 세팅
function setRadioChecked(){
	var radioCheck = "${groupInfo[0].STATE_CODE}";
	
	if(radioCheck == "A"){
		$("#radio_1").prop("checked",true);		
	}else if(radioCheck == "P"){
		$("#radio_2").prop("checked",true);
	}else if(radioCheck == "D"){
		$("#radio_3").prop("checked",true);
	}
}

//rtk계정 목록 데이터생성 후 히든에 넣기
function setRtkToHidden(){
var rtkUserViewList_data = [];
for( i = 0; i < rtkUserCnt; i++ ){
 	var plan_id = $('input[name="planId_'+i+'"]').val();
 	var rtk_id = $('input[name="rtkId_'+i+'"]').val();
 	var rtk_pw  = $('input[name="rtkPw_'+i+'"]').val();
 	var beforePlanId = $('input[name="beforePlanId_'+i+'"]').val();
 	
 	var json = {
 		"beforePlanId" : beforePlanId
 		,"planId" : plan_id
 		,"rtkId" : rtk_id
 		,"rtkPw" : rtk_pw
 	}; 	
 	rtkUserViewList_data.push(json);
 }
var json_rtkUserViewList_data = JSON.stringify(rtkUserViewList_data);	   
$('#rtkList').val(json_rtkUserViewList_data);
}

//RTK계정추가 버튼 클릭했을때 생긴 beforePlanId input 값 동적으로지정
function setBeforePlanId(){
	for( i = 0; i < rtkUserCnt; i++ ){
	  $('input[name="beforePlanId_'+i+'"]').val();
	}
}


//update 버튼 클릭
var groupUserUpdateDeleteFrom = $("#groupUserUpdateDeleteFrom");
$("#groupUpdateBtn").on("click",function(){
	setRtkToHidden();
	groupUserUpdateDeleteFrom.attr("action",ctx+"/admin/group/update");
	groupUserUpdateDeleteFrom.submit();
});

$(document).ready(function(){
	rtkUserCnt="${groupInfo.size()}";
	setRadioChecked();
});
</script>
