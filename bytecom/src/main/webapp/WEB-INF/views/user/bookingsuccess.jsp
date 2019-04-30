<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />    

<!-- begin:: Content -->
<div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">
	<div class="row">
		<div class="kt-portlet kt-bg-brand kt-portlet--skin-solid kt-portlet--height-fluid">
			<div class="kt-portlet__head kt-portlet__head--noborder">
				<div class="kt-portlet__head-label">
					<h3 class="kt-portlet__head-title">
						예약 확인 알림
					</h3>
				</div>											
			</div>
			<div class="kt-portlet__body">
				<!--begin::Widget 7-->
				<div class="kt-widget7 kt-widget7--skin-light">
					<div class="kt-widget7__desc">
						예약이 완료되었습니다. 가입시 입력한 E-mail로 계정 정보가 전송되었습니다. 계정 정보를 입력하여 Remote TestKit을 사용하실 수 있습니다.
					</div>											
					<br>											
					<div class="kt-widget7__button">
						<a class="btn btn-success" href="#" role="button">확인</a>
					</div>
					<br>
				</div>
				<!--end::Widget 7-->
			</div>
		</div>
	</div>
</div>

<!-- end:: Content -->