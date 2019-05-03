<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />    
<!-- begin:: Subheader -->
<div class="kt-subheader   kt-grid__item" id="kt_subheader">
	<div class="kt-subheader__main">
		<h3 class="kt-subheader__title">
			예약 하기 </h3>
		<span class="kt-subheader__separator kt-hidden"></span>
		<div class="kt-subheader__breadcrumbs">
			<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				User </a>
			<span class="kt-subheader__breadcrumbs-separator"></span>
			<a href="" class="kt-subheader__breadcrumbs-link">
				예약 하기 </a>
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
				</div>
				
				<div class="kt-portlet__body">
					<div id="kt_calendar"></div>
				</div>
			</div>

			<!--end::Portlet-->
		</div>
		
		<div class="col-lg-4">
		
		<form id="userBookingForm" action="${ctx}/user/booking/register" method="post">
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
							<input type="text" class="form-control" readonly="readonly" id="kt_datepicker_3"  name="startDate" placeholder="Select date">
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
							<input type="text" class="form-control" readonly="readonly" id="kt_datepicker_3" name="endDate" placeholder="Select date">
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
					<select class="form-control" id="planId" name="planId">						
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
							<button type="button" class="btn btn-brand" id="registerBookingBtn">예약하기</button>
						</div>
					</div>
				</div>
			</div>
			</form>
			
			
			
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
					<label class="col-form-label">- 예약은 3일 단위로 할 수 있습니다.</label>
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

<!--begin::Modal-->
<div class="modal fade" id="kt_modal_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">예약 확인 알람</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<p>예약이 완료되었습니다. 가입시 입력한 E-mail로 계정 정보가 전송되었습니다. 계정 정보를 입력하여 Remote TestKit을 사용하실 수 있습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="location.replace('${ctx}/user/booking/add')">확인</button>
			</div>
		</div>
	</div>
</div>

<!--end::Modal-->



<script>
var KTCalendarBasic = function() {

    return {
        //main function to initiate the module
        init: function() {
            var todayDate = moment().startOf('day');
            var YM = todayDate.format('YYYY-MM');
            var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
            var TODAY = todayDate.format('YYYY-MM-DD');
            var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

            $('#kt_calendar').fullCalendar({
                isRTL: KTUtil.isRTL(),
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    //right: 'month,agendaWeek,agendaDay,listWeek,listYear'
                    right: 'month'
                },
                editable: false, //만들기 불가
                //eventLimit: true, // allow "more" link when too many events
                navLinks: true,
                
                dayClick: function(date, jsEvent, view, resourceObj) {
                 return false; //날짜클릭 불가
                },
                displayEventTime: false, //시간숨기기
                disableDragging: true, //드래그 불가
                defaultDate: moment().format('YYYY-MM-DD'),
                allDayDefault: false,
                defaultView: "month",
                events: function (start, end, timezone, callback) {
                	var userId = "";
                	var groupCode = "처음";
                	var startDate = "";
                	var calendarDate = $('#kt_calendar').fullCalendar('getDate').format('YYYYMMDD');
               		var setData = JSON.stringify({'userId' : userId,
               									'groupCode' : groupCode,
               									'startDate' : startDate,
               									'calendarDate' : calendarDate});
               		$.ajax({
               			url : ctx+'/user/booking/getCalendar',
               			type : 'POST',
               			contentType : 'application/json;charset=UTF-8',
               			dataType : 'json',
               			data : setData,
               			success : function(response) {               				
               			var calendarData = response.calendarData;
               			var events = [];
               			
               			$.each(calendarData, function(index,item) {
               				var state;
               				if(item.state == "A"){
               					state = "fc-event-primary"
               				}
               				if(item.state == "P"){
               					state = "fc-event-danger fc-event-solid-warning"
               				}
               				if(item.date != null){
               					for(var i=0; i<item.date.length; i++){
               					events.push({
               						id: index+1,
           							title: item.planId,
           							start: item.date[i],
           							end: item.date[i],
           							className: state
           							});
               					}
               				}
               			});
               			callback(events);
               			}
               		});
                },
                eventRender: function(event, element) {
                    if (element.hasClass('fc-day-grid-event')) {
                        element.data('content', event.description);
                        element.data('placement', 'top');
                        KTApp.initPopover(element);
                    } else if (element.hasClass('fc-time-grid-event')) {
                        element.find('.fc-title').append('<div class="fc-description">' + event.description + '</div>'); 
                    } else if (element.find('.fc-list-item-title').lenght !== 0) {
                        element.find('.fc-list-item-title').append('<div class="fc-description">' + event.description + '</div>'); 
                    }
                }                
            });
        }
    };
}();

//


//시작일 체인지 이벤트
$("input[name='startDate']").on("change",function(){
	var startDate = $("input[name='startDate']").val();	
	var endDate = dateAddDel(startDate,+2,'d');
	var groupCode = "처음";
	$("input[name='endDate']").val(endDate);
	getGoods(startDate,endDate,groupCode);
});
//종료일 체인지 이벤트
$("input[name='endDate']").on("change",function(){
	var startDate = $("input[name='endDate']").val();
	var endDate = dateAddDel(startDate,-2,'d');
	$("input[name='startDate']").val(endDate);
});

//날짜 계산기
function dateAddDel(sDate, nNum, type) {
    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(5, 2), 10);
    var dd = parseInt(sDate.substr(8), 10);
    
    if (type == "d") {
        d = new Date(yy, mm - 1, dd + nNum);
    }
    else if (type == "m") {
        d = new Date(yy, mm - 1, dd + (nNum * 31));
    }
    else if (type == "y") {
        d = new Date(yy + nNum, mm - 1, dd);
    }
 
    yy = d.getFullYear();
    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
 
    return '' + yy + '-' +  mm  + '-' + dd;
}

//상품명 알아오는 ajax
function getGoods(startDate,endDate,groupCode){
	var setData = {'startDate' : startDate,
			'endDate' : endDate,
			'groupCode' : groupCode}

	$.ajax({
			url : ctx+'/user/booking/getGoods',
			type : 'GET',
			contentType : 'application/json;charset=UTF-8',
			dataType : 'json',
			data : setData,
			success : function(response) { 
				makeGoods(response);
				
			}
	});
	
}

//상품명 Make 메소드
function makeGoods(response){
	var listSize = response.length;
	var makeGoodsView = "";
	$("#planId").children().remove();
	for(var i =0; i<listSize; i++){
		makeGoodsView += '<option value="'+response[i]+'">'+response[i]+'</option>';		
	}
	$("#planId").append(makeGoodsView);
}

$("#registerBookingBtn").on("click",function(){
	
	var BStartDate = $("input[name='startDate']").val();
	var BEndDate = $("input[name='endDate']").val();
	var BPlanId = $("#planId").val();
	
	if(BStartDate==null || BEndDate==null || BPlanId==null ){
		alert("예약정보를 선택해주세요.");
		return;
	}
	var BData = JSON.stringify({"startDate":BStartDate, "endDate" : BEndDate, "planId" : BPlanId});	
	$.ajax({
		url : ctx+'/user/booking/register',
		type : 'POST',
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		data : BData,
		success : function(response) { 
			$("#kt_modal_1").modal("show");
			
		}
});
});






jQuery(document).ready(function() {
    KTCalendarBasic.init();
});

</script>










<!--begin::Page Vendors Styles(used by this page) -->
<link href="${ctx}/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendors Styles -->			
	
<!--begin::Page Vendors(used by this page) -->
<script src="${ctx}/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>
<!--end::Page Vendors -->

<!--begin::Page Scripts(used by this page) -->
<script src="${ctx}/resources/assets/app/custom/general/crud/forms/widgets/select2.js" type="text/javascript"></script>
<!--end::Page Scripts -->

<!--begin::Page Scripts(used by this page) -->
<script src="${ctx}/resources/assets/app/custom/general/crud/forms/widgets/bootstrap-datepicker.js" type="text/javascript"></script>
<!--end::Page Scripts -->
