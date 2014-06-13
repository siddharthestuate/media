<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@page import="java.util.ArrayList"%>

<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />

<style>
#archiveTbl tr th {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}
</style>
 <script>
	$('#archiveTbl').dataTable( {
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	} );
</script>
<h4 class="modal-title" id="myModalLabel"><center>Archive</center></h4> 
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="archiveTbl">
	<thead>
         <tr>
           	<th>Media Name</th>
            <th>View</th>
            <th>FMF</th>
            <th>Comments</th>
            <th>Media Key</th>
         </tr>
     </thead>
     <tbody>
     	<c:set var="count" value="1" scope="page" />
     	<c:forEach items="${mediaDtoList}" var="media">
	            <tr>
	            	<td>${media.mediaName}</td>
	            	<td>
	            		<a style="cursor: pointer;" id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
						<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml'}">
					       <img class="media-object" src="<c:url value="${media.mediaPath}" />" width="30" height="25" alt="..."/><br>
					     </c:if>
					     </a>
					     <a style="cursor: pointer;" id = '${media.mediaId}'  class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
					     <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
							 <%-- <video id="video1" width="70" height="90"><!--  controls autoplay -->
								 <source src="/MediaLounge/resources${media.mediaPath}" type="video/mp4">
							 </video> <br> --%>
							 <img class="media-object" src="<c:url value="/resources/images/icon_video.gif" />" width="30" height="30" alt="..."/><br>
						</c:if> 
						</a>
						<a style="cursor: pointer;" id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
						<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
							<%-- <audio controls preload="metadata">
								<source src="/MediaLounge/resources${media.mediaPath}" type="audio/mpeg"></source>
							</audio><br> --%>
							<img class="media-object" src="<c:url value="/resources/images/icon_audio.gif" />" width="30" height="30" alt="..."/><br>
						</c:if>	
						</a>
	            	</td>
	            	<td style="text-align: center">
	            	    <c:if test="${media.mediaFmf == 'Y'}">
	            	    	<input type="radio" name="fmf" value="Y" <c:if test="${media.mediaFmf=='Y'}">checked </c:if> onclick="fmfActive(${media.mediaId});" />
	            	    </c:if>
	            	    <c:if test="${media.mediaFmf == 'N'}">
	            	    	<input type="radio" name="fmf" value="N" onclick="fmfActive(${media.mediaId});" />
	            	    </c:if>
				    </td>
	            	<td><p style="word-wrap: break-word !important; width: 200px !important; display: block; position: relative;">${media.mediaComments}</p></td>
	            	<td><p style="word-wrap: break-word !important; width: 100px !important; display: block; position: relative;">${media.mediaSearchKey}</p></td>
	            </tr>
	            <c:set var="count" value="${count + 1}" scope="page"/>
	        </c:forEach>
     </tbody>
</table>
