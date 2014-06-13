<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<c:forEach items="${REVIEWDETAILS}" var="review">
		<table>
			<tr>
				<td style="color: black;">User Details :</td>
			</tr>
			<tr>
				<c:if test="${review.reviewerUserId.contentPath == null}">
					<td rowspan="3" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="100px" ></td>
				</c:if>
				<c:if test="${review.reviewerUserId.contentPath != null}">
				<td rowspan="3" ><img src="<c:url value="${review.reviewerUserId.contentPath}" />" width="100px" height="100px" /></td>
				</c:if>
				<td>
				<table>
					<tr><td style="color: #00AFEC; margin-top: 2px;">&nbsp;&nbsp;${review.reviewerUserId.firstName } ${review.reviewerUserId.lastName}</td></tr>
					<tr><td style="margin-bottom: ">&nbsp;&nbsp;${review.reviewerUserId.email }</td></tr>
					<tr><td style="margin-bottom: 2px ">&nbsp;&nbsp;${review.reviewerUserId.country }</td></tr>
				</table>
				</td>
			</tr>
		</table>
		<table>
		<tr> 
			<td style="color: black;">Media File Name : <span style="color: #00AFEC">${review.mediaId.mediaName  }</span></td>
		</tr>
		<tr>
			<td>
				<c:if test="${review.mediaId.contentType =='video/mp4' || review.mediaId.contentType =='video/mpeg' || review.mediaId.contentType =='video/ogg' || review.mediaId.contentType =='video/quicktime' || review.mediaId.contentType =='video/webm' || review.mediaId.contentType =='video/x-ms-wmv' ||  review.mediaId.contentType == 'video/xflv' || review.mediaId.contentType == 'video/x-flv' }">
					<%-- <video  id="${count }"  width="200px" height="100px" onclick="playVid('${count }')" style="cursor: pointer;" ><source src ="<c:url value="${review.mediaId.mediaPath }"></c:url>"></video> --%>
					<video id="videoFile" width="180px" height="110" controls><source src="<c:url value="${review.mediaId.mediaPath}" />" ></video>
				</c:if>
				<c:if test="${review.mediaId.contentType =='audio/mp3' || review.mediaId.contentType =='audio/basic' || review.mediaId.contentType =='audio/L24' || review.mediaId.contentType =='audio/mpeg' || review.mediaId.contentType =='audio/webm'  || review.mediaId.contentType =='audio/ogg' || review.mediaId.contentType =='audio/vorbis' || review.mediaId.contentType =='audio/vnd.rn-realaudio' || review.mediaId.contentType =='audio/vnd.wave' }">
					<audio controls preload="metadata"><source src ="<c:url value="${review.mediaId.mediaPath }"/>" type="audio/mpeg" ></audio>
				</c:if>
				<c:if test="${review.mediaId.contentType =='image/jpeg' || review.mediaId.contentType =='image/png' || review.mediaId.contentType =='image/gif' || review.mediaId.contentType =='image/pjpeg' || review.mediaId.contentType =='image/tiff' || review.mediaId.contentType =='image/svg+xml' || review.mediaId.contentType =='image/jpg'}">
					<img src="<c:url value="${review.mediaId.mediaPath }" />" width="200px" height="100px" style="cursor: pointer;" />
				</c:if>
			</td></tr>
		</tr>
		<tr> 
			<td style="color: black;">Comments : <span style="color: #00AFEC"><p style="word-wrap: break-word !important; width: 500px !important; display: block; position: relative;">${review.comments }</p></span></td>
		</tr>
		<tr> 
			<td style="color: black;">Keyword : <span style="color: #00AFEC">${review.keyword }</span></td>
		</tr>
		<tr>
			<c:if test="${review.publish == 'Y' }">
			<td>
				<input type="button" class="btn btn-primary" value="Publish" onclick="publishReview('${review.mediaReviewId}')" style="float: right; " >
			</td>
			</c:if>
			<td>
				<input type="button" class="btn btn-primary" value="Back" onclick="blossomSuggestion()" style="float: right; " >
			</td>
		</tr>
	</table></br>
	</c:forEach>
</div>