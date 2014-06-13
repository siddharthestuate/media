<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<style>
.containerBump {
	overflow: hidden;
	width: 500px;
	margin: 0 auto;
}
#outerBox {
	padding: 10px;
	background: #f0f0f0;
	border: 1px solid #ccc;
}

/*--Main Image Preview--*/
.main_image {
	width: 477px; 
	/* height: 350px; */
	float: left;
	background: #F0F0F0;
	position: relative;
	overflow: hidden;
	color: #fff;
}
.block small { 
	padding: 0 0 0 20px; 
	background: url(images/icon_cal.gif) no-repeat 0 center; 
	font-size: 1em; 
}
/* .main_image .block small {margin-left: 10px;} */
.main_image .desc{
	position: absolute;
	bottom: 0;	left: 0;
	width: 100%;
	display: none;
}
.main_image .block{
	width: 100%;
	background: #111;
	border-top: 1px solid #000;
	height: 104px;
}
 .main_image a.closeDesc {
	background: url(/MediaLounge/resources/images/btn_coll.gif) no-repeat left top;
	height: 27px; width: 93px;
	text-indent: -99999px;
	position: absolute; 
	top: -27px; right: -22px; 
}
.main_image a.show {background-position: left bottom;} 


.image_thumb {
	float: left;
	width: 478px;
	background: #f0f0f0;
	border-right: 1px solid #fff;
	border-top: 1px solid #ccc;
	overflow-x: hidden;
	overflow-y: auto;
	height: 51px;
}
.image_thumb img {
	border: 1px solid #ccc; 
	padding: 5px; 
	background: #fff; 
	float: left;
}
.image_thumb ul {
	margin: 0; padding: 0;
	list-style: none;
}
</style>

<script type="text/javascript">
var intervalId;
var slidetime = 2500; // milliseconds between automatic transitions

$(document).ready(function() {	

  // Comment out this line to disable auto-play
	//intervalID = setInterval(cycleImage, slidetime);

	$(".main_image .desc").show(); // Show Banner
	$(".main_image .block").animate({ opacity: 0.85 }, 1 ); // Set Opacity

	// Click and Hover events for thumbnail list
	$(".image_thumb ul li:first").addClass('active'); 
	$(".image_thumb ul li").click(function(){ 
		// Set Variables
		var imgAlt = $(this).find('img').attr("alt"); //  Get Alt Tag of Image
		var imgTitle = $(this).find('a').attr("href"); // Get Main Image URL
		var imgDesc = $(this).find('.block').html(); 	//  Get HTML of block
		var imgDescHeight = $(".main_image").find('.block').height();	// Calculate height of block	
		
		if ($(this).is(".active")) {  // If it's already active, then...
			return false; // Don't click through
		} else {
			// Animate the Teaser				
			$(".main_image .block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 250 , function() {
				$(".main_image .block").html(imgDesc).animate({ opacity: 0.85,	marginBottom: "0" }, 250 );
				$(".main_image img").attr({ src: imgTitle , alt: imgAlt});
			});
		}
		
		$(".image_thumb ul li").removeClass('active'); // Remove class of 'active' on all lists
		$(this).addClass('active');  // add class of 'active' on this list only
		return false;
		
	}) .hover(function(){
		$(this).addClass('hover');
		}, function() {
		$(this).removeClass('hover');
	});
			
	// Toggle Teaser
	$("a.closeDesc").click(function(){
		$(".main_image .block").slideToggle();
		$("a.closeDesc").toggleClass("show");
	});
	
	// Function to autoplay cycling of images
	// Source: http://stackoverflow.com/a/9259171/477958
	function cycleImage(){
    var onLastLi = $(".image_thumb ul li:last").hasClass("active");       
    var currentImage = $(".image_thumb ul li.active");
    
    
    if(onLastLi){
      var nextImage = $(".image_thumb ul li:first");
    } else {
      var nextImage = $(".image_thumb ul li.active").next();
    }
    
    $(currentImage).removeClass("active");
    $(nextImage).addClass("active");
    
		// Duplicate code for animation
		var imgAlt = $(nextImage).find('img').attr("alt");
		var imgTitle = $(nextImage).find('a').attr("href");
		var imgDesc = $(nextImage).find('.block').html();
		var imgDescHeight = $(".main_image").find('.block').height();
					
		$(".main_image .block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 250 , function() {
      $(".main_image .block").html(imgDesc).animate({ opacity: 0.85,	marginBottom: "0" }, 250 );
      $(".main_image img").attr({ src: imgTitle , alt: imgAlt});
		});
  };
	
});// Close Function
</script>

<script>
/* function addFavourite(from,to) {
	$.post("addFavourite?from="+from+"&to="+to, function(data, status) {
		$('#bumpArea').html(data);
	});
} */
function showfav(){
	$('#favlist').hide();
	$('#showPendingFavourite').hide();
	$('#showFavourite').show();
	$('#showMaybeFavourite').hide();
	$('#showSentFavourite').hide();
	//to change the color of selected button
	$('#submitBump').css({'background-color' : '#00AFEC'});
	$('#mutualBump').css({'background-color' : '#3276B1'});
	$('#pendingBump').css({'background-color' : '#00AFEC'});
	$('#maybeBump').css({'background-color' : '#00AFEC'});
	$('#favBump').css({'background-color' : '#00AFEC'});
}
var number = 0;
var totalCount = 0;
function showPendingfav(userno,action,total) {
	/* var j = 1;
	var flag2 = true;
	if(action == 'add'){
		userno = number;
		if(number == 1){
			document.getElementById("previousButton").disabled = true;
		}else{
			document.getElementById("previousButton").disabled = false;
		}
	}else{
		number = userno;
	} */
	//alert(userno);
	var flag = true ;
	$('#favlist').hide();
	$('#showPendingFavourite').show();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').hide();
	$('#showSentFavourite').hide();
	/* if(number < total){
		document.getElementById("errorMsg").innerHTML = "";
		while(flag2){
			if(j <= number){
				$('#showsmallDiv'+j).hide();
				j++;
			}else{
				flag2 = false;
			} 
		}
		while(flag){
			$('#showsmallDiv'+number).show();
			number++;
			if(number > (userno+3)){
				flag = false;
			}
		}
		totalCount = total;
		//alert(number);
		if(number > totalCount){
			document.getElementById("nextButton").disabled = true;
		}
		else{
			document.getElementById("nextButton").disabled = false;
			
		}
		showProfile(userno);
	}else{
		document.getElementById("errorMsg").innerHTML = "No More Records Found!!";
	} */
	
	
	//to change the color of selected button
	$('#submitBump').css({'background-color' : '#00AFEC'});
	$('#mutualBump').css({'background-color' : '#00AFEC'});
	$('#pendingBump').css({'background-color' : '#3276B1'});
	$('#maybeBump').css({'background-color' : '#00AFEC'});
	$('#favBump').css({'background-color' : '#00AFEC'});
}

function showPreviousRecords(total){
	document.getElementById("nextButton").disabled = false;
	var j = 1;
	var flag2 = true;
	userno = number;
	//alert(userno);
	//alert(total);
	var flag = true ;
	$('#favlist').hide();
	$('#showPendingFavourite').show();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').hide();
	$('#showSentFavourite').hide();
	if(total < userno){ 
		var no = number;
		no = no - 5;
		if(no <= 4){
			document.getElementById("previousButton").disabled = true;
		}
		if(no > 0){
			document.getElementById("errorMsg").innerHTML = "";
			while(flag2){
				if(j < total){
					$('#showsmallDiv'+j).hide();
					j++;
				}else{
					flag2 = false;
				} 
			}
				number = number - 5;
				userno = number;
			while(flag){
				$('#showsmallDiv'+number).show();
				number--;
				if(number == (userno-4)){
					flag = false;
					number = number + 1;
				}
			}
			totalCount = total;
			//alert(number);
			showProfile(number);
		}else{
			document.getElementById("errorMsg").innerHTML = "No More Previous Records Found!!";
		} 
		
	 }else{
		document.getElementById("errorMsg").innerHTML = "No More Previous Records Found!!";
	} 
}
function showProfile(usernum){
	var i = 1;
	$('#favlist').hide();
	$('#showPendingFavourite').show();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').hide();
	$('#showSentFavourite').hide();
	var flag1 = true;
	while(flag1){
		if(i <= totalCount){
			$('#showDiv'+i).hide();
			i++;
		}else{
			$('#showDiv'+usernum).show();
			flag1 = false;
		}
	}
}

function showMaybefav() {
	$('#favlist').hide();
	$('#showPendingFavourite').hide();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').show();
	$('#showSentFavourite').hide();
	
	//to change the color of selected button
	$('#submitBump').css({'background-color' : '#00AFEC'});
	$('#mutualBump').css({'background-color' : '#00AFEC'});
	$('#pendingBump').css({'background-color' : '#00AFEC'});
	$('#maybeBump').css({'background-color' : '#3276B1'});
	$('#favBump').css({'background-color' : '#00AFEC'});
}
function actionFavouriteBump(bumpId,action) {
	$.post("actionFavouriteBump?bumpId="+bumpId+"&action="+action, function(data, status) {
		$('#bumpArea').html(data);
	})
	.fail(function() {
		genericException();
	});
}

$(document).ready(function () {
	$('#showUserProfile1').show();
});

 function clickedYES(from,to,profile) {
	$.post("addFavourite?from="+from+"&to="+to+"&type=yes", function(data, status) {
		
	})
	.fail(function() {
		genericException();
	});
	$('#showUserProfile'+profile).hide();
	var noOfprofiles = document.getElementById("noOfProfiles").value;
	if(profile+1 > noOfprofiles){
		$('#showUserProfileDefault').show();
	}else{
		$('#showUserProfile'+(profile+1)).show();
	}
 }
 
function clickedNO(profile){
	$('#showUserProfile'+profile).hide();
	var noOfprofiles = document.getElementById("noOfProfiles").value;
	if(profile+1 > noOfprofiles){
		$('#showUserProfileDefault').show();
	}else{
		$('#showUserProfile'+(profile+1)).show();
	}
 }
 
function clickedMAYBE(from,to,profile){
	$.post("addFavourite?from="+from+"&to="+to+"&type=maybe", function(data, status) {
		
	})
	.fail(function() {
		genericException();
	});
	$('#showUserProfile'+profile).hide();
	var noOfprofiles = document.getElementById("noOfProfiles").value;
	if(profile+1 > noOfprofiles){
		$('#showUserProfileDefault').show();
	}else{
		$('#showUserProfile'+(profile+1)).show();
	}
 }
 function changeMAYBE(bumpId,action) {
	$.post("changeMAYBE?bumpId="+bumpId+"&action="+action, function(data, status) {
		$('#bumpArea').html(data);
	})
	.fail(function() {
		genericException();
	});
}
 function showSentFavourite() {
	$('#favlist').hide();
	$('#showPendingFavourite').hide();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').hide();
	$('#showSentFavourite').show();
	
	//to change the color of selected button
	$('#submitBump').css({'background-color' : '#00AFEC'});
	$('#mutualBump').css({'background-color' : '#00AFEC'});
	$('#pendingBump').css({'background-color' : '#00AFEC'});
	$('#maybeBump').css({'background-color' : '#00AFEC'});
	$('#favBump').css({'background-color' : '#3276B1'});
}
</script>
<style>
#bkDiv{
	background-color: #363633; 
	color: #FFFFFF; 
	padding: 10px;
	border-radius:7px;
}
.fav{
	height: 457px;
	overflow-y: auto;
}
</style>
<div id="favlist" class="fav" >
	<c:set var="userProfile" value="0" scope="page"/>
	
	<c:forEach items="${USERLIST}" var="user">
	<c:set var="userProfile" value="${userProfile+1 }" scope="page"/>
	<span id="showUserProfile${userProfile }" style="display: none; margin-left:20px; width: 500px;" class="main_image">
		<table align="center">
			<tr >
				<td>
					<input class="btn btn-primary" style="padding: 6px 20px" type="button" value="YES" onclick="clickedYES('${loginUser }','${user.userId}',${userProfile })">
					<input class="btn btn-primary" style="padding: 6px 22px" type="button" value="NO" onclick="clickedNO(${userProfile })">
					<input class="btn btn-primary" style="padding: 6px 14px" type="button" value="MAY-BE" onclick="clickedMAYBE('${loginUser }','${user.userId}',${userProfile })">
				</td>
			</tr>
			<tr>
				<table >
					<tr align="center">
						<c:if test="${user.contentPath == null}">
							<td colspan="2"><img src="/MediaLounge/resources/dummy/dummy.jpg" width="477px" height="350px" style="cursor: pointer;"></td>
						</c:if>
						<c:if test="${user.contentPath != null}">
							<td colspan="2"><img src="<c:url value="${user.contentPath}" />" width="477px" height="350px" style="cursor: pointer;"></td>
						</c:if>
					</tr>
					<tr>
						<td align="center" style="font-size: 14px;color: #3276B1; width: 50%">${user.firstName } ${user.lastName }</td>
					</tr>
					<tr>
						<td align="center" style="font-size: 14px;color: #3276B1; width: 50% ">${user.country }</td>
					</tr>
					<tr>
						<td align="center" style="font-size: 14px;color: #3276B1" colspan="2">${user.email }</td>
					</tr>
					
				</table>
			</tr>
		</table>
	</span>
	</c:forEach>
	<c:if test="${userProfile == 0 }">
		<h3>NO RECORDS FOUND!!</h3>
	</c:if>
	<span id="showUserProfileDefault" style="display: none">
		<h3>NO MORE RECORDS FOUND!!</h3>
	</span>
	<input type="hidden" id="noOfProfiles" value="${userProfile }">
</div>

<div id="showFavourite" class="fav"  style="display: none; ">
	<table align ="center">
		<c:set var="count" value="0" scope="page"/>
		<c:forEach items="${BUMPFAVLIST}" var="fav">
			<c:if test="${fav.favourite == 'Y' && fav.favStatus == 'yes' }">
				<c:if test="${fav.fromUser.userId != loginUser }">
				<c:set var="count" value="${count +1 }" scope="page"/>
				<tr>
					<td>
					<div id="bkDiv" style="width: 525px; height: 150px;" align="center">
						<table>
							<tr>
								<td style="width: 20%; padding: 20px;">
								<table>
									<tr>
										<c:if test="${fav.fromUser.contentPath == null}">
											<td rowspan="4" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="80px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
										<c:if test="${fav.fromUser.contentPath != null}">
											<td rowspan="4" ><img src="<c:url value="${fav.fromUser.contentPath}" />" width="100px" height="80px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
									</tr>
								</table>
								</td>
								<td style="width: 60%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.fromUser.firstName } ${fav.fromUser.lastName}</td>
										</tr>
										<tr>
											<td>${fav.fromUser.email} </td>
										</tr>
										<tr>
											<td>${fav.fromUser.country } </td>
										</tr>
									</table>
								</td>	
								<td style="width: 20%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.fromUser.zipcode} </td>
										</tr>
										<tr>
											<td> </td>
										</tr>
										<tr>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${fav.toUser.userId != loginUser }">
				<c:set var="count" value="${count +1 }" scope="page"/>
				<tr>
					<td>
					<div id="bkDiv" style="width: 525px; height: 150px;" align="center">
						<table>
							<tr>
								<td style="width: 20%; padding: 20px;">
								<table>
									<tr>
										<c:if test="${fav.toUser.contentPath == null}">
											<td rowspan="4" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="80px" onclick="loadUser('${fav.toUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
										<c:if test="${fav.toUser.contentPath != null}">
											<td rowspan="4" ><img src="<c:url value="${fav.toUser.contentPath}" />" width="100px" height="80px" onclick="loadUser('${fav.toUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
									</tr>
								</table>
								</td>
								<td style="width: 60%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.toUser.firstName } ${fav.toUser.lastName}</td>
										</tr>
										<tr>
											<td>${fav.toUser.email} </td>
										</tr>
										<tr>
											<td>${fav.toUser.country } </td>
										</tr>
									</table>
								</td>	
								<td style="width: 20%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.toUser.zipcode} </td>
										</tr>
										<tr>
											<td> </td>
										</tr>
										<tr>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if>
	</table>
</div>

<div id="showPendingFavourite" class="fav"  style="display: none; width: 540px; " align="center">
<%-- <table align ="center">
		<c:set var="count" value="0" scope="page"/>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
		<c:if test="${fav.favourite == 'Y' && fav.favStatus == null }">
			
			<c:if test="${fav.toUser.userId == loginUser }">
			<c:set var="count" value="${count +1 }" scope="page"/>
				<tr>
					<td>
						<span id="showDiv${count }" style="display: none">
						<table align="center">
							<tr>
								<td>
									<input class="btn btn-primary" style="padding: 6px 20px" type="button" value="YES" onclick="actionFavouriteBump('${fav.bumpId }','yes')">
									<input class="btn btn-primary" style="padding: 6px 22px" type="button" value="NO" onclick="actionFavouriteBump('${fav.bumpId }','no')">
									<input class="btn btn-primary" style="padding: 6px 14px" type="button" value="MAY-BE" onclick="actionFavouriteBump('${fav.bumpId }','maybe')">
								</td>
							</tr>
							<tr>
							<table align = "center">
								<tr>
									<c:if test="${fav.fromUser.contentPath == null}">
										<td colspan="2" align="center"><img src="/MediaLounge/resources/dummy/dummy.jpg" width="350px" height="300px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
									</c:if>
									<c:if test="${fav.fromUser.contentPath != null}">
										<td colspan="2" align="center"><img src="<c:url value="${fav.fromUser.contentPath}" />" width="350px" height="300px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
									</c:if>
								</tr>
								<tr>
									<td align="center" style="font-size: 14px;color: #3276B1; width: 50%">${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
								</tr>
								<tr>
									<td align="center" style="font-size: 14px;color: #3276B1; width: 50% ">${fav.fromUser.country }</td>
								</tr>
								<tr>
									<td align="center" style="font-size: 14px;color: #3276B1" colspan="2">${fav.fromUser.email }</td>
								</tr>
								
							</table>
							</tr>
						</table>
						</span>
					</td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
	</table>
		<c:set var="number" value="1" scope="page"/>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
		<c:if test="${fav.favourite == 'Y' && fav.favStatus == null }">
			<c:if test="${fav.toUser.userId == loginUser }">
				<div style="display: inline-block;">
				<div id="showsmallDiv${number }" style="display: none" >
				<table border="0" style="border-collapse: collapse;border-spacing: 0px;">
				<tr>
					<c:if test="${fav.fromUser.contentPath == null}">
						<td align="center"><img src="/MediaLounge/resources/dummy/dummy.jpg" width="80px" height="60px" onclick="showProfile('${number }')" style="cursor: pointer;"></td>
					</c:if>
					<c:if test="${fav.fromUser.contentPath != null}">
						<td align="center"><img src="<c:url value="${fav.fromUser.contentPath}" />" width="80px" height="60px" onclick="showProfile('${number }')" style="cursor: pointer;"></td>
					</c:if>
				</tr>
				<tr><td align="center" style="font-size: 10px; color: black;"><p style="word-wrap: break-word !important; width: 127px !important; height:18px; display: block; position: relative;">${fav.fromUser.firstName } ${fav.fromUser.lastName }</p></td></tr>
				<tr><td align="center" style="font-size: 10px; color: black;">Age :  ${fav.fromUser.age }</td></tr>
				</table>
				</div>
				</div>
			<c:set var="number" value="${number+1 }" scope="page"/>
		</c:if>
		</c:if>
		</c:forEach>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
			<span id="errorMsg" style="display: none"></span>
		</c:if>
	</br>
	<c:if test="${count != 0 }">
	<button type="button" class="btn btn-primary" id="previousButton" onclick="showPreviousRecords(${number })" style="float: left" disabled="disabled"><< Previous</button>
	<span id="errorMsg" style="color: orange; margin-top: 5px; font-size: 14px;"></span>
	<button type="button" class="btn btn-primary" id="nextButton" onclick="showPendingfav(0,'add',${number })" style="float: right">Next >></button>
	</c:if> --%>
	<%-- <ul id="myGallery">
		<c:forEach items="${BUMPFAVLIST }" var="fav">
			<li>
				
				<c:if test="${fav.favourite == 'Y' && fav.favStatus == null }">
			
				<c:if test="${fav.toUser.userId == loginUser }">
				<c:set var="count" value="${count +1 }" scope="page"/>
					
									<input class="btn btn-primary" style="padding: 6px 20px" type="button" value="YES" onclick="actionFavouriteBump('${fav.bumpId }','yes')">
									<input class="btn btn-primary" style="padding: 6px 22px" type="button" value="NO" onclick="actionFavouriteBump('${fav.bumpId }','no')">
								
								
									<c:if test="${fav.fromUser.contentPath == null}">
										<img src="/MediaLounge/resources/dummy/dummy.jpg" width="350px" height="300px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;">
									</c:if>
									<c:if test="${fav.fromUser.contentPath != null}">
										<img src="<c:url value="${fav.fromUser.contentPath}" />" width="350px" height="300px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;">
									</c:if>
								${fav.fromUser.firstName } ${fav.fromUser.lastName }
								${fav.fromUser.country }
								${fav.fromUser.email }
								
				</c:if>
			</c:if>
			
		</li>
		</c:forEach>
	</ul> --%>
	<div id="outerBox" class="containerBump">
	<c:set var="count" value="0" scope="page"/>
	<div class="main_image">
		<c:forEach items="${BUMPFAVLIST }" var="fav">
			<c:if test="${count == 0 }">
				<c:if test="${fav.favourite == 'Y' && fav.favStatus == null }">
					<c:if test="${fav.toUser.userId == loginUser }">
						<c:set var="count" value="${count +1 }" scope="page"/>
						<c:if test="${fav.fromUser.contentPath == null}">
							<img src="/MediaLounge/resources/dummy/dummy.jpg" alt="" width="477px" height="350px" />
						</c:if>
						<c:if test="${fav.fromUser.contentPath != null}">
							<img src="<c:url value="${fav.fromUser.contentPath}" />" alt="" width="477px" height="350px" />
						</c:if>
						<div class="desc">
							<a href="#" class="closeDesc">Close Me!</a>
							<div class="block">
								<h4>${fav.fromUser.firstName } ${fav.fromUser.lastName }</h4>
								<small>${fav.fromUser.email }</small><br/>
								<small>${fav.fromUser.country }</small><br/>
								<input class="btn btn-primary" style="padding: 6px 20px" type="button" value="YES" onclick="actionFavouriteBump('${fav.bumpId }','yes')">
								<input class="btn btn-primary" style="padding: 6px 22px" type="button" value="NO" onclick="actionFavouriteBump('${fav.bumpId }','no')">
							</div>
						</div>
					</c:if>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if>
	</div>
	<div class="image_thumb">
		<ul>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
			<li>
			<c:if test="${fav.favourite == 'Y' && fav.favStatus == null }">
			
				<c:if test="${fav.toUser.userId == loginUser }">
				<c:set var="count" value="${count +1 }" scope="page"/>
				<c:if test="${fav.fromUser.contentPath == null}">
				<a href="/MediaLounge/resources/dummy/dummy.jpg">
					<img src="/MediaLounge/resources/dummy/dummy.jpg" width="51px" height="50px" style="cursor: pointer;" title="${fav.fromUser.firstName } ${fav.fromUser.lastName }">
				</a>
				</c:if>
				<c:if test="${fav.fromUser.contentPath != null}">
				<a href="<c:url value="${fav.fromUser.contentPath}" />">
					<img src="<c:url value="${fav.fromUser.contentPath}" />" width="50px" height="50px" style="cursor: pointer;" title="${fav.fromUser.firstName } ${fav.fromUser.lastName }">
				</a>
				</c:if>
				<div class="block" style="display: none">
					<h4>${fav.fromUser.firstName } ${fav.fromUser.lastName }</h4>
					<small>${fav.fromUser.email }</small><br/>
					<small>${fav.fromUser.country }</small><br/>
					<input class="btn btn-primary" style="padding: 6px 20px" type="button" value="YES" onclick="actionFavouriteBump('${fav.bumpId }','yes')">
					<input class="btn btn-primary" style="padding: 6px 22px" type="button" value="NO" onclick="actionFavouriteBump('${fav.bumpId }','no')">
								
					
				</div>
				</c:if>
				</c:if>
			</li>
		</c:forEach>
		</ul>
	</div>
	</div>
	<c:set var="number" value="1" scope="page"/>
</div>
<div id="showMaybeFavourite" class="fav" style="display: none; ">
<table align ="center">
		<c:set var="count" value="0" scope="page"/>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
		<%-- <c:if test="${fav.favourite == 'Y' && fav.favStatus == 'maybe' }"> --%>
		<c:if test="${fav.favourite == 'MB' }">
			<c:if test="${fav.fromUser.userId == loginUser }">
			<c:set var="count" value="${count +1 }" scope="page"/>
				<tr>
					<td>
					<div id="bkDiv" style="width: 525px; height: 150px;" align="center">
						<table style="margin-top: -10px;">
							<tr>
								<td style="width: 20%; padding: 20px;">
								<table>
									<tr>
										<c:if test="${fav.toUser.contentPath == null}">
											<td rowspan="4" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="80px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
										<c:if test="${fav.toUser.contentPath != null}">
											<td rowspan="4" ><img src="<c:url value="${fav.toUser.contentPath}" />" width="100px" height="80px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
									</tr>
								</table>
								</td>
								<td style="width: 60%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.toUser.firstName } ${fav.toUser.lastName}</td>
										</tr>
										<tr>
											<td>${fav.toUser.email} </td>
										</tr>
										<tr>
											<td>${fav.toUser.country } </td>
										</tr>
									</table>
								</td>	
								<td style="width: 20%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.toUser.zipcode} </td>
										</tr>
										<tr>
											<td> </td>
										</tr>
										<tr>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
									<input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="changeMAYBE('${fav.bumpId }','yes')">
									<input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="changeMAYBE('${fav.bumpId }','no')">
								</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if>
	</table>
</div>
<div id="showSentFavourite" class="fav" style="display: none; ">
<table align ="center">
		<c:set var="count" value="0" scope="page"/>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
		<c:if test="${fav.favourite == 'Y' && fav.favStatus == null  }">
			<c:if test="${fav.fromUser.userId == loginUser }">
			<c:set var="count" value="${count +1 }" scope="page"/>
				<tr>
					<td>
					<div id="bkDiv" style="width: 525px; height: 150px;" align="center">
						<table>
							<tr>
								<td style="width: 20%; padding: 20px;">
								<table>
									<tr>
										<c:if test="${fav.toUser.contentPath == null}">
											<td rowspan="4" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="80px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
										<c:if test="${fav.toUser.contentPath != null}">
											<td rowspan="4" ><img src="<c:url value="${fav.toUser.contentPath}" />" width="100px" height="80px" onclick="loadUser('${fav.fromUser.userId}');" style="cursor: pointer;"></td>
										</c:if>
									</tr>
								</table>
								</td>
								<td style="width: 60%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.toUser.firstName } ${fav.toUser.lastName}</td>
										</tr>
										<tr>
											<td>${fav.toUser.email} </td>
										</tr>
										<tr>
											<td>${fav.toUser.country } </td>
										</tr>
									</table>
								</td>	
								<td style="width: 20%; padding: 20px;">
									<table>
										<tr>
											<td>${fav.toUser.zipcode} </td>
										</tr>
										<tr>
											<td> </td>
										</tr>
										<tr>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if>
	</table>
</div>
<button type="button" class="btn btn-primary" id="mutualBump" onclick="showfav()">Mutual</button>
<button type="button" class="btn btn-primary" id="pendingBump" onclick="showPendingfav(1,'',${number })">Pending</button>
<button type="button" class="btn btn-primary" id="maybeBump" onclick="showMaybefav()">MAY-BE</button>
<button type="button" class="btn btn-primary" id="favBump" onclick="showSentFavourite()">Favourites</button>