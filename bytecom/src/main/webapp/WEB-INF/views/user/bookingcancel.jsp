<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />    
<!-- begin:: Subheader -->
<div class="kt-subheader   kt-grid__item" id="kt_subheader">
	<div class="kt-subheader__main">
		<h3 class="kt-subheader__title">
			예약 현황 </h3>
		<span class="kt-subheader__separator kt-hidden"></span>
		<div class="kt-subheader__breadcrumbs">
			<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				User </a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				예약 현황 </a>
		</div>
	</div>							
</div>
<!-- end:: Subheader -->
						
		
<!-- begin:: Content -->
<div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">
	<div class="row">
		<div class="col-lg-8">

			<!--begin::Portlet-->
			<div class="kt-portlet" >
				<div class="kt-portlet__head">
														
					<div class="kt-portlet__head-label">
						<span class="kt-portlet__head-icon">
							<i class="flaticon-calendar-3"></i>
						</span>
						<h3 class="kt-portlet__head-title">
							Calendar
						</h3>
					</div>
																
					<div class="kt-portlet__head-toolbar">
						<div class="col-5">
							<select class="form-control" id="">
								<option value="AK">상품 사용내역</option>
								<option value="HI">User별</option>
								<option value="CA">소속별</option>
							</select>
						</div>
						<div class="col-5">
							<select class="form-control m-select2" id="kt_select2_1">
								<option value="AK">전체</option>
								<option value="HI">Hawaii</option>
								<option value="CA">California</option>
								<option value="NV">Nevada</option>
								<option value="OR">Oregon</option>
								<option value="WA">Washington</option>
							</select>
						</div>
						<div class="col-2">
							<button type="button" class="btn btn-primary btn-icon"><i class="fa fa-search"></i></button>
						</div>
					</div>
					
					
				</div>
				
				<div class="kt-portlet__body">
					<div id="kt_calendar"></div>
				</div>
			</div>

			<!--end::Portlet-->
		</div>
		
		<div class="col-lg-4">
		
		
		<div class="kt-portlet kt-form kt-form--label-right">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<span class="kt-portlet__head-icon">
							<i class="flaticon-calendar-3"></i>
						</span>
						<h3 class="kt-portlet__head-title">
							예약정보
						</h3>
					</div>
				</div>
														
				<div class="kt-portlet__body">
			
				
				<div class="form-group row">
					<label class="col-3 col-form-label">시작일 :</label>										
					<div class="col-9">
					<div class="input-group date">
							<input type="text" class="form-control" readonly="readonly" id="kt_datepicker_3"  placeholder="Select date">
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="la la-calendar"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="col-1"></div>									
				</div>
				
				<div class="form-group row">
					<label class="col-3 col-form-label">종료일 :</label>										
					<div class="col-9">
					<div class="input-group date">
							<input type="text" class="form-control" readonly="readonly" id="kt_datepicker_3"  placeholder="Select date">
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="la la-calendar"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="col-1"></div>									
				</div>
				
				<div class="form-group row">
					<label class="col-3 col-form-label">상품명 :</label>										
					<div class="col-9">
					<select class="form-control" id="">
						<option value="AK">상품 A</option>
						<option value="HI">상품 B</option>
						<option value="CA">상품 C</option>
					</select>
					</div>
					<div class="col-1"></div>									
				</div>
				
				
				
				</div>
				
				
				<div class="kt-portlet__foot">
					<div class="row align-items-center">
						<div class="col-lg-6 m--valign-middle">												
							<a href="#" class="kt-link kt-font-bold">Remote TestKit 사용방법 다운로드</a></span>
						</div>
						<div class="col-lg-6 kt-align-right">
							<button type="submit" class="btn btn-brand">예약취소</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			<div class="kt-portlet">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<span class="kt-portlet__head-icon">
							<i class="flaticon-calendar-3"></i>
						</span>
						<h3 class="kt-portlet__head-title">
							예약방법
						</h3>
					</div>
				</div>
														
				<div class="kt-portlet__body">								
				
					<label class="col-form-label">- 상단의 예약 정보를 통해 계정 예약이 가능합니다.</label>
					<label class="col-form-label">- 시작일과 종료일을 선택하면 선택할 수 있는 상품 목록이 나옵니다.</label>
					<label class="col-form-label">- 예약은 1주일 단위로 할 수 있습니다.</label>
					<label class="col-form-label">- 이미 예약된 계정은 달력에 표시되지 않습니다.</label>
					<label class="col-form-label">- 예약이 완료되면 E-mail로 계정 정보가 전송됩니다.</label>
					<label class="col-form-label">- 발급된 계정을 통해 Remote TestKit에 접속하여 사용하실 수 있습니다.</label>
					<label class="col-form-label">- 종료되는 시점에 발급된 계정 정보로 접속할 수 없으니 다시 예약하여 사용해 주시기 바랍니다.</label>
					
				</div>
				
			</div>
		
		
		
		
		
			
		
		
		
		
		</div>
	</div>
</div>

<!-- end:: Content -->

<!--begin::Page Vendors Styles(used by this page) -->
<link href="../assets/vendors/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendors Styles -->			
	
<!--begin::Page Vendors(used by this page) -->
<script src="../assets/vendors/custom/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>
<!--end::Page Vendors -->

<!--begin::Page Scripts(used by this page) -->
<script src="../assets/app/custom/general/components/calendar/basic.js" type="text/javascript"></script>
<!--end::Page Scripts -->

<!--begin::Page Scripts(used by this page) -->
<script src="../assets/app/custom/general/crud/forms/widgets/select2.js" type="text/javascript"></script>
<!--end::Page Scripts -->

<!--begin::Page Scripts(used by this page) -->
<script src="../assets/app/custom/general/crud/forms/widgets/bootstrap-datepicker.js" type="text/javascript"></script>
<!--end::Page Scripts -->
