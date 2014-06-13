<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${mediaDetails}" var="media">
		<%-- <input type="hidden" id="feeBackmediaId" value="${media.mediaId}"/> --%>
		<div class="row">
	        	<div class="col-md-6">
	                <div class="pull-left">
	                <c:choose>
		                <c:when test="${empty media.userEntity.contentPath}">
		                	 <img src='<c:url value="/resources/dummy/dummy.jpg" />' width="39" height="39" />
		                </c:when>
		                 <c:otherwise>
		                    <img src='<c:url value="${media.userEntity.contentPath}" />' width="39" height="39" />
		                 </c:otherwise>
	                 </c:choose>
	                </div>
	                
	                
		                <div class="pull-left connection">
		                	 <h4>${media.userEntity.firstName}&nbsp;${media.userEntity.lastName}</h4>
		                    <p>Connection: <span class="clrBlue">1st</span></p>
		                </div>
	            </div>
	            
	            <div class="col-md-4 postInfo">
					<h4>${media.mediaName}</h4>
	                <p>${timeSincePost}</p>
	               
	                
	                <span class="" ><a class="tryitbtn" id="feebackTotalUsers" ><c:out value = "${fn:length(previousFeedbackOfParticularMedia)}"/></a></span>
	            </div>
	            
	            <div class="col-md-2 text-right">
	            	<img src="resources/images/feedback_share.png" /><br />
					<img src="resources/images/feedback_icon_yellow.png" class="feedback_share" />
	            </div>
	            
	            <div class="clearfix"></div>
	         </div>
	         
	         <!-- <textarea id="feedback_message"> -->
	         <div id="feedback_message" style="width: 100%; border: 2px solid;color:red" >
	        	 <c:set var="redCount" value="0" scope="page" />
	        	  <c:set var="greenCount" value="0" scope="page" />
	        	  <c:set var="amberCount" value="0" scope="page" />
		         <%-- <table border="1" style="width: 100%">
		         	<c:forEach items="${previousFeedbackOfParticularMedia}" var="previousFeedback">
		         		<tr>
		         			<td>
		         				<table frame="box" style="width: 100%">
					         		<tr>
					         			<td width="8%">Name&nbsp;&nbsp;&nbsp;&nbsp;   :</td>
					         			<td>${previousFeedback.feedbackUserDetails.firstName} ${previousFeedback.feedbackUserDetails.lastName}</td>
					         		</tr>
					         			<td>Keyword :</td>
					         			<c:choose>
					         				 <c:when test="${previousFeedback.colour == 'amber'}">
					         				  	<c:set var="amberCount" value="${amberCount + 1}" scope="page"/>
					         				 	<td><a class="tryitbtn" style="background-color:#FFC200;color:#FFFFFF">${previousFeedback.mediaSearchKey}</a></td>
					         				 </c:when>
					         				  <c:when test="${previousFeedback.colour == 'green'}">
					         				  	<c:set var="greenCount" value="${greenCount + 1}" scope="page"/>
					         				 	<td><a class="tryitbtn" style="background-color:#8AC007;color:#FFFFFF">${previousFeedback.mediaSearchKey}</a></td>
					         				 </c:when>
					         				 <c:otherwise>
					         				 	<c:set var="redCount" value="${redCount + 1}" scope="page"/>
					         				 	<td><a class="tryitbtn" style="background-color:#FF0000;color:#FFFFFF">${previousFeedback.mediaSearchKey}</a></td>
					         				 </c:otherwise>
					         			</c:choose>
					         			
					         		</tr>
					         		<tr>
					         			<td colspan="2">${previousFeedback.description}</td>
					         		</tr>
					         	</table>
					         </td>
					     </tr>    
		         	</c:forEach>
		         </table> --%>
		         <c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml'}">
			       <img class="media-object" src="<c:url value="${media.mediaPath}" />"  height="200" style="cursor: pointer;" /><br>
			      </c:if>
			      
			      <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
					<video id="videoFile" width="270" height="200" controls><source src="<c:url value="${media.mediaPath}" />" type="video/mp4"   ></video>
				  </c:if>
				  
				  <c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
					<center><audio controls preload="metadata">
						<source src="<c:url value="${contentPath}" />" type="audio/mpeg"></source>
					</audio></center>
				  </c:if>
		         
		         <c:forEach items="${previousFeedbackOfParticularMedia}" var="previousFeedback">
		         	<c:choose>
	       				 <c:when test="${previousFeedback.colour == 'amber'}">
	       				  	<c:set var="amberCount" value="${amberCount + 1}" scope="page"/>
	       				 </c:when>
	       				  <c:when test="${previousFeedback.colour == 'green'}">
	       				  	<c:set var="greenCount" value="${greenCount + 1}" scope="page"/>
	       				 </c:when>
	       				 <c:otherwise>
	       				 	<c:set var="redCount" value="${redCount + 1}" scope="page"/>
	       				 </c:otherwise>
	       			</c:choose>
					</c:forEach>
		        <%--  <p> red : <c:out value="${redCount}" />&nbsp; green : <c:out value="${greenCount}" />&nbsp; amber : <c:out value="${amberCount}" /></p> --%> 
		         <script>
		         		//alert( '${redCount}');
		         		
		         		if((parseInt('${redCount}') >= '${greenCount}') &&  (parseInt('${redCount}') >= '${amberCount}')){
		         			//alert("redCount");
		         			$('#feebackTotalUsers').css('backgroundColor','red');
		         			$('#feebackTotalUsers').css('color','#FFFFFF');
		         		}
		         		else if((parseInt('${amberCount}') >= '${greenCount}') &&  (parseInt('${amberCount}') >= '${redCount}')){
		         			//alert("amberCount");
		         			$('#feebackTotalUsers').css('backgroundColor','#FFC200');
		         			$('#feebackTotalUsers').css('color','#FFFFFF');
		         		}
		         		else if((parseInt('${greenCount}') >= '${amberCount}') &&  (parseInt('${greenCount}') >= '${redCount}')){
		         			//alert("greenCount");
		         			$('#feebackTotalUsers').css('backgroundColor','green');
		         			$('#feebackTotalUsers').css('color','#FFFFFF');
		         		}
		         		if((parseInt('${redCount}') == 0) && (parseInt('${greenCount}') == 0) && (parseInt('${amberCount}') == 0)){
		         			$('#feebackTotalUsers').css('backgroundColor','#808080');
		         			$('#feebackTotalUsers').css('color','#FFFFFF');
		         		}
		         </script>
	         </div>
	        <br/><br/>
	        <%--  <div id="newFeedBack" style="overflow:hidden; ;height:36px;border: 2px solid;color: red ">
		         <c:set var="keywords" value="${fn:split(media.mediaSearchKey,',')}" />
		         <c:set var="uniquekeyWordId" value="0" scope="page" />
		         <b>Keyword(s) : </b>
		         <c:forEach items="${keywords}" var="keyword">
		         	<input type="hidden" id="hid_${uniquekeyWordId}" value="rgb(128, 128, 128)">
		         	 <a target="_blank" id="keyword_${uniquekeyWordId}" onclick="changeKeywordColor('${uniquekeyWordId}','${media.mediaId}')" onmouseover="changeKeywordColorMouseIn('${uniquekeyWordId}')" onmouseout="changeKeywordColorMouseOut('${uniquekeyWordId}')"" class="tryitbtn" style="background-color:#808080;color:#FFFFFF" ><c:out value="${fn:trim(keyword)}"/></a>
		         	<c:set var="uniquekeyWordId" value="${uniquekeyWordId + 1}" scope="page"/>
		         </c:forEach>
		         
	         </div> --%>
	          
	         
	         
	         
	</c:forEach>