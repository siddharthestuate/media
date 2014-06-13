<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contentType" value="${contentType}" scope="page"/>
<c:set var="contentPath" value="${contentPath}" scope="page"/>
<script type="text/javascript">

	$( document ).ready(function() {
	    
	});
	
</script>
<table border="1">
	<c:if test="${contentType =='image/jpeg' || contentType =='image/png' || contentType =='image/gif' || contentType =='image/pjpeg' || contentType =='image/tiff' || contentType =='text/xml'}"></center>
	 <center> <img class="media-object" src="<c:url value="${contentPath}" />" width="350" height="350" alt="..."/><br>
	</c:if>
	<c:if test="${contentType =='video/mp4' || contentType =='video/x-ms-wmv' || contentType =='video/mpeg' || contentType =='video/ogg' || contentType =='video/quicktime' || contentType =='video/webm'}">
		<center> <video width="350" height="350" autoplay>
			 <source src="<c:url value="${contentPath}" />" type="video/mp4">
		 </video></center><br>
	</c:if>
	<c:if test="${contentType =='audio/mp3' || contentType =='audio/basic' || contentType =='audio/L24' || contentType =='audio/mpeg' || contentType =='audio/webm'}">
		<center><audio controls preload="metadata">
			<source src="<c:url value="${contentPath}" />" type="audio/mpeg"></source>
		</audio></center><br>
	</c:if>	 
</table>