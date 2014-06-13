<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>
 <script type="text/javascript" src="<c:url value="/resources/javascript/jquery.lazy.min.js" />" ></script>
 <script type="text/javascript" src="resources/javascript/jquery.nanoscroller.min.js"></script>
<head>
 
  <script type="text/javascript">
  	  var loaded = 0;
      jQuery(document).ready(function() {
          jQuery(".lazyLoading").lazy({
		  threshold: 0,
		  bind: "event",
              beforeLoad: function() {
	    	 	loaded++;
	    	 	console.log('loaded '+loaded);
	    	 	//$.post("listOfMedias?type=myFeed&lazyLoadCount="+loaded, function(data, status) {
				//});
              }
            }); 
          $('.nano').nanoScroller();	
	  });  
	
	 /* var loaded = 0;
	  jQuery(document).ready(function() {
		  jQuery('#lazyExam').scroll(function() {
    	 		$.post("listOfMedias?type=myFeed&lazyLoadCount="+2, function(data, status) {
	    	 		console.log('loaded');
    	 			$('#mediaView').html(data);
				});
		  }); 
	  });   */
	  
  </script>
  
</head>

<!-- <table> -->
<%-- <c:set var="userId" value="${userId}" scope="page" /> --%>
<%-- <p>${fn:length(mediaDtoList)}</p> --%>
<c:forEach items="${mediaDtoList}" var="media">
	<%-- <c:set var="userMediaId" value="${media.mediaId}" scope="page"/>
	<c:set var="mediaUserID" value="${media.userEntity.userId}" scope="page"/> --%>
	<div class="media">
        <!-- <a class="pull-left" href="#">
          <img class="media-object" src="resources/images/myfeeds1.gif" alt="...">
        </a> -->
			 <c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml' || media.contentType =='image/bmp'}">
	         	 <a id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
			       <img class="lazyLoading" data-src="<c:url value="${media.mediaPath}" />?t=1391775969" src="<c:url value="${media.mediaPath}" />" width="70" height="70" style="cursor: pointer;"/><br>
			     </a>
	       </c:if>
		   <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/x-ms-wmv' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
			     <a id = '${media.mediaId}'  class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
					 <img class="lazyLoading" data-src="<c:url value="${media.mediaPath}" />?t=1391775969" src="<c:url value="/resources/images/icon_video.gif" />" width="70" height="70" style="cursor: pointer;"/><br>
				</a>
		   </c:if> 
			<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
				<a id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
					<img class="lazyLoading" data-src="<c:url value="${media.mediaPath}" />?t=1391775969" src="<c:url value="/resources/images/icon_audio.gif" />" width="70" height="70" style="cursor: pointer;"/><br>
				</a>
			</c:if>
			
        <div class="media-body">
          <p>
              <span class="feedUserName">${media.mediaName}</span><br />
              <span style="word-wrap: break-word;">${media.mediaComments}</span><br />
             <%-- <c:if test="${userId == media.userEntity.userId}">
				<a data-target="#mediaSendModal1" data-toggle="modal" onclick="loadCommentModal('${media.mediaId}');" style="cursor: pointer;">Send</a>&nbsp;&nbsp; 
                <a data-target="#getCommentsModal2" data-toggle="modal" onclick="getCommentAjax('${media.mediaId}');" style="cursor: pointer;">Comments</a>
	  		 </c:if> --%>
              
              <span class="userInfoClr">${media.created}</span>
              <span class="icon">
                  <a title="Feedback" data-target="#feedBack" data-toggle="modal" onclick="displayFeedBackBox('${media.mediaId}');" href="#">
                      <img src="resources/images/feedback_icon.png" />
                  </a>
              </span>
          </p>
        </div>
      </div>
	
	
</c:forEach>	
	
