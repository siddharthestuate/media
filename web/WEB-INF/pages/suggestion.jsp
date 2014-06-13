<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<button type="button" class="btn btn-primary" id="Reviews" onclick="" style="cursor: pointer;">Reviews</button>&nbsp;&nbsp;</br>
    <c:set var="count" value="0" scope="page"/>
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example" style="width: 100%; margin-top: 15px;" align="center">
		<tr align="center">
			<td style="background-color: #3276B1;color: #fff;">Media</td>
			<td style="background-color: #3276B1;color: #fff;">From</td>
			<td style="background-color: #3276B1;color: #fff;">Type</td>
			<td style="background-color: #3276B1;color: #fff;">Suggestion</td>
			<td style="background-color: #3276B1;color: #fff;" colspan="2">Action</td>
		</tr>
		
	<c:forEach items="${suggestionList }" var="sugg">
		<c:set var="count" value="${count+1 }" scope="page"/>
		<tr>
			<td>${sugg.mediaId.mediaName  }</br>
				<c:if test="${sugg.mediaId.contentType =='video/mp4' || sugg.mediaId.contentType =='video/mpeg' || sugg.mediaId.contentType =='video/ogg' || sugg.mediaId.contentType =='video/quicktime' || sugg.mediaId.contentType =='video/webm' || sugg.mediaId.contentType =='video/x-ms-wmv' ||  sugg.mediaId.contentType == 'video/xflv' || sugg.mediaId.contentType == 'video/x-flv' }">
					<video  id="${count }"  width="130px" height="60px" onclick="playVid('${count }')" style="cursor: pointer;" ><source src ="<c:url value="${sugg.mediaId.mediaPath }"></c:url>"></video>
				</c:if>
				<c:if test="${sugg.mediaId.contentType =='audio/mp3' || sugg.mediaId.contentType =='audio/basic' || sugg.mediaId.contentType =='audio/L24' || sugg.mediaId.contentType =='audio/mpeg' || sugg.mediaId.contentType =='audio/webm'  || sugg.mediaId.contentType =='audio/ogg' || sugg.mediaId.contentType =='audio/vorbis' || sugg.mediaId.contentType =='audio/vnd.rn-realaudio' || sugg.mediaId.contentType =='audio/vnd.wave' }">
					<audio controls preload="metadata"><source src ="<c:url value="${sugg.mediaId.mediaPath }"></c:url>" type="audio/mpeg"></audio>
				</c:if>
				<c:if test="${sugg.mediaId.contentType =='image/jpeg' || sugg.mediaId.contentType =='image/png' || sugg.mediaId.contentType =='image/gif' || sugg.mediaId.contentType =='image/pjpeg' || sugg.mediaId.contentType =='image/tiff' || sugg.mediaId.contentType =='image/svg+xml' || sugg.mediaId.contentType =='image/jpg'}">
					<img src="<c:url value="${sugg.mediaId.mediaPath }" ></c:url>" width="130px" height="60px" style="cursor: pointer;">
				</c:if>
			</td>
			<td>${sugg.userId.firstName } ${sugg.userId.lastName }</td>
			<td>${sugg.type }
				<c:if test="${sugg.type =='journalist'}">
					<br/><br/>Publish<input type="checkbox" name="publishMedia"  id="publishMedia${count }"> 
				</c:if>
			</td>
			<td>
				<textarea id="suggestionFeedback${count }"  name="suggestion" style="width:245px; height: 90px"></textarea>
				</br>
				<span  id="inputSuggestion${count }"  style="color: orange; font-size: 12px; height: 20px"></span> 
			</td>
			<td>
				<input type="button" class="btn btn-primary" value="Send" style="padding: 3px 6px" onclick="saveSuggestion('${count }','${sugg.mediaReviewId }')" >
			</td>
			<td>
				<input type="button" class="btn btn-primary" value="Ignore" style="padding: 3px 6px" onclick="ignoreSuggestion('${count }','${sugg.mediaReviewId }')" >
			</td>
		</tr>
	</c:forEach>
	<c:if test="${count == 0 }">
		<tr>
			<td colspan="5" align="center">
				<h3>No Data Available!!</h3>
			</td>
		</tr>
	</c:if>	
	</table>

</div>