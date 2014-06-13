function loadMainContainer(type, selOpt) {
		resetSubMenuSelection(); 	
		$(selOpt).addClass('active');
		
		if (type == "jobsPage") {
			$('#theExchange').attr('class', 'active');
			$.ajax({
				url : 'jobExachangeLoad?moduleId=5',
				type : 'GET',
				success : function(data) {
					/* document.getElementById("myProfileDiv").innerHTML = data; */
					$('#mainContainer').html(data);
					//alert(data);
				},
				error : function(xhr, ajaxOptions, thrownError) {
					//alert(xhr.responseText);
					//alert(thrownError);
				}
			});
		} else {
			$.ajax({
				url : "/MediaLounge/getMainContainer",
				type : 'GET',
				data : {
					type : type
				},
				success : function(response) {
					//alert(response)
					document.getElementById("mainContainer").innerHTML = response;
					if(type == "inMix"){
						moveImage();
					}
					/*if(type == "rss"){
						moveSpotLight();
					}*/
				},
				error : function() {
					genericException();
				}
			});
		}

	}
function resetSubMenuSelection() {
	$('.subMenu > li').each(function(i, items_list){
        $(items_list).find('a').each(function(j, li){
            $(this).removeClass('active');	            
        });
    });		
}

/* Checking the session of the user at the time of loading the page.
   In case the  session expired, this function invokes the logoutuser method
   which redirects to login page of the application.
   This method is invoked in the onload of the new home page.
*/
function checkSession(userId) {
	//alert(userId)
	if(userId == '0') {
		logoutUser();
	} else {
		/* userMessageCount(userId); */
		//loadThisUser(userId);
		chatUserBuzz();
		
	}
}

/* Log out the current user and navigate to login page  */
function logoutUser() {
	//$.cookie('reevoUserEmail','');
	//$.cookie('JSESSIONID',null);
	//$.removeCookie('JSESSIONID', { path: '/' });
	
	window.location.href = "logoutUser";
} 

/*Displays the form for uploading files into the application*/   		
function mediasUploadFiles(obj, msg) {
	if (obj == 'first') {
		$('#statusInformation').html("");
	}

	$.ajax({
		url : 'getListOfKeys?moduleId=3',
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			$('#mainContainer').html(data);
			if (obj == 'second') {
				$('#uploadMsg').html("Successfully Updated");
			}			
		},
		error : function(xhr, ajaxOptions, thrownError) {
			genericException();
		}
	});

}	
/*	Uploads files into the application. 
 * Displays a success/error message on uploading the file. 
 * The function invokes uploadListMyFeed method to update the uploaded file
 *  in My feed, Mega Feed and Social Feed.Invokes newFMFRefresh to update the uploaded file in FMF section 
*/	
//using FormData() object
function mediaNameValidation() {
	var mediaName = $.trim($('#mediaName').val());
	if (mediaName == "") {
		$('#mediaNameErrorMsg').html('Please enter media name.');
		//$("#mediaName").val('');
		return false;
	} else {
		$('#mediaNameErrorMsg').html('');
	}
	
	//alert(/^[a-zA-Z0-9-_]*$/.test(mediaName));
	if(/^[a-zA-Z0-9-_ ]*$/.test(mediaName) == false) {
		$('#mediaNameErrorMsg').html('Special characters is not allowed.');
		//$("#mediaName").val('');
		return false;
	} else {
		$('#mediaNameErrorMsg').html('');
	}
	
	if(mediaName.length > 30) {
		$('#mediaNameErrorMsg').html('Max 30 characters allowed');
		//$("#mediaName").val('');
		return false;
	} else {
		$('#mediaNameErrorMsg').html('');
	}
}

function mediaKeyValidation() {
	var mediaSearchKey = $.trim($('#mediaSearchKey').val());
	
	if (mediaSearchKey == "") {
		$('#mediaKeyErrorMsg').html('Please enter key');
		return false;
	} else {
		$('#mediaKeyErrorMsg').html('');
	}
	
	if(/^[a-zA-Z0-9-_, ]*$/.test(mediaSearchKey) == false) {
		$('#mediaKeyErrorMsg').html('Special characters is not allowed.');
		//$("#mediaSearchKey").val('');
		return false;
	} else {
		$('#mediaKeyErrorMsg').html('');
	}
	
	if (mediaSearchKey.length > 20 ) {
		$('#mediaKeyErrorMsg').html('Max 20 characters allowed');
		//$("#mediaSearchKey").val('');
		return false;
	} else {
		$('#mediaKeyErrorMsg').html('');
	}
	
}

function mediaCommentsValidation() {
	if (mediaComments.length > 400 ) {
		$('#mediaCommentsErrorMsg').html('Max 400 characters allowed');
		//$("#mediaComments").val('');
		return false;
	} else {
		$('#mediaCommentsErrorMsg').html('');
	}
}

function uploadFormData() {
	var mediaName = $.trim($('#mediaName').val());
	var oMyForm = new FormData();
	oMyForm.append("file", mediaFile.files[0]);
	var mediaSearchKey = $.trim($('#mediaSearchKey').val());// $('#mediaSearchKey').val();
	var mediaComments = $('#mediaComments').val();
	var mediaFmf = $('#mediaFmf').is(':checked');// $('#mediaFmf').val();
	
	if (mediaName == "") {
		$('#mediaNameErrorMsg').html('Please enter media name.');
		$("#mediaName").val('');
		return false;
	} else {
		$('#mediaNameErrorMsg').html('');
	}
	
	//alert(/^[a-zA-Z0-9-_]*$/.test(mediaName));
	if(/^[a-zA-Z0-9-_ ]*$/.test(mediaName) == false) {
		$('#mediaNameErrorMsg').html('Special characters is not allowed.');
		$("#mediaName").val('');
		return false;
	} else {
		$('#mediaNameErrorMsg').html('');
	}
	
	if(mediaName.length > 30) {
		$('#mediaNameErrorMsg').html('Max 30 characters allowed');
		$("#mediaName").val('');
		return false;
	} else {
		$('#mediaNameErrorMsg').html('');
	}
	
	if ($.trim($('#mediaFile').val()) == "") {
		$('#mediaFileErrorMsg').html('Please upload file');
		return false;
	} else {
		$('#mediaFileErrorMsg').html('');
	}
	var filename = $.trim($('#mediaFile').val());
	var fileExtension = $.trim(filename.replace(/^.*\./, '').toLowerCase());
	// alert(fileExtension);
	// for image, audio, video
	
	if (fileExtension != "pjpeg" && fileExtension != "jpeg" && fileExtension != "jpg"
			&& fileExtension != "gif" && fileExtension != "png"
			&& fileExtension != "tiff" && fileExtension != "svg+xml"
			&& fileExtension != "mpeg" && fileExtension != "mp3"
			&& fileExtension != "basic" && fileExtension != "L24"
			&& fileExtension != "vorbis"
			&& fileExtension != "vnd.rn-realaudio"
			&& fileExtension != "vnd.wave" && fileExtension != "webm"
			&& fileExtension != "x-ms-wmv" && fileExtension != "wmv" && fileExtension != "mpeg"
			&& fileExtension != "mp4" && fileExtension != "ogg"
			&& fileExtension != "quicktime" && fileExtension != "webm"
			&& fileExtension != "vnd.wave" && fileExtension != "x-matroska"
			&& fileExtension != "x-flv" && fileExtension != "flv") {
		$('#mediaFileErrorMsg').html('We can able to upload following format only.<br><span>pjpeg / jpg / jpeg / gif / png / tiff /s vg+xml / mpeg / mp3 / basic / L24 / vorbis / vnd.rn-realaudio / vnd.wave / webm / x-ms-wmv / mp4 / ogg / quicktime / webm / vnd.wave / x-matroska / x-flv / flv </span>');
		return false;
	} else {
		$('#mediaFileErrorMsg').html('');
	}
	
	if (mediaSearchKey == "") {
		$('#mediaKeyErrorMsg').html('Please enter key');
		return false;
	} else {
		$('#mediaKeyErrorMsg').html('');
	}
	
	if(/^[a-zA-Z0-9-_, ]*$/.test(mediaSearchKey) == false) {
		$('#mediaKeyErrorMsg').html('Special characters is not allowed.');
		$("#mediaSearchKey").val('');
		return false;
	} else {
		$('#mediaKeyErrorMsg').html('');
	}
	
	if (mediaSearchKey.length > 20 ) {
		$('#mediaKeyErrorMsg').html('Max 20 characters allowed');
		$("#mediaSearchKey").val('');
		return false;
	} else {
		$('#mediaKeyErrorMsg').html('');
	}
	
	if (mediaComments.length > 400 ) {
		$('#mediaCommentsErrorMsg').html('Max 400 characters allowed');
		//$("#mediaComments").val('');
		return false;
	} else {
		$('#mediaCommentsErrorMsg').html('');
	}
	
	
	document.getElementById("showSpanId").style.display = "block";
	$( "#uploadBtn" ).prop( "disabled", true );
	$.ajax({
		url : 'saveMedia?type=MyFeed&media_name=' + mediaName
				+ '&media_comments=' + mediaComments + '&media_search_key='
				+ mediaSearchKey + '&media_fmf=' + mediaFmf,
		data : oMyForm,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			document.getElementById("showSpanId").style.display = "none";
			$( "#uploadBtn" ).prop( "disabled", false );
			$('#uploadMsg').html("Successfully Updated");
			$("#mediaName").val('');
			$("#mediaFile").val('');
			$("#mediaSearchKey").val('');
			$("#mediaComments").val('');
			$("#mediaKeySelectedValue").val('');
			if(mediaFmf) {
				newFMFRefresh();
				//$("#mediaFmf").attr('checked', false); 
			}
			
			$("#mediaView").html(data);

			// after save need to reload and get key list
			mediasUploadFiles('second', data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			// alert(xhr.responseText);
			// alert(thrownError);
			//logoutUser();
			//alert('error need to redirect to login page');
			document.getElementById("showSpanId").style.display = "none";
			genericException();
			//logoutUser();
		}
	});
}

function genericException() {
	window.location.href = "genericException"; 
}
/*
 * The function invokes uploadListMyFeed method to update the uploaded file
 *  in My feed, Mega Feed and Social Feed
 */
function uploadListMyFeed() {
	$.post("listOfMedias?type=myFeed", function(data, status) {
		$("#mediaView").html(data);
	});
}
/*
 * This function is invoked by uploadListMyFeed method  to update the uploaded file in FMF section 
 */		
function newFMFRefresh() {
	$.post("listOfMediasFMF", function(data, status) {
		$("#mediaFMFView").html(data);
	});
}
// while using dropdown key the value is set to mediaSearch key value
function setValueToMediaKey() {
	var selectedValue = document.getElementById("mediaKeySelectedValue").value;
	if(selectedValue == "") {
		document.getElementById("mediaSearchKey").value = "";
	} else {
		keyValue = document.getElementById("mediaSearchKey").value;
	} 
	var key = document.getElementById("mediaSearchKey").value;
	if(key == "") {
		keyValue = selectedValue;
	} else {
		keyValue = keyValue +', '+selectedValue;
	}
	document.getElementById("mediaSearchKey").value = keyValue;
}		
/*
 * Display corresponding Feed Details by default My feed will be loaded. 
 */		
$(document).ready(function() {
	$('#showContacts').click(function(event) {
		//alert($("#profileDivUserId").val());
		$.ajax({
			url : 'getContactList?moduleId=1&userId='+ $("#profileDivUserId").val(),
			type : 'GET',
			success : function(data) {
				$('#mainContainer').html(data);
			},
			error : function(xhr, ajaxOptions,thrownError) {
				//alert(xhr.responseText);
				//alert(thrownError);
				genericException();
			}
	}); 
});
			
var maxLen = 420;
$('#newPost').keypress(function(event){
    var Length = $("#newPost").val().length;
    var AmountLeft = maxLen - Length;
    //$('#txt-length-left').html(AmountLeft);
    if(Length >= maxLen){
        if (event.which != 8) {
            return false;
        }
    }
});
			
			
			
			$(".myFeeds img").click(
					function(e) {
						var mediaKey = $('#mediaKey').val();
						var type = $(this).attr('id');
						e.preventDefault();
						// if search data is availabe
						if ($.trim($('#mediaKey').val()) != "") {
							if(type == 'myFeedClick') {
								type = 'myFeed';
								
								document.getElementById("myFeed").style.display = "";
								document.getElementById("myFeedClick").style.display = "none";
								document.getElementById("myFeedName").style.display = "";
								
								document.getElementById("megaFeed").style.display = "none";
								document.getElementById("megaFeedClick").style.display = "";
								document.getElementById("megaFeedName").style.display = "none";
								
								document.getElementById("socialFeed").style.display = "none";
								document.getElementById("socialFeedClick").style.display = "";
								document.getElementById("socialFeedName").style.display = "none";
							}
							if(type == 'megaFeedClick') {
								type = 'megaFeed';
								
								document.getElementById("megaFeed").style.display = "";
								document.getElementById("megaFeedClick").style.display = "none";
								document.getElementById("myFeedName").style.display = "none";
								
								document.getElementById("myFeed").style.display = "none";
								document.getElementById("myFeedClick").style.display = "";
								document.getElementById("megaFeedName").style.display = "";
								
								document.getElementById("socialFeed").style.display = "none";
								document.getElementById("socialFeedClick").style.display = "";
								document.getElementById("socialFeedName").style.display = "none";
							}
							if(type == 'socialFeedClick') {
								type = 'socialFeed';
								
								document.getElementById("socialFeed").style.display = "";
								document.getElementById("socialFeedClick").style.display = "none";
								document.getElementById("myFeedName").style.display = "none";
								
								document.getElementById("myFeed").style.display = "none";
								document.getElementById("myFeedClick").style.display = "";
								document.getElementById("megaFeedName").style.display = "none";
								
								document.getElementById("megaFeed").style.display = "none";
								document.getElementById("megaFeedClick").style.display = "";
								document.getElementById("socialFeedName").style.display = "";
							}
							$.post('searchBasedOnMediaType?type=' + type
									+ '&media_key=' + mediaKey, function(
									data, status) {
								$("#mediaView").html(data);
								$("#mediaKey").val('');
							})
							.fail(function() {
								genericException();
							});
						} else {
							// if directly you click myfeed or megafeed or socialfeed
							if (type == 'myFeed' || type == 'myFeedClick') { 
							//	alert('myFeed');
								$.post("listOfMedias?type=myFeed&moduleId=3",
								function(data, status) {
									document.getElementById("myFeed").style.display = "";
									document.getElementById("myFeedClick").style.display = "none";
									document.getElementById("myFeedName").style.display = "";
									
									document.getElementById("megaFeed").style.display = "none";
									document.getElementById("megaFeedClick").style.display = "";
									document.getElementById("megaFeedName").style.display = "none";
									
									document.getElementById("socialFeed").style.display = "none";
									document.getElementById("socialFeedClick").style.display = "";
									document.getElementById("socialFeedName").style.display = "none";
									//alert()
									$("#mediaView").html(data);
									//newFMF();
								});
							}
							if (type == 'megaFeed' || type == 'megaFeedClick') {
							//	alert('megaFeed');
								$.post("listOfMedias?type=megaFeed&moduleId=3",
								function(data, status) {
									document.getElementById("megaFeed").style.display = "";
									document.getElementById("megaFeedClick").style.display = "none";
									document.getElementById("myFeedName").style.display = "none";
									
									document.getElementById("myFeed").style.display = "none";
									document.getElementById("myFeedClick").style.display = "";
									document.getElementById("megaFeedName").style.display = "";
									
									document.getElementById("socialFeed").style.display = "none";
									document.getElementById("socialFeedClick").style.display = "";
									document.getElementById("socialFeedName").style.display = "none";
									$("#mediaView").html(data);
									//newFMF();
								});
							}
							if (type == 'socialFeed' || type == 'socialFeedClick') {
							//	alert('socialFeed');
								$.post("listOfMedias?type=socialFeed&moduleId=3",
								function(data, status) {
									document.getElementById("socialFeed").style.display = "";
									document.getElementById("socialFeedClick").style.display = "none";
									document.getElementById("myFeedName").style.display = "none";
									
									document.getElementById("myFeed").style.display = "none";
									document.getElementById("myFeedClick").style.display = "";
									document.getElementById("megaFeedName").style.display = "none";
									
									document.getElementById("megaFeed").style.display = "none";
									document.getElementById("megaFeedClick").style.display = "";
									document.getElementById("socialFeedName").style.display = "";
									$("#mediaView").html(data);
									//newFMF();
								});
							}
						}
					});
			
			
			
			(function($) {
			    $.timer = function(func, time, autostart) {
			        this.set = function(func, time, autostart) {
			            this.init = true;
			            if(typeof func == 'object') {
			                var paramList = ['autostart', 'time'];
			                for(var arg in paramList) {if(func[paramList[arg]] != undefined) {eval(paramList[arg] + " = func[paramList[arg]]");}};
			                func = func.action;
			            }
			            if(typeof func == 'function') {this.action = func;}
			            if(!isNaN(time)) {this.intervalTime = time;}
			            if(autostart && !this.isActive) {
			                this.isActive = true;
			                this.setTimer();
			            }
			            return this;
			        };
			        this.once = function(time) {
			            var timer = this;
			            if(isNaN(time)) {time = 0;}
			            window.setTimeout(function() {timer.action();}, time);
			            return this;
			        };
			        this.play = function(reset) {
			            if(!this.isActive) {
			                if(reset) {this.setTimer();}
			                else {this.setTimer(this.remaining);}
			                this.isActive = true;
			            }
			            return this;
			        };
			        this.pause = function() {
			            if(this.isActive) {
			                this.isActive = false;
			                this.remaining -= new Date() - this.last;
			                this.clearTimer();
			            }
			            return this;
			        };
			        this.stop = function() {
			            this.isActive = false;
			            this.remaining = this.intervalTime;
			            this.clearTimer();
			            return this;
			        };
			        this.toggle = function(reset) {
			            if(this.isActive) {this.pause();}
			            else if(reset) {this.play(true);}
			            else {this.play();}
			            return this;
			        };
			        this.reset = function() {
			            this.isActive = false;
			            this.play(true);
			            return this;
			        };
			        this.clearTimer = function() {
			            window.clearTimeout(this.timeoutObject);
			        };
			        this.setTimer = function(time) {
			            var timer = this;
			            if(typeof this.action != 'function') {return;}
			            if(isNaN(time)) {time = this.intervalTime;}
			            this.remaining = time;
			            this.last = new Date();
			            this.clearTimer();
			            this.timeoutObject = window.setTimeout(function() {timer.go();}, time);
			        };
			        this.go = function() {
			            if(this.isActive) {
			                this.action();
			                this.setTimer();
			            }
			        };

			        if(this.init) {
			            return new $.timer(func, time, autostart);
			        } else {
			            this.set(func, time, autostart);
			            return this;
			        }
			    };
			})(jQuery);
		});
/*
 * The function display list of archive files 
 */		
function archiveUserMedia() {
	$.ajax({
		url : 'listOfArchiveMedia?type=archive',
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			genericException();
		}
	});
}
/*
 * FMF Activation from Archive
 */		
function fmfActive(id) {
	$.post("fmfActivation?type=archive&media_id="+id, function(data, status) {
		$("#mediaFMFView").html(data);
	})
	.fail(function() {
		genericException();
	});
}
/*
 * View Imgages
 */
function mediasViewPopUp(contentType, contentPath,mediaId) {
	$.ajax({
		url : 'mediasViewInPopup?content_type=' + contentType + '&mediaId=' + mediaId
				+ '&content_path=' + contentPath,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			$('#innerViewMedia').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			//alert(xhr.responseText);
			//alert(thrownError);
			genericException();
		}
	});
}
/*
 * FMF Slider functionality
 */
var fmfSlider = new (function() {
    var $galleryImages, // An array of image elements
            $timeRemaining, // Usually hidden element to display time when paused
            imageId = 0, // Which image is being shown
            incrementTime = 300000,
            updateTimer = function() {
                $galleryImages.eq(imageId).stop(true,true).fadeOut(0);
                imageId++;
                if (imageId > $galleryImages.length -1) {
                    imageId = 0;
                }
                $galleryImages.eq(imageId).stop(true,false).fadeIn(0);
            },
            init = function() {
            	//alert("init function");
                $galleryImages = $('.galleryImages div.div-object');
                $timeRemaining = $('#timeRemaining');
                fmfSlider.Timer = $.timer(updateTimer, incrementTime, true).once();
            };
    	this.toggleGallery = function() {
        if (this.Timer.isActive) {
            this.Timer.pause();
            var remaining = this.Timer.remaining / 1000;
            $timeRemaining.html(remaining + " seconds remaining.");
        }
        else {
            this.Timer.play();
            $timeRemaining.html("<br/>");
        }
    };
    this.setInit = function(){
    	//fmfSlider.init();
    	//alert("O I am here");
    	$(init);
    };
   // $(init);
});
/*
 * This function displays the feedback forum form. The user clicks the keyword and gives the feedback
 * On clicking the submit button the feedback data is inserted into database.
 */		
function displayFeedBackBox(mediaId){
	 $.ajax({
	    url: 'mediaFeedBackHome',
	    type: 'POST',
	    data : {
			'mediaId' : mediaId
		},
	    success: function(data){
	    	//alert("data ==> " + data);
	    	$('#feedBackTable').html(data);
	    	//alert(data);
	    },
	    error: function (xhr, ajaxOptions, thrownError) {
	       // alert(xhr.responseText);
	       // alert(thrownError);
	    	genericException();
	      }
	  });
 }
/*
 * This function displays the chat option for the particular user.
 */		
function displayChatBox(){
	$('#chatSpecificUserName').html($("#myFirstName").val() + ""+$("#myLastName").val());
	$("#chatUserId").val(-1);
	if( "${sessionScope.userDto.contentPath}" == "" ){
		 $("#chatUserPhoto").attr('src',"/MediaLounge/resources/dummy/dummy.jpg");
	}else{
		$("#chatUserPhoto").attr('src','<c:url value="${sessionScope.userDto.contentPath}" />');	
	}
	 $.ajax({
	    url: 'userChatHome?moduleId=9',
	    type: 'POST',
	    data : {
			'chatUserId' : -1
		},
	    success: function(data){
	       //$('#chatsTable').html(data);
	       	$('#userMessagesId').css('display','none');
	    	$('#mainContainer').html(data);
	    },
	    error: function (xhr, ajaxOptions, thrownError) {
	       // alert(xhr.responseText);
	      //  alert(thrownError);
	    	genericException();
	      }
	  });  
}
/*
 * To show the update status form for new post or status
 */		
function updateStatusForm(loginUser){
	var userId = $('#profileDivUserId').val();
	 if(userId != loginUser){
		 
	 }else{
		 $("#newStatusForm").toggle();
	 }
}
/*
 * Saves the new Status and update the status in the UI.
 */		

/*function saveStatus(loginUser) {
	var status = $("#newPost").val();
	if (status.trim() == "") {
		status="No Status";
		
		$('#errorMsgStatus').html("Should not Empty !!.");
	}  
	if (status.length > 420 ) {
			$('#errorMsgStatus').html("Status is too long..");
			document.getElementById("newPost").focus();
	}else{
		$.ajax({
			url : "/MediaLounge/saveStatus?moduleId=2",
			type : 'GET',
			data : {
				loginUser : loginUser,
				status : status
			},
			success : function(response) {
				 $("#newStatusForm").css("display","none");
				 $("#statusMessage").html(status);
				 
				 $('#newPost').val('').empty();
			},
			error : function() {
				
			}
		});
	}
	
}		*/


 function saveStatus(loginUser) {
	
	var status = $("#newPost").val();
	if (status.trim() == "") {
		/*status = "No Status";*/
		$('#errorMsgStatus').html("Should not Empty !!.");
		document.getElementById("newPost").focus();
	}
	else if (status.length > 420) {
		$('#errorMsgStatus').html("Status is too long..");
		document.getElementById("newPost").focus();
	} else {
		$.ajax({
			url : "/MediaLounge/saveStatus?moduleId=2",
			type : 'GET',
			data : {
				loginUser : loginUser,
				status : status
			},
			success : function(response) {
				$("#newStatusForm").css("display", "none");
				$("#statusMessage").html(status);
				$('#newPost').val('').empty();
			},
			error : function() {
				genericException();
			}
		});
	}
	
}


/*
 * The function is invoked on load of home page. 
 * It will display the  chat buzz for the logged in user if any 
 */		
function chatUserBuzz(){
	 $.ajax({
		url : 'getTotalUnreadChatMessageCount',
		type : 'GET',
		success : function(data) {
			if(data > 0){
				$('#userMessagesId').html(data);
				$('#userMessagesId').css('display','block');
			}
		},
		error : function(xhr, ajaxOptions,thrownError) {
			genericException();
		}
	});
}
/*
 * loadThisUserProfile
 */		
function loadThisUserProfile() {
	if($('#profileDivUserId').val() == $('#myUserId').val()){
		$('#profileLinks').css("display","block");
		try {
			  $('.nano').nanoScroller();
		} catch(err) {}
		showMyProfile();
		
	}else{
		$.post("getUserProfileInfo?moduleId=2&aboutUserId="+$('#profileDivUserId').val(), function(data, status) {
			$("#mainContainer").html(data);
		});
	}
	/*if(aboutStatus == 't'){
		$.post("getUserProfileInfo?moduleId=2&aboutUserId="+aboutUserId, function(data, status) {
			document.getElementById("mainContainer").innerHTML = data;
		});
	}else{
		document.getElementById("profileDiv").style.display = "block";
		showMyProfile();
	}	*/
}
/*
 *  Load the logged in user profile in the centre part
 */		
function showMyProfile() {
	$.post("getMyProfilePage?moduleId=2", function(data, status) {
		
		document.getElementById("mainContainer").innerHTML = data;
		//alert($("#profileDivUserId").val());
		if($("#profileDivUserId").val() != $("#myUserId").val()){
			//alert("not equal");
			$("#profileUserPic").attr("src",$("#myPhoto").val());
			$("#profileDivUserId").val($("#myUserId").val()); 
			$("#profileDivNickName").html($("#myNicktName").val());
			$("#profileDivUserName").html($("#myFirstName").val() + " " + ($("#myLastName").val()));
			$("#profileDivUserLocation").html(($("#mylocation").val()));
			$('#profileLinks').css("display","block");
		}else{
			//alert("equal");
			$('#profileLinks').css("display","block");
		}
		try {
			  $('.nano').nanoScroller();
		} catch(err) {}
		/*$("#profileDivUserId").val($("#loadUserId_"+index).val())
		$("#profileUserPic").attr("src",$("#loadUserContenPath_"+index).attr("src"));
		$("#profileDivNickName").html($("#loadUserNickName_"+index).val());
		$("#profileDivUserName").html($("#loadUserFirstName_"+index).html() + " " + $("#loadUserLastName_"+index).val());
		$("#profileDivUserLocation").html($("#loadUserLocation_"+index).html());
		$('#profileLinks').css("display","block");*/
	})
	.fail(function() {
		genericException();
	});
}
/*
 * Edit the logged in user profile.
 */		
function editMyProfile(){
	 $("#showProfile").hide();
	 $("#showEditProfile").show();
}
/*
 * Cancel the edit user profile
 */		
function viewMyProfile(){
	$("#showProfile").show();
	 $("#showEditProfile").hide();
}
		
/*
 *  Save the changes made in myprofile
 */		
function updateMyProfile(){
	
	var fName = $("#firstName").val();
	var lName = $("#lastName").val();
	var phone = $("#phone").val();
	var country = $("#country").val();
	var email = $("#emailId").val();
	var zipcode = $("#zipcode").val();
	var latitude = $("#latitude").val();
	var longitude = $("#longitude").val();
	var nickName = $("#nickName").val();
	var role = $("#role").val();
	var genre = $("#genre").val();
	var status = $("#statusID").val();
	var photo = $("#photoID").val();
	
	if(phone.trim() == ""){
		phone = 0;
		/*$('#telephone').html('Enter Phone No.');
		return false;*/
	} else {
		$('#telephone').html('');
	}
	
	if(/^[0-9 ]*$/.test(phone) == false) {
		$('#telephone').html('Enter Only Numeric Value');
		return false;
	} else {
		$('#telephone').html('');
	}
	if(/^[a-zA-Z0-9-_, ]*$/.test(nickName) == false) {
		$('#nickNameError').html('Special chars not allowed.');
		return false;
	} else {
		$('#nickNameError').html('');
	}
	if(/^[a-zA-Z0-9, ]*$/.test(zipcode) == false) {
		$('#zip').html('Special chars not allowed.');
		return false;
	} else {
		$('#zip').html('');
	}
	if(/^[a-zA-Z0-9-_, ]*$/.test(role) == false) {
		$('#roleError').html('Special chars not allowed.');
		return false;
	} else {
		$('#roleError').html('');
	}
	if(/^[a-zA-Z0-9-_, ]*$/.test(genre) == false) {
		$('#genreError').html('Special chars not allowed.');
		return false;
	} else {
		$('#genreError').html('');
	}
	$.ajax({
		url : "/MediaLounge/updateMyProfile",
		type : 'GET',
		data : {
			firstName : fName,lastName : lName,phone : phone,country : country,email : email,zipcode : zipcode,latitude : latitude,longitude : longitude,nickName : nickName,genre : genre,role : role,
			status : status,photo : photo
		},
		success : function(response) {
			document.getElementById("mainContainer").innerHTML = response;
			//$("#profileDivUserLocation").html($("#country").val());
			$("#mainContainer").html(response);
			if(nickName.trim() == ""){
				$("#profileDivNickName").html(fName);
			}else{
				$("#profileDivNickName").html($("#nickName").val());
			}
			//$("#profileDivNickName").html($("#nickName").val());
			$("#profileDivUserName").html($("#firstName").val() + " "+ $("#lastName").val());
			$("#profileDivUserLocation").html(country);
		},
		error : function() {
			genericException();
		}
	}); 
}
/*
 * Search User with name, email 
 */		
function showUsersMiniProfile() {
	var searchItem = document.getElementById("searchItem").value;
		var flag = false;
		if(searchItem == "" || searchItem.trim() == ""){
			//alert("Search Cannot be Empty!");
			return false;
		}else{
			/*if((searchItem == "dj") || (searchItem == "DJ")){
			 	flag = true;
			}else if((searchItem == "vs") || (searchItem == "VS")){
				flag = true;
			}else if((searchItem == "anchor") || (searchItem == "Anchor") || (searchItem == "ANCHOR")){
				flag = true;
			}else if((searchItem == "journalist") || (searchItem == "Journalist") || (searchItem == "JOURNALIST")){
				flag = true;
			}*/
			if((searchItem.toUpperCase() == "PAO")){
				searchItem = "DJ";
			 	flag = true;
			}else if((searchItem.toUpperCase() == "AIR PLAY")){
				searchItem = "VS";
				flag = true;
			}else if((searchItem.toUpperCase() == "IMC")){
				searchItem = "ANCHOR";
				flag = true;
			}else if((searchItem.toUpperCase() == "LAIF")){
				searchItem = "JOURNALIST";
				flag = true;
			}
		}
	if(flag){
		$.post("showUsersMiniProfile?user="+searchItem+"&moduleId=2", function(data, status) {
			$('#mainContainer').html(data);
		})
		.fail(function() {
			genericException();
		});
	}else{
		//alert("Please enter proper users to search \n\n ( dj, vs, anchor, journalist )");
		$.post("showUsersMiniProfile?user="+searchItem+"&moduleId=2&emailFname=1", function(data, status) {
			$('#mainContainer').html(data);
		})
		.fail(function() {
			genericException();
		});
	}
}
/*
 * 	Load the user with the given id. Used in search functionality
 */		
function loadThisUser(index) {
	$("#newStatusForm").hide();
	$("#profileDivUserId").val($("#loadUserId_"+index).val())
	$("#profileUserPic").attr("src",$("#loadUserContenPath_"+index).attr("src"));
	 if($.trim($("#loadUserNickName_"+index).val()) == ""){
		 $("#profileDivNickName").html($("#loadUserFirstName_"+index).html());
	 }else{
		 $("#profileDivNickName").html($("#loadUserNickName_"+index).val());
	 }
	$("#profileDivUserName").html($("#loadUserFirstName_"+index).html() + " " + $("#loadUserLastName_"+index).val());
	$("#profileDivUserLocation").html($("#loadUserLocation_"+index).html());
	if($.trim($("#loadUserStatusMessage_"+index).val()) == ""){
		 $("#statusMessage").html("No Staus Message")
	}else{
		$("#statusMessage").html($("#loadUserStatusMessage_"+index).val());
	}
	/*loadUserId_
	statusMessage*/
	$('#profileLinks').css("display","block");
	try {
		  $('.nano').nanoScroller();	
	} catch(err) {}
}

function blossomSuggestion() {
	$.ajax({
		url : "/MediaLounge/blossomSuggestion",
		type : 'GET',
		data : {
		},
		success : function(response) {
			/*document.getElementById("mainContainer").innerHTML = response;*/
			$('#mainContainer').html(response);
			$('#sentBlossom').css({'background-color' : '#3276B1'});
		},
		error : function() {
			//alert("error");
			genericException();

		}
	});
}

function newBlossom(){
	$('#newBlossom').show();
	$('#previousReview').hide();
	$('#pendingReview').hide();
	$('#receivedReview').hide();
	//color for selcted and deselected buttons
	$('#sentBlossom').css({'background-color' : '#00AFEC'});
	$('#newBlossomButton').css({'background-color' : '#3276B1'});
	$('#pendingBlossom').css({'background-color' : '#00AFEC'});
	$('#receivedBlossom').css({'background-color' : '#00AFEC'});
}

function pendingBlossom(){
	$('#newBlossom').hide();
	$('#previousReview').hide();
	$('#pendingReview').show();
	$('#receivedReview').hide();
	//color for selcted and deselected buttons
	$('#sentBlossom').css({'background-color' : '#00AFEC'});
	$('#newBlossomButton').css({'background-color' : '#00AFEC'});
	$('#pendingBlossom').css({'background-color' : '#3276B1'});
	$('#receivedBlossom').css({'background-color' : '#00AFEC'});
}

function receivedBlossom(){
	$('#newBlossom').hide();
	$('#previousReview').hide();
	$('#pendingReview').hide();
	$('#receivedReview').show();
	//color for selcted and deselected buttons
	$('#sentBlossom').css({'background-color' : '#00AFEC'});
	$('#newBlossomButton').css({'background-color' : '#00AFEC'});
	$('#pendingBlossom').css({'background-color' : '#00AFEC'});
	$('#receivedBlossom').css({'background-color' : '#3276B1'});
}

/*function saveRecords() {
	var userType = $('#userType').val();
	var listUser = $('#listUsers').val();
	var comments = $('#userComments').val();
	var title = $('#userTitle').val();
	var mediaId = $('#mediaName').val();
		$('#errorExpertType').html("");
		$('#errorExpertName').html("");
		$('#errorTitle').html("");
		return false;
	}
	if (userType == null || userType == "") {
		$('#errorMediaName').html("");
		$('#errorExpertType').html("Select User type");
		$('#errorExpertName').html("");
		$('#errorTitle').html("");
		return false;
	}
	if (listUser == null || listUser == "") {
		$('#errorMediaName').html("");
		$('#errorExpertType').html("");
		$('#errorExpertName').html("Select Expert");
		$('#errorTitle').html("");
		return false;
	}
	if (title == null || title.trim() == "") {
		$('#errorMediaName').html("");
		$('#errorExpertType').html("");
		$('#errorExpertName').html("");
		$('#errorTitle').html("Enter Title");
		return false;
	}else {
		 $.post("saveUserComments?userType=" + userType + "&listUser="
				+ listUser + "&comments=" + comments + "&mediaId="
				+ mediaId+ "&title="+ title, function(data, status) {
			if (status == "success"){
				//alert("Saved successfully");
				blossomSuggestion();
			}
			else
				alert("Error in saving");
		});
	}
}*/

function friendListFav() {
	/*$.post("friendListFav", function(data, status) {
		$('#bumpArea').html(data);
	});*/
		$('#bumpArea').html("<span style= margin-left:210px; >" +
		"<img width=140px src=/MediaLounge/resources/images/loadingImageWithText.gif>"+"</span>");
		$.post( "friendListFav", function(data, status) {
			$('#bumpArea').html(data);
			$('#submitBump').css({'background-color' : '#3276B1'});
		})
		.fail(function() {
		  genericException();
		});
}

function loadUserType(value){
	if(value == null || value == ""){
		$('#errorExpertType').html("Select Expert Type");
		$('#loadUsersByType').html('');
		return false;
	}else{
		 $('#errorExpertType').html("");
		 $.post("getUserCategoryByType?userType="+value, function(data, status) {
			 $('#loadUsersByType').html(data);
		})
		.fail(function() {
			genericException();	
		});
	}
}

function suggestion(userId) {
	$.ajax({
		url : "/MediaLounge/suggestion",
		type : 'GET',
		data : {
			loginUser : userId
		},
		success : function(response) {
			//alert(response);
			//document.getElementById("mainContainer").innerHTML = response;
			$('#mainContainer').html(response);
		},
		error : function() {
			//alert("error");
			genericException();
		}
	});
}
	 
 function saveSuggestion(suggestionId,count) {
	var suggestionFeed = document.getElementById("expertReview"+count).value;
	var key = document.getElementById("key"+count).value;
	var publishMedia = $('#publish'+count).is(':checked');
	if(suggestionFeed.trim() == "" ){
		 document.getElementById("expertReview"+count).focus();
		 document.getElementById("inputSuggestion"+count).innerHTML = "Please Enter Suggestion";
	}
	else{
		$.ajax({
			url : "/MediaLounge/saveSuggestion",
			type : 'GET',
			data : {
				suggestionId : suggestionId,
				feedback : suggestionFeed,
				key_word : key,
				publish : publishMedia
			},
			success : function(response) {
				//alert(response);
				document.getElementById("expertReview"+count).value = "";
				suggestion($('#myUserId').val());
			},
			error : function() {
				genericException();
			}
		});
	}
} 
		 
function ignoreSuggestion(j, suggestionId) {
	$.ajax({
		url : "/MediaLounge/ignoreSuggestion",
		type : 'GET',
		data : {
			suggestionId : suggestionId
		},
		success : function(response) {
			//alert(response);
			suggestion($('#myUserId').val());
		},
		error : function() {
			genericException();
		}
	});
}

function reviewSuggestion(value){
	 $.post("reviewSuggestion?reviewId="+value, function(data, status) {
		 $('#mainContainer').html(data);
	 })
	 .fail(function() {
		genericException();
	 });
}

function viewReview(reviewId){
	$.post("viewReview?reviewId="+reviewId, function(data, status) {
		$('#mainContainer').html(data);
	})
	.fail(function() {
		genericException();
	});
}

function publishReview(reviewId){
	$.post("publishReview?reviewId="+reviewId, function(data, status) {
		blossomSuggestion();
	})
	.fail(function() {
		genericException();
	});
}

function moveSpotLight() {
	var a = $("#spotLightCount").text();
	if(2 > a){
	}else{
	var displaySpotLight = document.getElementById("displaySpotLight");
	 $(displaySpotLight).vTicker({
			speed : 400,
			pause : 10000,
			animation : 'fade',
			mousePause : true,
			showItems : 1,
		}); 
	}
}
var BottomCenter = new (function() {
    var $bottomAdvCenter, // An array of image elements
        $timeRemaining, // Usually hidden element to display time when paused
        imageId = 0, // Which image is being shown
        incrementTime = 10000,
        updateTimer = function() {
            $bottomAdvCenter.eq(imageId).stop(true,true).fadeOut(0);
            imageId++;
            if (imageId > $bottomAdvCenter.length-1) {
                imageId = 0;
            }
            $bottomAdvCenter.eq(imageId).stop(true,false).fadeIn(500);
        },
        init = function() {
            $bottomAdvCenter = $('.bottomAdvCenter img');
            $timeRemaining = $('#timeRemaining');
            BottomCenter.Timer = $.timer(updateTimer, incrementTime, true).once();
        };
    this.toggleGallery = function() {
        if (this.Timer.isActive) {
            this.Timer.pause();
            var remaining = this.Timer.remaining / 1000;
            $timeRemaining.html(remaining + " seconds remaining.");
        }
        else {
            this.Timer.play();
            $timeRemaining.html("<br/>");
        }
    };
    $(init);
});
		
 var BottomLeft = new (function() {
	    var $bottomAdvLeft, // An array of image elements
        $timeRemaining, // Usually hidden element to display time when paused
        imageId = 0, // Which image is being shown
        incrementTime = 10000,
        updateTimer = function() {
            $bottomAdvLeft.eq(imageId).stop(true,true).fadeOut(500);
            imageId++;
            if (imageId > $bottomAdvLeft.length-1) {
                imageId = 0;
            }
            $bottomAdvLeft.eq(imageId).stop(true,false).fadeIn(500);
        },
        init = function() {
            $bottomAdvLeft = $('.bottomAdvLeft img');
            $timeRemaining = $('#timeRemaining');
            BottomLeft.Timer = $.timer(updateTimer, incrementTime, true).once();
        };
    this.toggleGallery = function() {
        if (this.Timer.isActive) {
            this.Timer.pause();
            var remaining = this.Timer.remaining / 1000;
            $timeRemaining.html(remaining + " seconds remaining.");
        }
        else {
            this.Timer.play();
            $timeRemaining.html("<br/>");
        }
    };
    $(init);
});
		 
var whatAdContents = new (function() {
	    var $whatAdContent, // An array of image elements
        $timeRemaining, // Usually hidden element to display time when paused
        imageId = 0, // Which image is being shown
        incrementTime = 10000,
        updateTimer = function() {
            $whatAdContent.eq(imageId).stop(true,true).fadeOut(0);
            imageId++;
            if (imageId > $whatAdContent.length-1) {
                imageId = 0;
            }
            $whatAdContent.eq(imageId).stop(true,false).fadeIn(10);
        },
        init = function() {
            $whatAdContent = $('#whatsHappening img');
            $timeRemaining = $('#timeRemaining');
            whatAdContents.Timer = $.timer(updateTimer, incrementTime, true).once();
        };
    this.toggleGallery = function() {
        if (this.Timer.isActive) {
            this.Timer.pause();
            var remaining = this.Timer.remaining / 1000;
            $timeRemaining.html(remaining + " seconds remaining.");
        }
        else {
            this.Timer.play();
            $timeRemaining.html("<br/>");
        }
    };
    $(init);
}); 
		 


var highLightsAdContents = new (function() {
	var $highAdContent, // An array of image elements
	$timeRemaining, // Usually hidden element to display time when paused
	imageId = 0, // Which image is being shown
	incrementTime = 10000, updateTimer = function() {
		$highAdContent.eq(imageId).stop(true, true).fadeOut(0);
		imageId++;
		if (imageId > $highAdContent.length - 1) {
			imageId = 0;
		}
		$highAdContent.eq(imageId).stop(true, false).fadeIn(500);
	}, init = function() {
		$highAdContent = $('#highlightOfDay img');
		$timeRemaining = $('#timeRemaining');
		highLightsAdContents.Timer = $.timer(updateTimer, incrementTime, true)
				.once();
	};
	this.toggleGallery = function() {
		if (this.Timer.isActive) {
			this.Timer.pause();
			var remaining = this.Timer.remaining / 1000;
			$timeRemaining.html(remaining + " seconds remaining.");
		} else {
			this.Timer.play();
			$timeRemaining.html("<br/>");
		}
	};
	$(init);
});
 function updateRssLightBox(title,desc){
	$('#rssHeadingId').html(title);
	$('#rssDescriptionId').html(desc);
}

 // Anirudhha added

 function uploadUserPhoto() {
		var photoPath = document.getElementById("userPhoto").value;
		var fileExtension = $.trim(photoPath.replace(/^.*\./, '').toLowerCase());
		if(photoPath == ""){
			//alert("select a photo");
			$("#errorUploadingImage").html('Please Select an Image');
			return false;
		}else{
			$("#errorUploadingImage").html('');
			
		}
		if (fileExtension != "pjpeg" && fileExtension != "jpeg" && fileExtension != "jpg"
			&& fileExtension != "gif" && fileExtension != "png") {
		$('#errorUploadingImage').html('We can able to upload following format only.<br><span>pjpeg / jpg / jpeg / gif / png </span>');
		return false;
		} else {
			$('#errorUploadingImage').html('');
		}
		
		document.getElementById("showLoadingUserPic").style.display = "block";
		var oMyForm = new FormData();
		oMyForm.append("file", userPhoto.files[0]);
		$.ajax({
		    url: 'photoUpload',
		    data: oMyForm,
		    dataType: 'text',
		    processData: false,
		    contentType: false,
		    type: 'POST',
		    success: function(data){
		      document.getElementById("showLoadingUserPic").style.display = "none";
		      $("#userPhoto").val('');
		      $("#errorUploadingImage").html('');
		      //alert( $("#myLatestPhoto").val());
		      //alert(data);
		      $('#myLatestPhoto').attr("src","/MediaLounge"+data);
		      //loadThisUserProfile();
		      $("#profileUserPic").attr("src",$("#myLatestPhoto").attr("src"));
		      $("#footerImgUserImageId").attr("src",$("#myLatestPhoto").attr("src"));
		      $("#footerPopUpImgUserImageId").attr("src",$("#myLatestPhoto").attr("src"));
		    },
		    error: function (xhr, ajaxOptions, thrownError) {
		       // alert(xhr.responseText);
		      //  alert(thrownError);
		    	genericException();
		    }
		});
	 }
 

 function saveExpertise() {
	var dj = $('#dj').is(':checked');
	var anchor = $('#anchor').is(':checked');
	var vs = $('#vs').is(':checked');
	var journalist = $('#journalist').is(':checked');

	var fDj = "", fAnchor = "", fVs = "", fJournalist = "";
	if (dj == true) {
		fDj = "Y";
	} else {
		fDj = "N";
	}
	if (anchor == true) {
		fAnchor = "Y";
	} else {
		fAnchor = "N";
	}
	if (vs == true) {
		fVs = "Y";
	} else {
		fVs = "N";
	}
	if (journalist == true) {
		fJournalist = "Y";
	} else {
		fJournalist = "N";
	}
	// alert(fDj+":"+fAnchor +":"+fVs+":"+fJournalist);
	$.post("userType?dj=" + fDj + "&vs=" + fVs + "&journalist=" + fJournalist
			+ "&anchor=" + fAnchor, function(data, status) {
		$('#showExpertMsg').html(data);
		// alert(data);
	})
	.fail(function() {
		genericException();
	});
}

function editBioDiv() {
	document.getElementById("showBioDiv").style.display = "none";
	document.getElementById("showEditBioDiv").style.display = "block";
	document.getElementById("editText").focus();
}

function updateBioDiv() {
	var textareaValue = document.getElementById("editText").value;
	$.post("updateBioForUser?bioValue="+textareaValue, function(data, status) {
		document.getElementById("showEditBioDiv").style.display = "none";
		showMyProfile();
	})
	.fail(function() {
		genericException();
	});
}

function loadInspriedUsers() {
	document.getElementById("loadInspDiv").style.display = "block";
	$.post("loadInspriedUsers", function(data, status) {
		$('#loadInspDiv').html(data);
	})
	.fail(function() {
		genericException();
	});
}

function closeInsprDiv() {
	document.getElementById("loadInspDiv").style.display = "none";
	showMyProfile();
}

function saveInspiredUsers() {
	var userArray = [];
	$('input[name=chkedUser]:checked').each(function() {
		userArray.push($(this).val());
	});
	$.post("saveInspriedUsers?userArray="+userArray, function(data, status) {
		if(data == "Success"){
			alert("Inspiration Added successfully");
			closeInsprDiv();
		}
	})
	.fail(function() {
		genericException();
	});
}

function showMySkillDiv() {
	document.getElementById("loadAddSkillPage").style.display = "block";
	$.post("forwardToAddSkill", function(data, status) {
		$('#loadAddSkillPage').html(data);
	})
	.fail(function() {
		genericException();
	});
}

function cancelDiv(){
	document.getElementById("loadAddSkillPage").style.display = "none";
}

function showQuickOverview(overViewId) {
	$.post("getOverviewPage?overViewId="+overViewId, function(data, status) {
		$('#overViewData').html(data);
	})
	.fail(function() {
		genericException();	
	});
}

function showQuickOverviewAdmin(overViewId) {
	$.post("getOverviewPage?overViewId="+overViewId , function(data, status) {
		$('#mainContainer').html(data);
	})
	.fail(function() {
		genericException();
	});
}

// Bump

function loadBump(selOpt){
	resetSubMenuSelection();
	$(selOpt).addClass('active');
	$.post("loadBump", function(data, status) {
		$('#mainContainer').html(data);
	});
}

function loadBumpDetails(userId){
	$.post("loadBumpDetails?userId="+userId, function(data, status) {
		$('#mainContainer').html(data);
	});
}

/*function loadMainContainer(type, selOpt) {
	resetSubMenuSelection();
	$(selOpt).addClass('active');
	
	if (type == "jobsPage") {
		$('#theExchange').attr('class', 'active');
		$.ajax({
			url : 'jobExachangeLoad?moduleId=5',
			type : 'GET',
			success : function(data) {
				$('#mainContainer').html(data);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.responseText);
				alert(thrownError);
			}
		});
	} else {
		$.ajax({
			url : "/MediaLounge/getMainContainer",
			type : 'GET',
			data : {
				type : type
			},
			success : function(response) {
				document.getElementById("mainContainer").innerHTML = response;
				if(type == "inMix"){
					moveImage();
				}
				if(type == "rss"){
					moveSpotLight();
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
}*/

//The Hub - The Exchange start

function addNewJob() {
	/* alert("addNewJob"); */
	$.ajax({
		url : "/MediaLounge/postJob",
		type : 'POST',
		data : {
		},
		success : function(response) {
		/* alert("1234 ==> " + response); */
		document.getElementById("mainContainer").innerHTML = response;
		$('#submitBump1').css({'background-color' : '#3276B1'});
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert("error" + jqXHR.responseText);
			genericException();
		}
	});
}

function onChangeJobType() {
	var jobTypeId = $.trim($('#jobTypeId').val());
	if(jobTypeId == ""){
		$('#jobTypeErrorMsg').html('Please Select Job Type.');
		return false;
	} else {
		$('#jobTypeErrorMsg').html('');
	} 
}

function onChangeExp() {
	var experience = $.trim($('#experience').val());
	
	if(experience == ""){
		$('#experienceErrorMsg').html('Please Select Experience.');
		return false;
	} else {
		$('#experienceErrorMsg').html('');
	}
}

function onChangePriority() {
	
	var priority = $.trim($('#priority').val());
	
	if(priority == ""){
		$('#priorityErrorMsg').html('Please Select priority.');
		return false;
	} else {
		$('#priorityErrorMsg').html('');
	}
}

function jobTitleValidation() {
	 
	var jobTitle = $.trim($('#jobTitle').val());
	
	if (jobTitle == "") {
		$('#jobTittleErrorMsg').html('Please enter key');
		return false;
	} else {
		$('#jobTittleErrorMsg').html('');
	}
	
	if(/^[a-zA-Z0-9-_ ]*$/.test(jobTitle) == false) {
		$('#jobTittleErrorMsg').html('Special characters is not allowed.');
		return false;
	} else {
		$('#jobTittleErrorMsg').html('');
	}
	
	if (jobTitle.length > 50 ) {
		$('#jobTittleErrorMsg').html('Max 50 characters allowed');
		//$("#jobTitle").val('');
		return false;
	} else {
		$('#jobTittleErrorMsg').html('');
	}
	
}
function validateJobPost() {
	
	if(document.getElementById("jobTypeId").value == ""){
		$('#jobTypeErrorMsg').html('Please Select Job Type.');
		return false;
	} else {
		$('#jobTypeErrorMsg').html('');
	} 
	
	var jobTitle = document.getElementById("jobTitle").value;
	if(jobTitle == ""){
		$('#jobTittleErrorMsg').html('Please Enter Title.');
		return false;
	} else {
		$('#jobTitle').html('');
	}
	
	if (jobTitle == "") {
		$('#jobTittleErrorMsg').html('Please enter key');
		return false;
	} else {
		$('#jobTittleErrorMsg').html('');
	}
	
	if(/^[a-zA-Z0-9-_ ]*$/.test(jobTitle) == false) {
		$('#jobTittleErrorMsg').html('Special characters is not allowed.');
		return false;
	} else {
		$('#jobTittleErrorMsg').html('');
	}
	
	if (jobTitle.length > 50 ) {
		$('#jobTittleErrorMsg').html('Max 50 characters allowed');
		//$("#jobTitle").val('');
		return false;
	} else {
		$('#jobTittleErrorMsg').html('');
	}
	
	if(document.getElementById("experience").value == ""){
		//alert("Please Select Experience");
		$('#experienceErrorMsg').html('Please Select Experience.');
		return false;
	} else {
		$('#experienceErrorMsg').html('');
	}
	if(document.getElementById("priority").value == ""){
		//alert("Please Select priority");
		$('#priorityErrorMsg').html('Please Select priority.');
		return false;
	} else {
		$('#priorityErrorMsg').html('');
	}
	
	if(document.getElementById("description").value == ""){
		//alert("Please Enter Description");
		//document.getElementById("description").focus();
		$('#descriptionErrorMsg').html('Please Enter Description.');
		return false;
	} else {
		$('#descriptionErrorMsg').html('');
	}
	var des = document.getElementById("description").value;
	if (des.length > 400 ) {
		$('#descriptionErrorMsg').html('Max 400 characters allowed');
		return false;
	} else {
		$('#descriptionErrorMsg').html('');
	}
	
	 var jobTypeId = document.getElementById("jobTypeId").value;
	 var jobTitle = document.getElementById("jobTitle").value.trim();
	 var experience = document.getElementById("experience").value;
	 var priority = document.getElementById("priority").value;
	 var description = document.getElementById("description").value.trim();
		
	$.post("jobHome?jobTypeId="+jobTypeId+"&jobTitle="+jobTitle+"&experience="+experience+"&priority="+priority+"&description="+description, function(data, status) {
	
		$('#jobForm')[0].reset();
	// alert("Job Added Successfully !");
		$('#postJobMsg').html('Job Posted Successfully!');
		
	})
	.fail(function() {
		genericException();
	});
}

function PostedJobsViewers(jobId, jobTitle) {
	$.ajax({
		url : "/MediaLounge/PostedJobViewers",
		type : 'POST',
		data : {
				jobId : jobId,
				jobTitle : jobTitle
		},
		success : function(response) {
			/* alert("1234 ==> " + response); */
			document.getElementById("mainContainer").innerHTML = response;
			$('#submitBump1').css({'background-color' : '#3276B1'});
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert("error" + jqXHR.responseText);
			genericException();
		}
	});
}


function applyForJob(jobId,jobStatus){
	
	var skill = $('#skillId').val();
	var jobFormData = new FormData();
	jobFormData.append("file", uploadFile.files[0]);
	
	if ($.trim($('#skillId').val()) == "") {
		$('#skillErrorMsg').html('Please enter skill');
		return false;
	} else {
		$('#skillErrorMsg').html('');
	}
	
	if ($.trim($('#uploadFile').val()) == "") {
		$('#resumeErrorMsg').html('Please upload a file');
		return false;
	} else {
		$('#resumeErrorMsg').html('');
	}  
	
	if (skill.length > 400 ) {
		$('#skillErrorMsg').html('Max 400 characters allowed');
		return false;
	} else {
		$('#skillErrorMsg').html('');
	}
	
	var fname = $.trim($('#uploadFile').val());
	var fileExtension = $.trim(fname.replace(/^.*\./, '').toLowerCase());
	// alert(fileExtension);
	// for documents  
	if (fileExtension != "txt" && fileExtension != "plain" && fileExtension != "enriched"
			&& fileExtension != "html" && fileExtension != "rfc822-headers"
			&& fileExtension != "richtext" && fileExtension != "sgml"
			&& fileExtension != "msword" && fileExtension != "vnd.ms-excel"
			&& fileExtension != "cmd" && fileExtension != "css" && fileExtension != "odt"
			&& fileExtension != "csv" && fileExtension != "jsp" && fileExtension != "docx"
			&& fileExtension != "java" && fileExtension != "javascript"
			&& fileExtension != "vcard" && fileExtension != "xml" && fileExtension != "rtf" && fileExtension != "xlsx"
			&& fileExtension != "pdf" && fileExtension != "octet-stream" & fileExtension != "vnd.ms-powerpoint") {
		$('#resumeErrorMsg').html('We can able to upload following format only.<br><span>docx / odt / plain / enriched / html / rfc822-headers / richtext / sgml / msword / vnd.ms-excel / cmd /css / csv / jsp / java / javascript / vcard / xml / pdf / txt / rtf / xlsx</span>');
		return false;
	} else {
		$('#resumeErrorMsg').html('');
	}	
	$.ajax({
		url 	    : "postJobFormDetails?skill="+skill+"&jobId="+jobId+"&jobStatus="+jobStatus,
		type	    : 'POST',
		data 	    : jobFormData ,
		dataType    : 'text',
		processData : false,
		contentType : false,
		success     : function(response) {
		// alert("Success");
			$('#applyJobMsg').html('Job Applied Successfully !!');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert("error" + jqXHR.responseText);
			genericException();
		},
	});
	
	$('#jobFormId')[0].reset();
	
}

function getJobDetails(jobId) {
	$.ajax({
	 url : "/MediaLounge/getJobDetails",
	type : 'POST',
	data : {
				jobId : jobId
	},
	success : function(response) {
				/* alert(response); */
	  document.getElementById("mainContainer").innerHTML = response;
	  $('#submitBump2').css({'background-color' : '#3276B1'});
	},
	error : function(jqXHR, textStatus, errorThrown) {
		//alert("error" + jqXHR.responseText);
		genericException();
	}
	});
}

function jobExachangePostIt(type) {		
	$.ajax({
		url : 'getJobList?type='+type,
		type : 'GET',
		success : function(data) {
			/* document.getElementById("myProfileDiv").innerHTML = data; */
			$('#mainContainer').html(data);
			if(type == "postId"){
				$('#submitBump1').css({'background-color' : '#3276B1'});
			}else if(type == 'theBoard'){
				$('#submitBump2').css({'background-color' : '#3276B1'});
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			genericException();
			//alert(xhr.responseText);
			//alert(thrownError);
		}
	});
}

function jobExchangeAssigned(jobId, assigneeId) {
	$.ajax({
		url : 'jobExchangeAssigned?job_id='+jobId+'&assignee_id='+assigneeId,
		type : 'GET',
		success : function(data) {
			///alert(data);
			$('#assignedMsg').html("Assigned Successfully !!");
		},
		error : function(xhr, ajaxOptions, thrownError) {
			//alert(xhr.responseText);
			//alert(thrownError);
			genericException();
		}
	});	
}

function jobExachangeMyJob(type){
	$.post("jobExachangeMyJob?type="+type, function(data, status) {
		$('#mainContainer').html(data);
		if(type == "exchangeMyJob"){
			$('#submitBump4').css({'background-color' : '#3276B1'});
		}else if(type == "exchangeTheTable"){
			$('#submitBump5').css({'background-color' : '#3276B1'});
		}
	})
	.fail(function() {
		genericException();
	});
}
// The Hub - The Exchange end

function showFeaturedJobPage(){
	$.post("featuredJob", function(data, status) {
		$('#mainContainer').html(data);
		$('#submitBump3').css({'background-color' : '#3276B1'});
	})
	.fail(function() {
		genericException();
	});
}
function showCarrierPage() {
	$.post("carrierHomePage?moduleId=5", function(data, status) {
		$('#mainContainer').html(data);
	});
}
function loadAddCarrierPage() {
	// document.getElementById("loadAddCarrier").style.display = "block";
	document.getElementById("addCarrBtn").style.display = "none";
	$.post("addCarrier", function(data, status) {
		$('#loadAddCarrier').html(data);
	});
}

function hideAddCarrierDiv() {
	// document.getElementById("loadAddCarrier").style.display="none";
	showCarrierPage();
}

function userTitleValidation() {
	var title = $.trim($('#userTitle').val());
	
	if (title == "") {
		$('#errorTitle').html('Please enter Title');
		return false;
	} else {
		$('#errorTitle').html('');
	}
	
	if(/^[a-zA-Z0-9-_ ]*$/.test(title) == false) {
		$('#errorTitle').html('Special characters is not allowed.');
		return false;
	} else {
		$('#errorTitle').html('');
	}
	
	if (title.length > 200 ) {
		$('#errorTitle').html('Max 200 characters allowed');
		return false;
	} else {
		$('#errorTitle').html('');
	}
}

function saveRecords() {
	var userType = $('#userType').val();
	var listUser = $('#listUsers').val();
	var comments = $('#userComments').val();
	var title = $('#userTitle').val();
	var mediaId = $('#mediaName').val();
	//var mediaId = media_id;
	if (mediaId == null || mediaId == "") {
		$('#errorMediaName').html("Select Media Name");
		$('#errorExpertType').html("");
		$('#errorExpertName').html("");
		$('#errorTitle').html("");
		return false;
	}
	if (userType == null || userType == "") {
		$('#errorMediaName').html("");
		$('#errorExpertType').html("Select User type");
		$('#errorExpertName').html("");
		$('#errorTitle').html("");
		return false;
	}
	if (listUser == null || listUser == "") {
		$('#errorMediaName').html("");
		$('#errorExpertType').html("");
		$('#errorExpertName').html("Select Expert");
		$('#errorTitle').html("");
		return false;
	}
	
	if (title == "") {
		$('#errorTitle').html('Please enter Title');
		return false;
	} else {
		$('#errorTitle').html('');
	}
	
	if(/^[a-zA-Z0-9-_ ]*$/.test(title) == false) {
		$('#errorTitle').html('Special characters is not allowed.');
		return false;
	} else {
		$('#errorTitle').html('');
	}
	
	if (title.length > 200 ) {
		$('#errorTitle').html('Max 200 characters allowed');
		return false;
	} else {
		$('#errorTitle').html('');
	}
	
	if (title == null || title.trim() == "") {
		$('#errorMediaName').html("");
		$('#errorExpertType').html("");
		$('#errorExpertName').html("");
		$('#errorTitle').html("Please enter Title");
		return false;
	}else {
		 $.post("saveUserComments?userType=" + userType + "&listUser="
				+ listUser + "&comments=" + comments + "&mediaId="
				+ mediaId+ "&title="+ title, function(data, status) {
			if (status == "success"){
				// alert("Saved successfully");
				blossomSuggestion();
			}
			else
				alert("Error in saving");
		})
		.fail(function() {
			genericException();
		});
	}
}

function draftReview(selOpt){
	resetSubMenuSelection();
	$(selOpt).addClass('active');
	$.ajax({
		url : 'getMediaFeedbackDetails',
		type : 'GET',
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			// alert(xhr.responseText);
			// alert(thrownError);
			genericException();
		}
	});
}

function getActiveLogins(){
	$.ajax({
		url : "/MediaLounge/getActiveLogins",
		type : 'GET',
		data : {
		},
		success : function(response) {
			//document.getElementById("mainContainer").innerHTML = response;
			$('#mainContainer').html(response);
		},
		error : function() {
			genericException();
		}
	});
}

function jobType() {
	$.ajax({
		url : "/MediaLounge/getJobType",
		type : 'GET',
		data : {
		},
		success : function(response) {
			//document.getElementById("mainContainer").innerHTML = response;
			$('#mainContainer').html(response);
		},
		error : function() {
			genericException();
		}
	});
}
	
function deleteJobType(jobTypeId) {
	var r = confirm("Are You Sure to DELETE!");
	if (r == true) {
		$.ajax({
			url : "/MediaLounge/deleteJobType",
			type : 'GET',
			data : {
				jobTypeId : jobTypeId
			},
			success : function(response) {
				//document.getElementById("mainContainer").innerHTML = response;
				$('#mainContainer').html(response);
			},
			error : function() {
				genericException();
			}
		});
	}
}

function addJobTypePage() {
	$.ajax({
		url : "/MediaLounge/addJobTypePage",
		type : 'GET',
		data : {
		},
		success : function(response) {
			document.getElementById("mainContainer").innerHTML = response;
		},
		error : function() {
			genericException();
		}
	});
}

function jobTypeValidation() {
	var addJobType = $.trim($('#addJobType').val());
	if (addJobType == "") {
		$('#errorJobType').html('Please enter job type.');
		return false;
	} else {
		$('#errorJobType').html('');
	}
	
	if(/^[a-zA-Z0-9-_ ]*$/.test(addJobType) == false) {
		$('#errorJobType').html('Special characters is not allowed.');
		//$("#mediaName").val('');
		return false;
	} else {
		$('#errorJobType').html('');
	}
	
}

function addJobType() {
	var jobs = document.getElementsByName("jobType");
	var flag = true;
	var jobType = $("#addJobType").val();
	if(/^[a-zA-Z0-9-_ ]*$/.test(jobType) == false) {
		$('#errorJobType').html('Special characters is not allowed.');
		$("#addJobType").val('');
		return false;
	} else {
		$('#errorJobType').html('');
	}
	if(jobType == null || jobType =="" || jobType.trim() ==""){
		$('#errorJobType').html("Please enter Job Type");
	}
	else{
		for(var i = 0; i<jobs.length; i++){
			if(jobType.toUpperCase() == jobs[i].value.toUpperCase()){
				$('#errorJobType').html("JobType already Exist!!");
				document.getElementById("addJobType").value = "";
				flag = false;
			}
		}
		if(flag)
		{
			$.ajax({
				url : "/MediaLounge/addJobType",
				type : 'GET',
				data : {
					jobType: jobType
				},
				success : function(response) {
					//document.getElementById("mainContainer").innerHTML = response;
					$('#mainContainer').html(response);
				},
				error : function() {
					genericException();
				}
			});
		}
	}
}

function adminSuggestion(loginUser) {
	 $('#suggestionCheckBoxError').html('');
	 var checkBoxes = document.getElementsByName('suggestion');
	 var suggestiontype = "";
	 var suggestionMsg = "";
	 var countType = 0;
	 var suggestionTo = document.getElementById("suggestionTo").value;
	 for (var counter=0; counter < checkBoxes.length; counter++) {
        if (checkBoxes[counter].type.toUpperCase()=='CHECKBOX' && checkBoxes[counter].checked == true) {
        	  countType++;
        	  suggestiontype = checkBoxes[counter].value;
              suggestionMsg = document.getElementById('textSuggestion').value;
              if (suggestionMsg.trim() == "" || suggestionMsg.length > 250 ) {
				  //alert("Enter Suggestion in less than 200 characters!!");
            	  $('#textSuggestion').focus();
            	  $('#suggestionCheckBoxError').html('(Enter Suggestion)');
				  return false;
			}
 		}
	 }
 if (suggestiontype === "" || countType > 1) {
		//alert("Please check  one checkbox");
	 	$('#suggestionCheckBoxError').html('(Check 1 CheckBox)');
		$('input[name=suggestion]')[0].focus();
		return false;
	} 
 $.ajax({
		url : "/MediaLounge/adminFeedBackSuggestion?moduleId=7",
		type : 'GET',
		data: {
			type: suggestiontype , message: suggestionMsg , loginUser: loginUser , suggestionTo: suggestionTo
		 },
		success : function(response) {
			$('#suggestionCheckBoxError').html('Suggestion Sent');
			$('input:checkbox[name=suggestion]').attr('checked',false);
			document.getElementById('textSuggestion').value = "";
		},
		error : function() {
			genericException();
		}
	});
}


function getAdminSuggestion() {
	$.ajax({
		url : "/MediaLounge/getAdminSuggestion",
		type : 'GET',
		data : {
		},
		success : function(response) {
			//document.getElementById("mainContainer").innerHTML = response;
			$('#mainContainer').html(response);
		},
		error : function() {
			genericException();
		}
	});
}

function viewSuggestionDescription(adminSuggestionId){
	$.ajax({
		url : "/MediaLounge/viewSuggestionDescription",
		type : 'GET',
		data : {
			adminsuggId : adminSuggestionId
		},
		success : function(response) {
			document.getElementById("mainContainer").innerHTML = response;
		},
		error : function() {
			genericException();
		}
	});
}

function deleteAdminSuggestion(adminSuggestionId){
	var sure = confirm("Are You Sure to DELETE!!");
	if(sure == true){
		$.ajax({
			url : "/MediaLounge/deleteAdminSuggestion",
			type : 'GET',
			data : {
				adminsuggId : adminSuggestionId
			},
			success : function(response) {
				//document.getElementById("mainContainer").innerHTML = response;
				$('#mainContainer').html(response);
			},
			error : function() {
				genericException();
			}
		});
	}
}

function calculateMonitorAvg() {
	$.post("weeklyMonitorRecord",function(data, status) {
		showMonitorPageFun();
	})
	.fail(function() {
		genericException();
	});
}

function showMonitorPageFun() {
	$.ajax({
		url : 'getMonitorPage',
		type : 'GET',
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			//alert(xhr.responseText);
			//alert(thrownError);
			genericException();
		}
	});
}

function calculateMonitor4aAvg() {
	$.post("weeklyMonitorRecord", function(data, status) {
		showMonitor4APage();
	})
	.fail(function() {
		genericException();
	});
}

function showMonitor4APage() {
 $.post("getMonitor4Page", function(data, status) {
		$('#mainContainer').html(data);
	})
	.fail(function() {
		genericException();
	});
}

function addNewModule() {
	$.post("getaddNewModulePage", function(data, status) {
		$('#mainContainer').html(data);
	})
	.fail(function() {
		genericException();		
	});
}

function editOverViewOnClickAdmin(i){
	var id = document.getElementById("id_"+i).value;
	var overViewName = document.getElementById("overViewName_"+i).value;
	var desc = document.getElementById("desc_"+i).value;	
	var functionWork = document.getElementById("functionWork_"+i).value;	
	var whytoUse = document.getElementById("whytoUse_"+i).value;
	
	//alert(id +""+ overViewName +""+desc +""+functionWork +""+whytoUse);

    $.post("editOverViewData?QuickOverViewId="+id+"&overViewName="+overViewName+"&desc=" +desc+"&functionWork="+functionWork+"&whytoUse="+whytoUse , function(data, status) {
		$('#mainContainer').html(data); 
	 })
	 .fail(function() {
			genericException();	
	 });
}

function saveEditedOverView(){
	var id=document.getElementById("id").value;
	var moduleName = document.getElementById("moduleName").value;
    var description = document.getElementById("desc").value.trim();
    var function_work = document.getElementById("HFW").value.trim();
    var why_to_use = document.getElementById("WTU").value.trim();
    
	if(moduleName == ""){
		alert("Please Enter Module Name");
		document.getElementById("moduleName").focus();
		return false;
	}
	if(description == ""){
		document.getElementById("span1").innerHTML = " Please Enter function name";
		document.getElementById("desc").focus();
		return false;
	}else{
		document.getElementById("span1").innerHTML = "";	
	}
    
	if(function_work == ""){
		document.getElementById("span2").innerHTML = " Please Enter how it works";	
		document.getElementById("HFW").focus();
		return false;
	}else{
		document.getElementById("span2").innerHTML = "";
	}
	
	if(why_to_use == ""){
		document.getElementById("span3").innerHTML = " Please Enter why to use";
		document.getElementById("WTU").focus();
		return false;
	}else{
		document.getElementById("span3").innerHTML = "";
	}
	
    $.ajax({
		url : "saveEditedOverView",
		type : 'POST',
		data : {
			QuickOverViewId : id , overViewName : moduleName , desc : description , function_work : function_work , why_to_use : why_to_use
		},
		success : function(response) {
			$("#clearOverViewDetailsId").show();
			$("#showStatusMsg").show();
			document.getElementById("showStatusMsg").innerHTML = response;
		},
		error : function(jqXHR, textStatus, errorThrown) {
			genericException();	
		}
	});
    document.getElementById("moduleName").value = "";
    document.getElementById("desc").value = "";
    document.getElementById("HFW").value = "";
    document.getElementById("WTU").value = "";
}

function deleteOverViewOnClick(id){
	 var r=confirm("Do you want Delete Record ?");
	 if (r==true)
	   {
			 $.post("deleteQuickOverViewData?QuickOverViewId="+id , function(data, status) {
				/* $('#mainContainer').html(data); */
				// alert('hi')
				// $('#overViewData').html(data);
				showQuickOverviewAdmin(0);
			})
			.fail(function() {
				genericException();	
			});
			// showQuickOverviewAdmin(0);
	   }
}

function activeOrDeactive(type,id){
	 $.post("activeOrDeactiveOverView?QuickOverViewId=" + id + "&type=" + type , function(data, status) { ;
	 })
	 .fail(function() {
		genericException();
	});
}


function loadCharts(){
	$.post("loadCharts", function(data, status) {
		$('#chartsMML').html(data);
	})
	.fail(function() {
		genericException();
	});
}

function loadPopularVideos(){
	$.post("loadPopularVideos", function(data, status) {
		$('#chartsMML').html(data);
	})
	.fail(function() {
		genericException();
	});
}

function validatePhone(){
	/*document.getElementById("telephone").innerHTML = "";*/
	/*var phone = document.getElementById("phone");*/
	/*var letters = /^[A-Za-z]+$/;
	var phone = document.getElementById("phone");
	var b = (phone.value[phone.value.length-1]);
	if(b.match(letters))
	{
		document.getElementById("telephone").innerHTML = "Enter Only Numeric Value";
		phone.value="";
		phone.focus();
		return false;
	}*/
	var phone = $.trim($('#phone').val());
	if(/^[0-9 ]*$/.test(phone) == false) {
		$('#telephone').html('Enter Only Numeric Value');
		return false;
	} else {
		$('#telephone').html('');
	}
}

function validateProfileInfo(){
	var nickName = $.trim($('#nickName').val());
	if(/^[a-zA-Z0-9-_, ]*$/.test(nickName) == false) {
		$('#nickNameError').html('Special chars not allowed.');
	} else {
		$('#nickNameError').html('');
	}
	
	var zipcode = $.trim($('#zipcode').val());
	if(/^[a-zA-Z0-9, ]*$/.test(zipcode) == false) {
		$('#zip').html('Special chars not allowed.');
	} else {
		$('#zip').html('');
	}
	
	var role = $.trim($('#role').val());
	if(/^[a-zA-Z0-9-_, ]*$/.test(role) == false) {
		$('#roleError').html('Special chars not allowed.');
	} else {
		$('#roleError').html('');
	}
	
	var genre = $.trim($('#genre').val());
	if(/^[a-zA-Z0-9-_, ]*$/.test(genre) == false) {
		$('#genreError').html('Special chars not allowed.');
	} else {
		$('#genreError').html('');
	}
}

function latlong(){
	document.getElementById("zip").innerHTML ="";
	geocoder = new google.maps.Geocoder();
	var zipcode = document.getElementById("zipcode").value;
	 geocoder.geocode({
	        'address': zipcode
	    }, function(results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	           var loc = results[0].geometry.location;
	           loc = loc +"";
	           var arr=new Array();
	       	 	arr = loc.split(",");
	       	 	var arr1 = new Array();
	       		for ( var j = 0; j < arr.length; j++)
	       		{
		       		var str = "";
		       		for ( var i = 0; i < arr[j].length; i++)
		       		{
			       	 	if(arr[j].charAt(i) == '(' || arr[j].charAt(i) == '"' || arr[j].charAt(i) == ')')
			       	  	{
			       	  	}
			       	  	else
			       	  	{
				       	 	var str2 = arr[j].charAt(i);
				       	 	str = str + str2;
			       		}
			       	}
		       		arr1.push(str);
       	 		}
	       		$('#latitude').val(arr1[0]);
	       		$('#longitude').val(arr1[1]);
        } else {
        	document.getElementById("zip").innerHTML = "Enter valid Zip-Code";
        	document.getElementById("zipcode").value = "";
        	document.getElementById("zipcode").focus();
        }
    });
}

function spotlightPopUp(index) {
	$('#spotlightModalLabel').html($('#spotlightTitle_'+index).text());
	$('#spotlightModalImage').attr("src",$("#spotlightImg_"+index).attr("src"));
	var comments = $('#spotlightComments_'+index).text();
	$('#spotlightModalBody').html(comments);
}

/*function showChoosenMediaPopUp(type,path,name) {

	$('#choosedMediaName').html(name);
	if(type == 'image/gif' ||type == 'image/jpeg' || type == 'image/png' ||type == 'image/pjpeg' || type == 'image/tiff' ||type == 'image/svg+xml' ||type == 'image/jpg' ){
		$('#showChoosedMediaImage').attr("src",'/MediaLounge'+path);
		$('#showChoosedMediaImage').show();
		$('#showChoosedMediaVideo').hide();
		$('#showChoosedMediaAudio').hide();
	}
	if(type == 'video/mp4' || type =='video/mpeg' || type =='video/ogg' || type =='video/quicktime' || type =='video/webm' || type =='video/x-ms-wmv' ||  type == 'video/xflv' || type == 'video/x-flv'){
		$('#showChoosedMediaVideo').attr("src",'/MediaLounge'+path);
		$('#showChoosedMediaImage').hide();
		$('#showChoosedMediaVideo').show();
		$('#showChoosedMediaAudio').hide();
	}
	if(type =='audio/mp3' || type =='audio/basic' || type =='audio/L24' || type =='audio/mpeg' || type =='audio/webm'  || type =='audio/ogg' || type =='audio/vorbis' || type =='audio/vnd.rn-realaudio' || type =='audio/vnd.wave' ){
		$('#showChoosedMediaAudio').attr("src",'/MediaLounge'+path);
		$('#showChoosedMediaImage').hide();
		$('#showChoosedMediaVideo').hide();
		$('#showChoosedMediaAudio').show();
	}
	
}*/


$(document).ready(function(){

    $('#musicPlayer').ttwMusicPlayer(myPlaylist, {
        autoPlay:false, 
        jPlayer:{
            swfPath:'resources/plugin1/jquery-jplayer' //You need to override the default swf path any time the directory structure changes
        }
    });
    
});

/*$(document).ready(function() {
	$('#musicPlayerFeedBack').click(function(event) {
		alert('hi');
	});
});*/
