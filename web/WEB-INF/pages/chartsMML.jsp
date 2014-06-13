<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-6">
	<c:set var="count" value="0" scope="page"></c:set>
	<c:forEach items="${MEDIAS}" var="media" begin="0" end="4">
		<c:set var="count" value="${count + 1}" scope="page"></c:set>
		<div class="chartRow">
			<div class="pull-left">
				<p class="slNumber">${count }.</p>
			</div>
			<div class="pull-right text-right chartContent">
				<!-- <div class="chartType">Video</div> -->
				<c:if
					test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv' }">
					<div class="chartType" style="margin-left: -20px;">Video</div>
				</c:if>
				<c:if
					test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm' || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave'}">
					<div class="chartType" style="margin-left: -20px;">Audio</div>
				</c:if>
				<c:if
					test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg' || media.contentType =='image/bmp'}">
					<div class="chartType" style="margin-left: -20px;">Image</div>
				</c:if>
				<p>
					<span class="title">${media.userEntity.firstName }
						${media.userEntity.lastName }</span><br /> <a href="#">${media.mediaName
						}</a> | <a href="#">Blurred Lines</a><br /> New | ${media.created } |
					<span class="clrBlue">DL - 44,044</span>
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</c:forEach>
</div>

<div class="col-md-6">
	<c:forEach items="${MEDIAS}" var="media" begin="5" end="9">
		<c:set var="count" value="${count + 1}" scope="page"></c:set>
		<div class="chartRow">
			<div class="pull-left">
				<p class="slNumber">${count }.</p>
			</div>
			<div class="pull-right text-right chartContent">
				<!-- <div class="chartType">Video</div> -->
				<c:if
					test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv' }">
					<div class="chartType" style="margin-left: -20px;">Video</div>
				</c:if>
				<c:if
					test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm' || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave'}">
					<div class="chartType" style="margin-left: -20px;">Audio</div>
				</c:if>
				<c:if
					test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg' || media.contentType =='image/bmp'}">
					<div class="chartType" style="margin-left: -20px;">Image</div>
				</c:if>
				<p>
					<span class="title">${media.userEntity.firstName }
						${media.userEntity.lastName }</span><br /> <a href="#">${media.mediaName
						}</a> | <a href="#">Blurred Lines</a><br /> New | ${media.created } |
					<span class="clrBlue">DL - 44,044</span>
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</c:forEach>
</div>
