"use strict";

jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }//if ( arr ) {
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }
 
    return obj;
};


// Class Definition
var KTLoginGeneral = function() {

    var login = $('#kt_login');

    var showErrorMsg = function(form, type, msg) {
        var alert = $('<div class="kt-alert kt-alert--outline alert alert-' + type + ' alert-dismissible" role="alert">\
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>\
			<span></span>\
		</div>');

        form.find('.alert').remove();
        alert.prependTo(form);
        //alert.animateClass('fadeIn animated');
        KTUtil.animateClass(alert[0], 'fadeIn animated');
        alert.find('span').html(msg);
    }

    // Private Functions
    var displaySignUpForm = function() {
        login.removeClass('kt-login--forgot');
        login.removeClass('kt-login--signin');

        login.addClass('kt-login--signup');
        KTUtil.animateClass(login.find('.kt-login__signup')[0], 'flipInX animated');
    }

    var displaySignInForm = function() {
        login.removeClass('kt-login--forgot');
        login.removeClass('kt-login--signup');

        login.addClass('kt-login--signin');
        KTUtil.animateClass(login.find('.kt-login__signin')[0], 'flipInX animated');
        //login.find('.kt-login__signin').animateClass('flipInX animated');
    }

    var displayForgotForm = function() {
        login.removeClass('kt-login--signin');
        login.removeClass('kt-login--signup');

        login.addClass('kt-login--forgot');
        //login.find('.kt-login--forgot').animateClass('flipInX animated');
        KTUtil.animateClass(login.find('.kt-login__forgot')[0], 'flipInX animated');

    }

    var handleFormSwitch = function() {
        $('#kt_login_forgot').click(function(e) {
            e.preventDefault();
            displayForgotForm();
        });

        $('#kt_login_forgot_cancel').click(function(e) {
            e.preventDefault();
            displaySignInForm();
        });

        $('#kt_login_signup').click(function(e) {
            e.preventDefault();
            displaySignUpForm();
        });

        $('#kt_login_signup_cancel').click(function(e) {
            e.preventDefault();
            displaySignInForm();
        });
    }

    
    //로그인 버튼
    var handleSignInFormSubmit = function() {
        $('#kt_login_signin_submit').click(function(e) {
            e.preventDefault();
            var btn = $(this);
            var form = $(this).closest('form');           

            form.validate({
                rules: {                	
                	userId: {
                        required: true
                    },
                    userPw: {
                        required: true
                    }
                }
            });

            if (!form.valid()) {
                return;
            }

            btn.addClass('kt-spinner kt-spinner--right kt-spinner--sm kt-spinner--light').attr('disabled', true);
            
            form.submit();

//            form.ajaxSubmit({
//                url: '',
//                success: function(response, status, xhr, $form) {
//                	// similate 2s delay
//                	setTimeout(function() {
//	                    btn.removeClass('kt-spinner kt-spinner--right kt-spinner--sm kt-spinner--light').attr('disabled', false);
//	                    showErrorMsg(form, 'danger', 'ID 혹은 비밀번호가 틀렸습니다. 다시 시도해 주세요.');
//                    }, 2000);
//                }
//            });
        });
    }

    
    
    
    //회원가입 버튼
    var handleSignUpFormSubmit = function() {
        $('#kt_login_signup_submit').click(function(e) {
        	
        	
            e.preventDefault();

            var btn = $(this);
            var form = $(this).closest('form');

            form.validate({
                rules: {                	
                	userName: {
                        required: true                        
                    },
                    userId: {
                        required: true
                    },
                    userName: {
                        required: true
                    },
                    userPw: {
                        required: true
                    },
                    userCheckPw: {
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
                    },
                    groupCode: {
                        required: true
                    }
                }
            });

            if (!form.valid()) {
                return;
            }
            checkPassword();
            
            if(idck==0 || emailck == 0 || confirmPassWord == 0){
            	return;
            }
            
            
           

              btn.addClass('kt-spinner kt-spinner--right kt-spinner--sm kt-spinner--light').attr('disabled', true);            
           
              var userRegisterData = JSON.stringify(form.serializeObject());              
             
              
              $.ajax({
              url : ctx+"/register/user",
              method : "post",
              dataType : 'json',
              data : userRegisterData,
              processData : true,
              contentType : "application/json; charset=UTF-8",
              success: function(response, status, xhr, $form) {
            	  
            	  setTimeout(function() {
	                    btn.removeClass('kt-spinner kt-spinner--right kt-spinner--sm kt-spinner--light').attr('disabled', false);
	                    form.clearForm();
	                    form.validate().resetForm();

	                    // display signup form
	                    displaySignInForm();
	                    var signInForm = login.find('.kt-login__signin form');
	                    signInForm.clearForm();
	                    signInForm.validate().resetForm();

	                    showErrorMsg(signInForm, 'success', '회원가입이 완료되었습니다. 메일 인증 후 이용해 주세요.');
	                }, 2000);
            	  
            	  }
              });
        });
    }

    var handleForgotFormSubmit = function() {
        $('#kt_login_forgot_submit').click(function(e) {
            e.preventDefault();

            var btn = $(this);
            var form = $(this).closest('form');

            form.validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    }
                }
            });

            if (!form.valid()) {
                return;
            }

            btn.addClass('kt-spinner kt-spinner--right kt-spinner--sm kt-spinner--light').attr('disabled', true);

            form.ajaxSubmit({
                url: '',
                success: function(response, status, xhr, $form) { 
                	// similate 2s delay
                	setTimeout(function() {
                		btn.removeClass('kt-spinner kt-spinner--right kt-spinner--sm kt-spinner--light').attr('disabled', false); // remove
	                    form.clearForm(); // clear form
	                    form.validate().resetForm(); // reset validation states

	                    // display signup form
	                    displaySignInForm();
	                    var signInForm = login.find('.kt-login__signin form');
	                    signInForm.clearForm();
	                    signInForm.validate().resetForm();

	                    showErrorMsg(signInForm, 'success', '회원님의 메일로 전송되었습니다. 메일을 확인해 주세요.');
                	}, 2000);
                }
            });
        });
    }
    
    
    
    //로그인 체크
	function loginCheck(){		 
		var check =  $('#failCheck').val();		
		if(check == 'true'){		
			var signInForm = login.find('.kt-login__signin form');
			showErrorMsg(signInForm, 'danger', 'ID 혹은 비밀번호가 틀렸습니다. 다시 시도해 주세요.');
		}
		}
	
	
	
	
	
	
	
	

	//아이디 중복 확인

	var idck = 0;
	var $registerUserid = $('.kt-login__signup').children('form[class="kt-form"]').children('div[class="input-group validated"]').children('[id="registerUserId"]');

	function userIdCheck(){
		
			$($registerUserid).on("propertychange change keyup paste input keydown", function() {
				
			 var userId = $($registerUserid).val();			  
			 
			 console.log(userId);
			 $.ajax({
			     async: true,
			     type : 'POST',
			     data : userId,
			     url : ctx+"/register/userIdCheck",
			     dataType : "json",
			     contentType: "application/json; charset=UTF-8",
			     success : function(response) {
			         if (response.check > 0) {		        	 
			        	 
			        	 $("#registerUserIdOk").attr('style', "display:none;");
			             $("#registerUserIdNo").attr('style', "display:inline;");
			             idck = 0;
			             
			         
			         } else {
			        	 
			        	 $("#registerUserIdNo").attr('style', "display:none;");
			             $("#registerUserIdOk").attr('style', "display:inline;");
			        	 
			             //아이디가 중복하지 않으면  idck = 1 
			             idck = 1;
			             
			         }
			     },
			     error : function(error) {
			    	 $("#registerUserIdNo").attr('style', "display:none;");
			    	 $("#registerUserIdOk").attr('style', "display:none;");
			    	 idck = 0;
			     }
			 });	 
			}); 
		
	}

	//Email 중복 확인
	var emailck = 0;

	function userMailCheck(){
		
		$("#registerUserMail").on("propertychange change keyup paste input keydown", function() {
			
		 var userMail = $("#registerUserMail").val();
		 
		 $.ajax({
		     async: true,
		     type : 'POST',
		     data : userMail,
		     url : ctx+"/register/userMailCheck",
		     dataType : "json",
		     contentType: "application/json; charset=UTF-8",
		     success : function(response) {
		         if (response.check > 0) {		        	 
		        	 
		        	 emailck = 0;
		             $("#registerUserMailNo").attr('style', "display:inline;");
		             
		         
		         } else {
		        	 
		        	 $("#registerUserMailNo").attr('style', "display:none;");
		             emailck = 1;
		             
		         }
		     },
		     error : function(error) {
		    	 
		    	 emailck = 0;
		    	 $("#registerUserMailNo").attr('style', "display:none;");
	             
		     }
		 });	 
		}); 

	}

	var confirmPassWord = 0;
	//동일 비밀번호 입력 확인
	function checkPassword(){
		
		  var pw1 = $("#registerUserPw").val();
		  var pw2 = $("#registerUserCheckPw").val();
		  if(pw1!=pw2){
			  confirmPassWord = 0;
			  $("#registerUserCheckPwNo").attr('style', "display:inline;");
		  }else{
			  confirmPassWord = 1;
		  }
		  
		  $("#registerUserCheckPw").on("propertychange change keyup paste input keydown", function() {
			  $("#registerUserCheckPwNo").attr('style', "display:none;");
		  });
		  
	}

	
	
	
	
    
    
    

    // Public Functions
    return {
        // public functions
        init: function() {
            handleFormSwitch();
            handleSignInFormSubmit();
            handleSignUpFormSubmit();
            handleForgotFormSubmit();  
            loginCheck();
            userIdCheck();
        	userMailCheck();
            
        }
    };
}();





// Class Initialization
jQuery(document).ready(function() {
	
    KTLoginGeneral.init();
});







