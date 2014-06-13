<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contentType" value="${contentType}" scope="page"/>
<c:set var="contentPath" value="${contentPath}" scope="page"/>

<script type="text/javascript">

	var myVideo = document.getElementById("videoFile"); 
	function playVid() {
	  myVideo.play();
	  //myFunction();
	} 

	function pauseVid() {
	  myVideo.pause(); 
	}
	
	/*function myFunction() {
		myVar = setTimeout(function() {
			pauseVid();
		}, 10000);
	}*/
	
		
		var ratingClickedFlag = false;
		var ratingCurrentValue = document.getElementById("ratCurrentValue").value;
		var countOfUsersRated = document.getElementById("countUserRate").value;
		var ratingAverage = document.getElementById("ratAvg").value;
		
		var avgRating=document.getElementById("ratAvg").value;
				
		if(avgRating >4 && avgRating <= 5){
			
			for(i=1;i<=Math.round(avgRating);i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />'
			}
			if(avgRating < 5)
			document.getElementById('starImage5').src='<c:url value="/resources/images/half.png" />';
		   
		} else if(avgRating >3 && avgRating <= 4){
			
			for(i=1;i<=Math.round(avgRating);i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />'
			}
			if(avgRating < 4)
			document.getElementById('starImage4').src='<c:url value="/resources/images/half.png" />';
		   
		} else if(avgRating >2 && avgRating <= 3){
			
			for(i=1;i<=Math.round(avgRating);i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />'
			}
			if(avgRating < 3)
		   document.getElementById('starImage3').src='<c:url value="/resources/images/half.png" />';
		   
		} else if(avgRating >1 && avgRating <= 2){
			
			for(i=1;i<=Math.round(avgRating);i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />'
			}
			if(avgRating < 2)
			document.getElementById('starImage2').src='<c:url value="/resources/images/half.png" />';
			
		} else if(avgRating >0 && avgRating <= 1){
			
			for(i=1;i<=Math.round(avgRating);i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />'
			}
			if(avgRating < 1)
			document.getElementById('starImage1').src='<c:url value="/resources/images/half.png" />';
		}
		
		
		function ratingScriptIn(starPos){

			for(i=1;i<=starPos;i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />'
			}
			
			for(i=starPos+1;i<=5;i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/empty.png" />' ;
					
			}
		}
		
		function ratingScriptOut(){
			//alert((parseInt(ratingAverage)).toFixed(0));
			for(i=1; i<=5; i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/empty.png" />';
			}
			for(i=1;i<=(parseInt(ratingAverage)).toFixed(0);i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />';
			}
			/* alert(parseInt((parseInt(ratingAverage)).toFixed(0))+1);
			for(i=(parseInt(ratingAverage)).toFixed(0)+1;i<=5;i++){
				alert(i);
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/empty.png" />';
			} */
			
			if(ratingAverage > 4 && ratingAverage < 5){
			   document.getElementById('starImage5').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 3 && ratingAverage < 4){
			   document.getElementById('starImage4').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 2 && ratingAverage < 3){
						   document.getElementById('starImage3').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 1 && ratingAverage < 2){
				document.getElementById('starImage2').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 0 && ratingAverage < 1){
				document.getElementById('starImage1').src='<c:url value="/resources/images/half.png" />';
			}
		}
		
		function ratingScriptClicked(starPos,mediaId){
			
			ratingCurrentValue =parseInt(ratingCurrentValue, 10) +  starPos;
			countOfUsersRated = parseInt(countOfUsersRated,10) + 1;
			ratingAverage = ratingCurrentValue/countOfUsersRated;
		
			var i;
			
			for(i=1;i<=(parseInt(ratingAverage.toFixed(0)));i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/filled.png" />';
			}
			
			for(i=(parseInt(ratingAverage.toFixed(0)))+1;i<=5;i++){
				document.getElementById('starImage'+i).src='<c:url value="/resources/images/empty.png" />';
			}
			
			if(ratingAverage > 4 && ratingAverage < 5){
			   document.getElementById('starImage5').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 3 && ratingAverage < 4){
			   document.getElementById('starImage4').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 2 && ratingAverage < 3){
						   document.getElementById('starImage3').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 1 && ratingAverage < 2){
				document.getElementById('starImage2').src='<c:url value="/resources/images/half.png" />';
			} else if(ratingAverage > 0 && ratingAverage < 1){
				document.getElementById('starImage1').src='<c:url value="/resources/images/half.png" />';
			}
			
			$.ajax({
				url : 'mediasUpdateRating?ratingCurrentValue=' + ratingCurrentValue
						+ '&mediaId=' + mediaId
						+ '&countOfUsersRated=' + countOfUsersRated
						+ '&ratingAverage=' + ratingAverage,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
				},
				error : function(xhr, ajaxOptions, thrownError) {
					//alert(xhr.responseText);
					//alert(thrownError);
					genericException();
				},
			});
		}		
</script>

<table border="1">

	<input type="hidden" id="ratCurrentValue" value="${mediaDto.ratingCurrentValue}">
	<input type="hidden" id="countUserRate" value="${mediaDto.countOfUsersRated}">
	<input type="hidden" id="ratAvg" value="${mediaDto.ratingAverage}">
	
	<c:if test="${contentType =='image/jpeg' || contentType =='image/png' || contentType =='image/gif' || contentType =='image/pjpeg' || contentType =='image/tiff' || contentType =='text/xml'}">
	  <center><img class="media-object" src="<c:url value="${contentPath}" />" width="350" height="350" alt="..."/></center><br>
	</c:if>
	<c:if test="${contentType =='video/mp4' || contentType =='video/x-ms-wmv' || contentType =='video/mpeg' || contentType =='video/ogg' || contentType =='video/quicktime' || contentType =='video/webm'}">
		<center> <video width="350" height="350" controls="controls">
			 <source src="<c:url value="${contentPath}" />" type="${contentType}">
		 </video></center><%--<center> <a onclick="playVid()" style="cursor: pointer;">Play</a>&nbsp;&nbsp;<a onclick="pauseVid()" style="cursor: pointer;">Pause</a></center> --%>
	</c:if>
	<c:if test="${contentType =='audio/mp3' || contentType =='audio/basic' || contentType =='audio/L24' || contentType =='audio/mpeg' || contentType =='audio/webm'}">
		<center><audio controls preload="metadata">
			<source src="<c:url value="${contentPath}" />" type="${media.contentType}"></source>
		</audio></center>
		<%-- <object data="<c:url value="${contentPath}" />" type="${media.contentType}" style="height: 50%!important;" align="middle">
			<param  value="<c:url value="${contentPath}" />" style="height: 50%!important;">
		</object> --%>
		<%-- <embed type="${media.contentType}" src="<c:url value="${contentPath}" />" height="" width="" > --%>
		<br>
	</c:if>	 
	<center>Your Rating:</center>
	 <center><img id="starImage1" src='<c:url value="/resources/images/empty.png" />' width="20px" height="20px" onmouseover="ratingScriptIn(1)" onmouseout = "ratingScriptOut();" onclick="ratingScriptClicked(1,${mediaId})"/>

	 <img id="starImage2" src='<c:url value="/resources/images/empty.png" />' width="20px" height="20px" onmouseover="ratingScriptIn(2)"onmouseout = "ratingScriptOut();" onclick="ratingScriptClicked(2,${mediaId})"/>

 	<img id="starImage3" src='<c:url value="/resources/images/empty.png" />' width="20px" height="20px" onmouseover="ratingScriptIn(3)"onmouseout = "ratingScriptOut();" onclick="ratingScriptClicked(3,${mediaId})"/>

	 <img id="starImage4" src='<c:url value="/resources/images/empty.png" />' width="20px" height="20px" onmouseover="ratingScriptIn(4)"onmouseout = "ratingScriptOut();" onclick="ratingScriptClicked(4,${mediaId})"/>

	<img id="starImage5" src='<c:url value="/resources/images/empty.png" />' width="20px" height="20px" onmouseover="ratingScriptIn(5)" onmouseout = "ratingScriptOut();" onclick="ratingScriptClicked(5,${mediaId})"/></center>
	
</table>