<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<!-- begin::Head -->
	<head>
		<meta charset="utf-8" />
		<title>Bytecom</title>
		<meta name="description" content="Login page example">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!--begin::Fonts -->
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
		<script>
			WebFont.load({
                google: {"families":["Poppins:300,400,500,600,700","Roboto:300,400,500,600,700"]},
                active: function() {
                    sessionStorage.fonts = true;
                }
            });
        </script>
		<script> const ctx = '${ctx}'; </script>
		<!--end::Fonts -->

		<!--begin::Page Custom Styles(used by this page) -->
		<link href="${ctx}/resources/assets/app/custom/login/login-v3.default.css" rel="stylesheet" type="text/css" />

		<!--end::Page Custom Styles -->

		<!--begin:: Global Mandatory Vendors -->
		<link href="${ctx}/resources/assets/vendors/general/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />

		<!--end:: Global Mandatory Vendors -->

		<!--begin:: Global Optional Vendors -->
		<link href="${ctx}/resources/assets/vendors/general/tether/dist/css/tether.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/ion-rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/nouislider/distribute/nouislider.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/owl.carousel/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/owl.carousel/dist/assets/owl.theme.default.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/summernote/dist/summernote.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/animate.css/animate.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/toastr/build/toastr.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/morris.js/morris.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/sweetalert2/dist/sweetalert2.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/general/socicon/css/socicon.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/custom/vendors/line-awesome/css/line-awesome.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/custom/vendors/flaticon/flaticon.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/custom/vendors/flaticon2/flaticon.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/vendors/custom/vendors/fontawesome5/css/all.min.css" rel="stylesheet" type="text/css" />

		<!--end:: Global Optional Vendors -->

		<!--begin::Global Theme Styles(used by all pages) -->
		<link href="${ctx}/resources/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />

		<!--end::Global Theme Styles -->

		<!--begin::Layout Skins(used by all pages) -->
		<link href="${ctx}/resources/assets/demo/default/skins/header/base/light.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/demo/default/skins/header/menu/light.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/demo/default/skins/brand/dark.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/resources/assets/demo/default/skins/aside/dark.css" rel="stylesheet" type="text/css" />

		<!--end::Layout Skins -->
		<link rel="shortcut icon" href="${ctx}/resources/assets/media/logos/bytecom.ico" />
	</head>

	<!-- end::Head -->

	<!-- begin::Body -->
	<body class="kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader--enabled kt-subheader--solid kt-aside--enabled kt-aside--fixed kt-page--loading">

		<!-- begin:: Page -->
		<div class="kt-grid kt-grid--ver kt-grid--root">
			<div class="kt-grid kt-grid--hor kt-grid--root  kt-login kt-login--v3 kt-login--signin" id="kt_login">
				<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" style="background-image: url(${ctx}/resources/assets/media//bg/bg-3.jpg);">
					<div class="kt-grid__item kt-grid__item--fluid kt-login__wrapper">
						<div class="kt-login__container">
							<div class="kt-login__logo">
								<a href="${ctx}">
									<img alt="Logo"  style="width: 240px; height: 80px;" src="${ctx}/resources/assets/media/logos/BCLogo-b.png"/>
								</a>
							</div>							
							<div class="kt-login__signin">
								<!-- <div class="kt-login__head">
									<h3 class="kt-login__title">Sign In To Admin</h3>
								</div> -->
								
								<input type="hidden" id="failCheck" value="${loginInfo}">
							  
								<form class="kt-form" action="${ctx}/login" method="POST">
									<div class="input-group">
										<input class="form-control" type="text" placeholder="ID"  name="userId" autocomplete="off">
									</div>
									<div class="input-group">
										<input class="form-control" type="password" placeholder="Password"  name="userPw" autocomplete="off">
									</div>
									<div class="row kt-login__extra">
										<div class="col">
											<label class="kt-checkbox">
												<input type="checkbox" name="remember"> Remember me
												<span></span>
											</label>
										</div>
										<div class="col kt-align-right">
											<a href="javascript:;" id="kt_login_forgot" class="kt-login__link">ID/PW 찾기</a>
										</div>
									</div>
									<div class="kt-login__actions">
										<button id="kt_login_signin_submit" class="btn btn-brand btn-elevate kt-login__btn-primary">Sign In</button>
									</div>
									<sec:csrfInput/>
								</form>
							</div>
						 	<div class="kt-login__signup">
								<div class="kt-login__head">
									<h3 class="kt-login__title">회원가입</h3>
									<div class="kt-login__desc">아래 사항을 입력해 주세요.</div>
								</div>
								<form class="kt-form" action="" method="POST">
									<div class="input-group">
										<input class="form-control" type="text" placeholder="이름" id="registerUserName" name="userName">
									</div>
									<div class="input-group validated">
										<input class="form-control is-valid" type="text" placeholder="ID" id="registerUserId" name="userId" autocomplete="off">										
										<div class="valid-feedback" id="registerUserIdOk" style="display: none;">사용 가능한 ID 입니다.</div>
										<div class="invalid-feedback" id="registerUserIdNo" style="display: none">이미 사용중인 ID 입니다.</div>
									</div>	
													
													
									<div class="input-group validated">
										<input class="form-control" type="password" placeholder="Password" id="registerUserPw" name="userPw">
									</div>
									<div class="input-group validated">
										<input class="form-control" type="password" placeholder="Confirm Password" id="registerUserCheckPw" name="userCheckPw">
										<div class="invalid-feedback" id="registerUserCheckPwNo" style="display: none">Password가 다릅니다.</div>
									</div>
																		
									<div class="input-group validated">
										<input class="form-control is-valid" type="text" placeholder="Email" name="userMail" id="registerUserMail" autocomplete="off">
										<div class="invalid-feedback" id="registerUserMailNo" style="display: none">이미 사용중인 Email 입니다.</div>																			
									</div>	
																
									
									<div class="input-group">
										<input class="form-control" type="tel" placeholder="휴대전화" name="userPhone" id="registerUserPhone" autocomplete="off">
									</div>
									<div class="input-group">
										<input class="form-control" type="text" placeholder="소속명" name="userCompany" id="registerUserCompany" autocomplete="off">
									</div>
									<div class="input-group validated">
										<input class="form-control" type="text" placeholder="기관코드" name="groupCode" id="registerGroupCode" autocomplete="off">
										<!-- <div class="invalid-feedback">코드를 정확히 입력해 주세요.</div> -->
									</div>
									<div class="kt-login__actions">
										<button id="kt_login_signup_submit" class="btn btn-brand btn-elevate kt-login__btn-primary">가입</button>&nbsp;&nbsp;
										<button id="kt_login_signup_cancel" class="btn btn-light btn-elevate kt-login__btn-secondary">취소</button>
									</div>
								</form>
							</div>
							
							
							
							<div class="kt-login__forgot">
								<div class="kt-login__head">
									<h3 class="kt-login__title">ID / PW 찾기</h3>
									<div class="kt-login__desc">아래 사항을 입력해 주세요.</div>
								</div>
								<form class="kt-form" action="">
									<div class="input-group">
										<input class="form-control" type="text" placeholder="이름" name="userName"  autocomplete="off">
									</div>
									<div class="input-group">
										<input class="form-control" type="tel" placeholder="휴대전화" name="userPhone" autocomplete="off">
									</div>
									<div class="input-group">
										<input class="form-control" type="text" placeholder="Email" name="userMail" autocomplete="off">
									</div>
									
									<div class="input-group validated" align="center">
										<div class="invalid-feedback">정보가 일치하지 않습니다. 다시 확인해 주세요 .</div>
									</div>
									
									<div class="kt-login__actions">
										<button id="kt_login_forgot_submit" class="btn btn-brand btn-elevate kt-login__btn-primary">전송</button>&nbsp;&nbsp;
										<button id="kt_login_forgot_cancel" class="btn btn-light btn-elevate kt-login__btn-secondary">취소</button>
									</div>
								</form>
							</div>
							<div class="kt-login__account">
								<span class="kt-login__account-msg">
									Don't have an account yet ?
								</span>
								&nbsp;&nbsp;
								<a href="javascript:;" id="kt_login_signup" class="kt-login__account-link">Sign Up!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- end:: Page -->

		<!-- begin::Global Config(global config for global JS sciprts) -->
		<script>
			var KTAppOptions = {
				"colors": {
					"state": {
						"brand": "#5d78ff",
						"dark": "#282a3c",
						"light": "#ffffff",
						"primary": "#5867dd",
						"success": "#34bfa3",
						"info": "#36a3f7",
						"warning": "#ffb822",
						"danger": "#fd3995"
					},
					"base": {
						"label": ["#c5cbe3", "#a1a8c3", "#3d4465", "#3e4466"],
						"shape": ["#f0f3ff", "#d9dffa", "#afb4d4", "#646c9a"]
					}
				}
			};
		</script>

		<!-- end::Global Config -->

		<!--begin:: Global Mandatory Vendors -->
		<script src="${ctx}/resources/assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/popper.js/dist/umd/popper.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/js-cookie/src/js.cookie.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/moment/min/moment.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/tooltip.js/dist/umd/tooltip.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/perfect-scrollbar/dist/perfect-scrollbar.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/sticky-js/dist/sticky.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/wnumb/wNumb.js" type="text/javascript"></script>

		<!--end:: Global Mandatory Vendors -->

		<!--begin:: Global Optional Vendors -->
		<script src="${ctx}/resources/assets/vendors/general/jquery-form/dist/jquery.form.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/block-ui/jquery.blockUI.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/bootstrap-datepicker/init.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/bootstrap-timepicker/init.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-maxlength/src/bootstrap-maxlength.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-select/dist/js/bootstrap-select.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-switch/dist/js/bootstrap-switch.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/bootstrap-switch/init.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/select2/dist/js/select2.full.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/ion-rangeslider/js/ion.rangeSlider.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/typeahead.js/dist/typeahead.bundle.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/handlebars/dist/handlebars.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/inputmask/dist/jquery.inputmask.bundle.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/inputmask/dist/inputmask/inputmask.date.extensions.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/inputmask/dist/inputmask/inputmask.numeric.extensions.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/nouislider/distribute/nouislider.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/owl.carousel/dist/owl.carousel.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/autosize/dist/autosize.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/clipboard/dist/clipboard.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/dropzone/dist/dropzone.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/summernote/dist/summernote.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/markdown/lib/markdown.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/bootstrap-markdown/init.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/bootstrap-notify/bootstrap-notify.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/bootstrap-notify/init.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/jquery-validation/dist/additional-methods.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/toastr/build/toastr.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/raphael/raphael.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/morris.js/morris.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/chart.js/dist/Chart.bundle.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/vendors/jquery-idletimer/idle-timer.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/waypoints/lib/jquery.waypoints.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/counterup/jquery.counterup.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/es6-promise-polyfill/promise.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/sweetalert2/dist/sweetalert2.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/sweetalert2/init.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/jquery.repeater/src/lib.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/jquery.repeater/src/jquery.input.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/jquery.repeater/src/repeater.js" type="text/javascript"></script>
		<script src="${ctx}/resources/assets/vendors/general/dompurify/dist/purify.js" type="text/javascript"></script>

		<!--end:: Global Optional Vendors -->

		<!--begin::Global Theme Bundle(used by all pages) -->
		<script src="${ctx}/resources/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
		<!--end::Global Theme Bundle -->
		
		<!--begin::Global App Bundle(used by all pages) -->
		<script src="${ctx}/resources/assets/app/bundle/app.bundle.js" type="text/javascript"></script>
		<!--end::Global App Bundle -->
		
		<!--begin::Page Scripts(used by this page) -->
		<script src="${ctx}/resources/assets/app/custom/login/login-general.js" type="text/javascript"></script>
		<!--end::Page Scripts -->
		
		<!-- 정규표현식 -->
		<script src="${ctx}/resources/assets/vendors/custom/components/vendors/jquery-validation/init.js" type="text/javascript"></script>
		
				
		
<script type="text/javascript">



</script>
	</body>

	<!-- end::Body -->
	
</html>