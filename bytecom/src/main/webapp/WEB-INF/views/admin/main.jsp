<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!-- begin:: Subheader -->
	<div class="kt-subheader   kt-grid__item" id="kt_subheader">
		<div class="kt-subheader__main">
			<h3 class="kt-subheader__title">
				Main </h3>
			<span class="kt-subheader__separator kt-hidden"></span>
			<div class="kt-subheader__breadcrumbs">
				<a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
				<span class="kt-subheader__breadcrumbs-separator"></span>
				<a href="" class="kt-subheader__breadcrumbs-link">
					ADMININSTRATOR </a>
				<span class="kt-subheader__breadcrumbs-separator"></span>
				<a href="" class="kt-subheader__breadcrumbs-link">
					Main </a>
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
			<div class="col-xl-6">
			<div class="kt-portlet">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<h3 class="kt-portlet__head-title">
								<i class="la la-list"></i>&nbsp;그룹 목록
							</h3>
						</div>
					</div>
					<div class="kt-portlet__body">

						<!--begin::Section-->
						<div class="kt-section">
							<div class="kt-section__content">
								<table class="table table-bordered table-hover" >
									<thead class="thead-dark">
										<tr class="text-center">
											<th>No</th>
											<th>그룹명</th>
											<th>담당자명</th>
											<th>연락처</th>
											<th>RTK 계정</th>
										</tr>
									</thead>
									<tbody id="groupListTable">																			
									</tbody>
								</table>
							</div>
							
							<!--start::pagination -->
							<div class="dataTables_paginate paging_full_numbers" id="kt_table_1_paginate">
								<ul class="pagination" id="groupPagination">								
								</ul>
							
							</div>
							<!--end::pagination -->
							
							<hr>
							<button type="button" class="btn btn-primary btn-wide btn-font-lg" onclick="location.href='${ctx}/admin/group/add'">그룹 추가</button>
							<button type="button" class="btn btn-danger btn-wide btn-font-lg" onclick="javascript:moveGroupUpdateDelete()">그룹 수정/삭제</button>												
						</div>

						<!--end::Section-->
					</div>
				</div>
			</div>
			
			
			<div class="col-xl-6">							
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
									<tbody id="userListTable">										
									</tbody>
								</table>
							</div>
							
							
							<!--start::pagination -->
							<div class="dataTables_paginate paging_full_numbers" id="kt_table_1_paginate">
								<ul class="pagination" id="userPagination">
									<!-- <li class="paginate_button page-item first disabled" id="kt_table_1_first">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="0" tabindex="0" class="page-link">
									<i class="la la-angle-double-left"></i></a></li>
									
									<li class="paginate_button page-item previous disabled" id="kt_table_1_previous">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="1" tabindex="0" class="page-link">
									<i class="la la-angle-left"></i></a></li>
									
									<li class="paginate_button page-item active">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="2" tabindex="0" class="page-link">1</a></li>
									
									<li class="paginate_button page-item ">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="3" tabindex="0" class="page-link">2</a></li>
									
									<li class="paginate_button page-item ">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="4" tabindex="0" class="page-link">3</a></li>
									
									<li class="paginate_button page-item ">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="5" tabindex="0" class="page-link">4</a></li>
									
									
									<li class="paginate_button page-item disabled" id="kt_table_2_ellipsis">
									<a href="#" aria-controls="kt_table_2" data-dt-idx="6" tabindex="0" class="page-link">…</a></li>
																							
									<li class="paginate_button page-item ">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="7" tabindex="0" class="page-link">5</a></li>
									
									<li class="paginate_button page-item next" id="kt_table_1_next">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="8" tabindex="0" class="page-link">
									<i class="la la-angle-right"></i></a></li>
									
									
									<li class="paginate_button page-item last" id="kt_table_1_last">
									<a href="#" aria-controls="kt_table_1" data-dt-idx="9" tabindex="0" class="page-link">
									<i class="la la-angle-double-right"></i></a></li> -->
								</ul>							
							</div>
							<!--end::pagination -->
							
							<hr>
							<button type="button"  class="btn btn-primary btn-wide btn-font-lg"  onclick="location.href='${ctx}/admin/user/add'">User 추가</button>
							<button type="button" class="btn btn-danger btn-wide btn-font-lg" onclick="javascript:moveUserUpdateDelete()" >User 수정/삭제</button>
						</div>

						<!--end::Section-->
					</div>
				</div>
				<!--end::Portlet-->
			</div>
		</div>
	</div>
	<form action="${ctx}/admin/group/updateDelete" method="get" id="moveGroupUpdateDeleteForm">
		<input type="hidden" value="" id="moveGroupUpdateDeleteGroupName" name="groupName">
		<input type="hidden" value="" id="moveGroupUpdateDeleteGroupUserName" name="userName">
	</form>
	<form action="${ctx}/admin/user/updateDelete" method="get" id="moveUserUpdateDeleteForm">
		<input type="hidden" value="" id="moveUserUpdateDeleteGroupName" name="groupName">
		<input type="hidden" value="" id="moveUserUpdateDeleteGroupUserName" name="userName">
	</form>
	<!-- end:: Content -->
	

<script type="text/javascript">

//페이지네비게이션

//user page
var userPage = 1;
//group page
var groupPage = 1;

var moveGroupUpdateDeleteGroupName = ""; //그룹목록 클릭시 그룹이름저장
var moveGroupUpdateDeleteGroupUserName = "";//그룹목록 클릭시 담당자이름 저장

var moveUserUpdateDeleteGroupName = ""; //유저목록 클릭시 그룹이름저장
var moveUserUpdateDeleteGroupUserName = "";//유저목록 클릭시 담당자이름 저장

//<<클릭
function firstClick(prefix){
	switch(prefix){
	case 'user' :
			userPage = 1;			
			getUserList();	
		break;
	case 'group' :
			groupPage = 1;
			getGroupList();	
			getUserList();
		break;
	}
}
//그 외 클릭
function pageClick(num,prefix){
	
	switch(prefix){
	case 'user' :
			userPage = num;			
			getUserList();
		break;
	case 'group' :
			groupPage = num;
			getGroupList();			
			getUserList();		
		break;
	}
	
}



//그룹목록 불러오기
function getGroupList(){
	
	var groupListData = {'page' : groupPage, 'authCode' : 'group', 'prefix' : 'group'};
	$.ajax({
		url : ctx+'/admin/group/list',
		type : 'GET',
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		data : groupListData,
		success : function(response) {
			
			$('#groupListTable').empty();
			$('#groupPagination').empty();
			
			makeGroupList(response);			
			$('#groupPagination').append(response.pagination.navigator);
			
			//나중에 처리
			setTimeout(function() {
			groupName = $('#groupListTable').find('td').eq(0).text();
			}, 500);
			
		}
	});	
}

//그룹목록 만들기
function makeGroupList(response){
	var groupList = response.groupList;
	var groupListView = '';
	
	for(var i=0; i<groupList.length; i++){		
		groupListView += '<tr class="groupListRow">';
		groupListView += '<th scope="row" class="text-center">'+ (i+1) +'</th>';
		groupListView += '<td>'+groupList[i].groupName+'</td>';
		groupListView += '<td>'+groupList[i].userName+'</td>';
		groupListView += '<td>'+groupList[i].userPhone+'</td>';
		groupListView += '<td>'+groupList[i].rtkId+'</td>';
		groupListView += '</tr>';
	}
	$('#groupListTable').append(groupListView);	
}





//그룹게시물 클릭
$('#groupListTable').on('click','tr',function(){
	groupName = $(this).children().eq(1).text();
	moveGroupUpdateDeleteGroupName = $(this).children().eq(1).text();
	moveGroupUpdateDeleteGroupUserName = $(this).children().eq(2).text();
	moveUserUpdateDeleteGroupName = "";
	moveUserUpdateDeleteGroupUserName = "";
	getUserList();
});

//유저게시물 클릭
$('#userListTable').on('click','tr',function(){
	moveUserUpdateDeleteGroupName = $(this).children().eq(1).text();
	moveUserUpdateDeleteGroupUserName = $(this).children().eq(2).text();
});



//유저목록 불러오기
var groupName = '';
function getUserList(){
	var userListData = {'page' : userPage, 'authCode' : 'user', 'groupName' : groupName, 'prefix' : 'user'};
	$.ajax({
		url : ctx+'/admin/user/list',
		type : 'GET',
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		data : userListData,
		success : function(response) {			
			$('#userListTable').empty();
			$('#userPagination').empty();
			
			makeUserList(response);			
			$('#userPagination').append(response.pagination.navigator);
			
				
		}
	});	
	
}

//유저목록 만들기
function makeUserList(response){
	var userList = response.userList;
	var userListView = '';
	
	for(var i=0; i<userList.length; i++){		
		userListView += '<tr>';
		userListView += '<th scope="row" class="text-center">'+ (i+1) +'</th>';
		userListView += '<td>'+userList[i].groupName+'</td>';
		userListView += '<td>'+userList[i].userName+'</td>';
		userListView += '<td>'+userList[i].userPhone+'</td>';
		userListView += '</tr>';
	}
	$('#userListTable').append(userListView);	
}


//그룹 수정삭제 페이지 이동
function moveGroupUpdateDelete(){
	
	if(moveGroupUpdateDeleteGroupName ==("") || moveGroupUpdateDeleteGroupUserName ==("")){
		alert("그룹을 선택해 주세요.");
		return;
	}	
	$("#moveGroupUpdateDeleteGroupName").val(moveGroupUpdateDeleteGroupName);
	$("#moveGroupUpdateDeleteGroupUserName").val(moveGroupUpdateDeleteGroupUserName);
	$("#moveGroupUpdateDeleteForm").submit();
}

//유저 수정삭제 페이지 이동
function moveUserUpdateDelete(){
	if(moveUserUpdateDeleteGroupName ==("") || moveUserUpdateDeleteGroupUserName ==("")){
		alert("유저을 선택해 주세요.");
		return;
	}	
	$("#moveUserUpdateDeleteGroupName").val(moveUserUpdateDeleteGroupName);
	$("#moveUserUpdateDeleteGroupUserName").val(moveUserUpdateDeleteGroupUserName);
	$("#moveUserUpdateDeleteForm").submit();
}

$(document).ready(function() {
	getGroupList();
	getUserList();
});



</script>


