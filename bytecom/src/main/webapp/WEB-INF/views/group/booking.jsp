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
					그룹 Manager </a>
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
			<div class="col-lg-12">

				<!--begin::Portlet-->
				<div class="kt-portlet" id="kt_portlet">
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
		</div>
	</div>

	<!-- end:: Content -->
	
	
<!--begin::Page Vendors Styles(used by this page) -->
<link href="${ctx}/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendors Styles -->			

<!--begin::Page Vendors(used by this page) -->
<script src="${ctx}/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>
<!--end::Page Vendors -->

<!--begin::Page Scripts(used by this page) -->
<script src="${ctx}/resources/assets/app/custom/general/components/calendar/basic.js" type="text/javascript"></script>
<!--end::Page Scripts -->

<!--begin::Page Scripts(used by this page) -->
<script src="${ctx}/resources/assets/app/custom/general/crud/forms/widgets/select2.js" type="text/javascript"></script>
<!--end::Page Scripts -->						
