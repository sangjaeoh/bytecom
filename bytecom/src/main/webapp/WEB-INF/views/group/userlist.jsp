<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />    
<!-- begin:: Subheader -->
<div class="kt-subheader   kt-grid__item" id="kt_subheader">
	<div class="kt-subheader__main">
		<h3 class="kt-subheader__title">
			User 관리 </h3>
		<span class="kt-subheader__separator kt-hidden"></span>
		<div class="kt-subheader__breadcrumbs">
			<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				그룹 MANAGER </a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				User 관리 </a>
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
			<!--begin::Portlet-->
			<div class="kt-portlet">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h3 class="kt-portlet__head-title">
							<i class="la la-list"></i>&nbsp;User 목록
						</h3>
					</div>
				</div>
				<div class="kt-portlet__body">

					<!--begin::Section-->
					<div class="kt-section">
						<div class="kt-section__content">
							<table class="table table-bordered table-hover">
								<thead class="thead-dark">
									<tr class="text-center">
										<th>No</th>
										<th>그룹명</th>
										<th>이름</th>
										<th>연락처</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" class="text-center">1</th>
										<td>Jhon</td>
										<td>Stone</td>
										<td>@jhon</td>
									</tr>
									<tr>
										<th scope="row" class="text-center">2</th>
										<td>Lisa</td>
										<td>Nilson</td>
										<td>@lisa</td>
									</tr>
									<tr>
										<th scope="row" class="text-center">3</th>
										<td>Larry</td>
										<td>the Bird</td>
										<td>@twitter</td>
									</tr>
								</tbody>
							</table>
						</div>
						
					<!--start::pagination -->
						<div class="dataTables_paginate paging_full_numbers" id="kt_table_1_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item first disabled" id="kt_table_1_first">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="0" tabindex="0" class="page-link">
								<i class="la la-angle-double-left"></i></a></li>
								
								<li class="paginate_button page-item previous disabled" id="kt_table_1_previous">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="1" tabindex="0" class="page-link">
								<i class="la la-angle-left"></i></a></li>
								
								<li class="paginate_button page-item">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="2" tabindex="0" class="page-link">1</a></li>
								
								<li class="paginate_button page-item active">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="3" tabindex="0" class="page-link">2</a></li>
								
								<li class="paginate_button page-item ">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="4" tabindex="0" class="page-link">3</a></li>
								
								<li class="paginate_button page-item ">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="5" tabindex="0" class="page-link">4</a></li>
								
								<li class="paginate_button page-item ">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="6" tabindex="0" class="page-link">5</a></li>
								
								<li class="paginate_button page-item next" id="kt_table_1_next">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="7" tabindex="0" class="page-link">
								<i class="la la-angle-right"></i></a></li>
								
								<li class="paginate_button page-item last" id="kt_table_1_last">
								<a href="#" aria-controls="kt_table_1" data-dt-idx="8" tabindex="0" class="page-link">
								<i class="la la-angle-double-right"></i></a></li>
							</ul>
						
						</div>
						<!--end::pagination -->
						

						<hr>
						<div align="center">
							<button type="button" class="btn btn-primary btn-wide btn-font-lg">User 추가</button>
							<button type="button" class="btn btn-danger btn-wide btn-font-lg">User 수정/삭제</button>
						</div>
					</div>

					<!--end::Section-->
				</div>
			</div>
			<!--end::Portlet-->								
	</div>
</div>

<!-- end:: Content -->

<!--begin::Page Scripts(used by this page) -->
<script src="../assets/app/custom/general/crud/datatables/basic/paginations.js" type="text/javascript"></script>
<!--end::Page Scripts -->