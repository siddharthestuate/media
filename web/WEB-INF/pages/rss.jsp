<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String loginUser = (String)request.getSession().getAttribute("userSessionId");%>
<fieldset class="mainSection">
	<legend>
		<span>Headlines</span>
		<div class="sectionSections">
        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
        	<a href="#" id="2"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(2);" >
        		<img src="resources/images/action_1.gif" />
        	</a>
            <a href="#"><img src="resources/images/action_2.gif" /></a>
            <a href="#"><img src="resources/images/action_3.gif" /></a>
        </div>
	</legend>
	<ul class="media-list">
		<li class="media">
			<div class="col-md-9" id="feed" style="height: 100px;">
				<a class="pull-left" href="#"> <img class="media-object"
					src="<c:url value="/resources/images/bigPic1.gif"/>" alt="Article">
				</a>
				<div class="media-body">
					<h4 class="media-heading">Katy and John's 'secret engagement</h4>
					<p>John Mayer and Katy Perry are apparently keeping their
						engagement a secret.</p>

					<p>The brunette sparked rumours when she wore a diamond ring on
						her wedding finger to the MTV EMAs recently. Although it was
						claimed Katy sported the band because it went with her outfit,
						insiders are now saying she has in fact agreed to marry John.</p>

					<p>John is believed to have popped the question just days after
						his brother Carl's wedding at New York's</p>
					<a href="#">Read More...</a>
				</div>
			</div>

			<div class="col-md-3" id="feedTray">
				<ul class="list-unstyled featuredHeading">
					<li><img
						src="<c:url value="/resources/images/sub_heading1.gif"/>" />
						<p>Madonna wins lawsuit over 'Vogue' horn hits</p> <a href="#">Read
							more...</a></li>
					<li><img
						src="<c:url value="/resources/images/sub_heading2.gif"/>" />
						<p>Madonna wins lawsuit over 'Vogue' horn hits</p> <a href="#">Read
							more...</a></li>
					<li><img
						src="<c:url value="/resources/images/sub_heading3.gif"/>" />
						<p>Madonna wins lawsuit over 'Vogue' horn hits</p> <a href="#">Read
							more...</a></li>
				</ul>
			</div>
		</li>
	</ul>


    
    <div class="clearfix"></div>

</fieldset>


<fieldset class="mainSection proofList">
	<legend>
		<span>Proof</span>
		<div class="sectionSections">
       		<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
       		<a href="#" id="3"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(3);">
       			<img src="resources/images/action_1.gif" />
       		</a>
           <a href="#"><img src="resources/images/action_2.gif" /></a>
           <a href="#"><img src="resources/images/action_3.gif" /></a>
        </div>
	</legend>
	</br>
	<ul class="media-list">
		<li class="media">
			<div class="col-md-1">
				<h3>Single</h3>
			</div>
			<div class="col-md-11">
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof1.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof2.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof3.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>

			</div>
		</li>
		<li class="media">
			<div class="col-md-1">
				<h3>EP</h3>
			</div>
			<div class="col-md-11">
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof1.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof2.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof3.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
			</div>
		</li>
		<li class="media">
			<div class="col-md-1">
				<h3>Mixtape</h3>
			</div>
			<div class="col-md-11">
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof1.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof2.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof3.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
			</div>
		</li>
		<li class="media">
			<div class="col-md-1">
				<h3>Album</h3>
			</div>
			<div class="col-md-11">
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof1.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof2.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
				<div class="col-md-4">
					<a class="pull-right" href="#"> <img class="media-object"
						src="<c:url value="/resources/images/proof3.gif"/>" alt="Article">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Artist Name Title</h4>
						<p>Society excited by cottage private an it esteems.</p>
					</div>
				</div>
			</div>
		</li>
	</ul>
</fieldset>

<fieldset class="mainSection">
	<legend>
		<span>Spotlight</span>
		<div class="sectionSections">
        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
        	<a href="#" id="4"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(4);">
        		<img src="resources/images/action_1.gif" />
        	</a>
            <a href="#"><img src="resources/images/action_2.gif" /></a>
            <a href="#"><img src="resources/images/action_3.gif" /></a>
        </div>
     
	</legend>
	</br>
	<div id="displaySpotLight" style="cursor: pointer;">
	<ul>
		 <c:set var="loginuser" value="<%=loginUser %>" scope="page" />
		 <c:set var="count" value="1" scope="page" />
		 <c:set var="flag" value="${false }" scope="page" />
		<c:forEach items="${mediaReview}" var="mediaR">
		<li>
		 		<c:if test="${mediaR.reviewerUserId.userId ==  loginuser || mediaR.userId.userId == loginuser }">
		 			<c:set var="flag" value="${true }" scope="page" />
		 			<%-- <div id="spImg${count }" style="display: "> --%>
		 				<c:set var="count" value="${count+1 }" scope="page" />
		 				<table style="margin-left: ;">
		 					<tr>
		 						<td align="left">
		 							<c:choose>
							  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
							 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="180px" width="200px">
							 			</c:when>
							 		 	<c:otherwise>
							    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="180px" width="200px">
							 		 	</c:otherwise>
									</c:choose>
									
		 						</td>
		 						<td align="center">
			 						<h3 class="media-heading" style="margin-top: -80px;">${mediaR.title}</h3>
			 						${mediaR.comments}
		 						</td>
		 					</tr>
		 					<tr>
		 						<td colspan="2">
		 							<span style="font-size: 14px;"> Name : </span>
		 							<span style="font-size: 14px;color: black; "> ${mediaR.reviewerUserId.firstName} ${mediaR.reviewerUserId.lastName} </span>
		 						</td>
		 					</tr>
		 				</table>
		 		</c:if>
		 	</li>
		 </c:forEach>
	</ul>
	</div>
	 
	<div id="spotLightCount" style="display: none">${count }</div>
	<c:if  test="${!flag }">
		 <a class="pull-left" href="#">
	        <img class="media-object" src="<c:url value="/resources/images/spotlight_1.gif"/>" alt="Article"></a>
				<div class="media-body">
					<h4 class="media-heading">Pharrell Named GQ's Hitmaker Of The
						Year 2013</h4>
					<p>Consulted he eagerness unfeeling deficient existence of.
						Calling nothing end fertile for venture way boy. Esteem spirit
						temper too say adieus who direct esteem. It esteems luckily mr or
						picture placing drawing no. Apartments frequently or motionless on
						reasonable projecting expression. Way mrs end gave tall walk fact
						bed.</p>
	
					<p>
						So delightful up dissimilar by unreserved it connection frequently.
						Do an high room so in paid. Up on cousin ye dinner should in. Sex
						stood tried walls manor truth shy and three his. Their to years so
						child truth. Honoured peculiar families sensible up likewise by on
						in. <a href="#">Read More...</a>
					</p>
				</div></li> 
		</ul>
	</c:if>
</fieldset>

<fieldset class="mainSection chartSection">
	<legend>
		<span>Charts - MML Downloads</span>
		<div class="sectionSections">
        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
        	<a href="#" id="5" data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(5);">
        		<img src="resources/images/action_1.gif" />
        	</a>
            <a href="#"><img src="resources/images/action_2.gif" /></a>
            <a href="#"><img src="resources/images/action_3.gif" /></a>
        </div>
	</legend>
	</br>
	<div id="chartsMML">
		<div class="col-md-6">
	<c:set var="count" value="0" scope="page"></c:set>
	<c:forEach items="${MEDIAS}" var="media">	
	<c:if test="${count < 5 }">
		<c:set var="count" value="${count + 1}" scope="page"></c:set>
			 <div class="chartRow">
				<div class="pull-left">
					<p class="slNumber" style="margin-top: 67px; margin-left: -17px; font-size: 24px;">${count}.</p>
				</div>
				<div class="pull-right text-right chartContent" style="width: 236px; height: 140px">
					<c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv'}">
							<div class="chartType" style="top: 10px">Video</div>
						</c:if>
						<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'  || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave'}">
							<div class="chartType" style="top: 10px">Audio</div>
						</c:if>
						<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg'}">
							<div class="chartType" style="top: 10px">Image</div>
						</c:if>
						<c:set var="repeat" value="1" scope="page"></c:set>
					<table align="right">
						<tr>
							<td align="right"><span class="title" >${media.userEntity.firstName } ${media.userEntity.lastName }</span></td><br />
							<td rowspan="3" colspan="0">
							<span>
								<c:if test="${media.userEntity.contentPath != null}">
									<img src="<c:url value="${media.userEntity.contentPath}" />" width="60px" height="70px" >
								</c:if>
								<c:if test="${media.userEntity.contentPath == null}">
									<img src="/MediaLounge/resources/dummy/dummy.jpg" width="60px" height="70px" >
								</c:if>
							</span>
							</td>
						</tr>
						<tr>
							<td align="right"><a href="">${media.mediaName }</a> | <a href="">${media.mediaName }</a></td> <br /> 
						</tr>
						<tr>
							<td align="right">New | ${media.created } |
							<span class="clrBlue">DL - 44,044</span></td>
						</tr>
					</table>
				</div>
				<div class="clearfix"></div>
			</div>
	</c:if>
	</c:forEach>			
	</div>
	
	<div class="col-md-6">
	<c:set var="count" value="0" scope="page"></c:set>
	<c:forEach items="${MEDIAS}" var="media">	
	<c:set var="count" value="${count + 1}" scope="page"></c:set>
	<c:if test="${count > 5 }">
			<div class="chartRow">
				<div class="pull-left">
					<p class="slNumber" style="margin-top: 67px; margin-left: -26px; font-size: 24px;">${count }.</p>
				</div>
				<div class="pull-right text-right chartContent" style="width: 236px; height: 140px">
					<c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv' }">
							<div class="chartType" style="top: 10px">Video</div>
						</c:if>
						<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm' || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave'}">
							<div class="chartType" style="top: 10px">Audio</div>
						</c:if>
						<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg'}">
							<div class="chartType" style="top: 10px">Image</div>
						</c:if>
						<c:set var="repeat" value="1" scope="page"></c:set>
						<table align="right">
						<tr>
							<td align="right"><span class="title" >${media.userEntity.firstName } ${media.userEntity.lastName }</span></td><br />
							<td rowspan="3" colspan="0">
							<span>
								<c:if test="${media.userEntity.contentPath != null}">
									<img src="<c:url value="${media.userEntity.contentPath}" />" width="60px" height="70px" >
								</c:if>
								<c:if test="${media.userEntity.contentPath == null}">
									<img src="/MediaLounge/resources/dummy/dummy.jpg" width="60px" height="70px" >
								</c:if>
							</span>
							</td>
						</tr>
						<tr>
							<td align="right"><a href="">${media.mediaName }</a> | <a href="">${media.mediaName }</a></td> <br /> 
						</tr>
						<tr>
							<td align="right">New | ${media.created } |
							<span class="clrBlue">DL - 44,044</span></td>
						</tr>
					</table>
				</div>
				<div class="clearfix"></div>
				</div>
	</c:if>
	</c:forEach>
	</div>
	</div>
	<div class="clearfix"></div>
	<p class="text-center chartPagination">
		<a onclick="loadPopularVideos()" style="cursor: pointer;text-decoration:none;">Album</a><a class="paginationLeft" onclick="loadPopularVideos()" style="cursor: pointer;"></a>
		<a class="paginationRight" onclick="loadCharts()" style="cursor: pointer;"></a><a onclick="loadCharts()" style="cursor: pointer;text-decoration:none;">Newcomers</a>
	</p>
</fieldset>


