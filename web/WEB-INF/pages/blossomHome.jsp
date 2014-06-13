<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">

<style>
 	.tdClass{
 		font-weight: bold;
 	} 
 	/* .displayMedia{
 		display: block
 	} */
</style>
<style>

#previousReviewBlossomTable1  tr th thead {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}

#previousReviewBlossomTable2 tr th thead  {
	background-color: #0076A2;
	padding: 5px;
	color: #fff;
}

#previousReviewBlossomTable3 tr th thead  {
	background-color: #0076A2;
	padding: 5px;
	color: #fff;
}

</style>

<script>
	
	/* $(document).ready(function () {
        $('.displayMedia').hide();
        
        $('#mediaName').change(function () {
            $('.displayMedia').hide();
            $('#choosedMedia'+$(this).val()).show();
        });
    }); */
</script>

 <script>
	$('#previousReviewBlossomTable1').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
	
	$('#previousReviewBlossomTable2').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
	
	$('#previousReviewBlossomTable3').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
	
</script>   

<c:set var="count" value="${LENGTH }" scope="page"/>

<button type="button" class="btn btn-primary" id="sentBlossom" onclick="blossomSuggestion()">Sent</button>
<button type="button" class="btn btn-primary" id="newBlossomButton" onclick="newBlossom()">New</button>
<button type="button" class="btn btn-primary" id="pendingBlossom" onclick="pendingBlossom()">Pending </button>
<button type="button" class="btn btn-primary" id="receivedBlossom" onclick="receivedBlossom()">Received</button><br/><br/>


<div id="previousReview">
	<table  style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="1" class="table table-striped table-bordered" id="previousReviewBlossomTable1"  >
		<%-- <c:if test="${count > 0 }"> --%>
			<thead style="background-color: #3276B1; color: white;">
				<tr style="align: center">
					<th>To</th>
					<th>Media Name</th>
					<th>Type</th>
					<th>Title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${REVIEWLIST}" var="review">
					<tr>
						<td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${review.reviewerUserId.firstName }	${review.reviewerUserId.lastName }</p></td>
						<td><p style="word-wrap: break-word !important; width: 140px !important; display: block; position: relative;">${review.mediaId.mediaName }</p></td>
						<td>
							<c:if test="${review.type == 'journalist'}">LAIF Review</c:if> 
							<c:if test="${review.type == 'vs' }">Air-Play Review</c:if>
							<c:if test="${review.type == 'dj' }">PAO Review</c:if> 
							<c:if test="${review.type == 'anchor' }">IMC Review</c:if>
						</td>
						<td><p style="word-wrap: break-word !important; width: 140px !important; display: block; position: relative;">${review.title }</p></td>
					</tr>
				</c:forEach>
			</tbody>
		<%-- </c:if> --%>
		<%-- <c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if> --%>
  </table>
</div>

<div id="newBlossom" style="display: none;margin-top: 15px;" >
	<div class="panel panel-default" style="width: 100%;">
     	<div class="panel-heading">
            &nbsp;&nbsp;Suggestion
         </div>
          <div class="panel-body">
             <div class="form-horizontal">
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Media Name <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9 form_dropdown">
						<select id="mediaName" class="form-control" onchange="">
							<option value="">Select</option>
							<c:forEach items="${MEDIALIST}" var="media" >
								<option value="${media.mediaId }">${media.mediaName }</option>
							</c:forEach>
						</select>
						<span id="errorMediaName" style="color: orange;"></span>
	                 </div>
	                 <%-- <c:forEach items="${MEDIALIST}" var="media" >
						<div id="choosedMedia${media.mediaId }" class="displayMedia">
							<c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv' }">
								<video  id="videoFile"  height="40px" width="180px"  style="cursor: pointer;" controls><source src ="<c:url value="${media.mediaPath }"></c:url>"></video>
								<img src="<c:url value="/resources/images/icon_video.gif" />" width="60px" height="30px" style="cursor: pointer;" onclick="showChoosenMediaPopUp('${media.contentType }','${media.mediaPath }','${media.mediaName }');" data-toggle="modal" data-target="#showChoosedMedia"/>
							</c:if>
							<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'  || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave' }">
								<audio controls preload="metadata" style="height: 30px; width: 180px;"><source src ="<c:url value="${media.mediaPath }"></c:url>" type="audio/mpeg"></audio>
								<img src="<c:url value="/resources/images/icon_audio.gif" />" width="60px" height="30px" style="cursor: pointer;" onclick="showChoosenMediaPopUp('${media.contentType }','${media.mediaPath }','${media.mediaName }');" data-toggle="modal" data-target="#showChoosedMedia"/>
							</c:if>
							<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg'}">
								<img src="<c:url value="${media.mediaPath }" ></c:url>" height="30px" width="60px" style="cursor: pointer;" onclick="showChoosenMediaPopUp('${media.contentType }','${media.mediaPath }','${media.mediaName }');" data-toggle="modal" data-target="#showChoosedMedia">
							</c:if>
						</div>
					</c:forEach> --%>
						<!-- <img src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" style="float: left"> -->
	             </div>
	              <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Expert Type <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9 form_dropdown">
						<select id="userType" class="form-control" onchange="loadUserType(this.value);">
							<option value="">Select</option>
							<option value="vs">Air Play Review</option>
							<option value="dj">PAO Review</option>
							<option value="anchor ">IMC Review</option>
							<option value="journalist">LAIF Review</option>
						</select>
						<span id="errorExpertType" style="color: orange;"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">
	                     Experts List <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                    <div id="loadUsersByType"></div>
						<span id="errorExpertName" style="color: orange;"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">
	                     Title <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <input type="text" id="userTitle" name="userTitle" maxlength="20" class="form-control form_textbox" onkeyup="userTitleValidation()">
	                     <span style="font-size: x-small;float: right; margin: 0px 70px; margin-top: -23px;">(Max 20 characters)</span>
	                     <span id="errorTitle" style="color: orange;"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Description</label>
	                 <div class="col-sm-9">
	                     <textarea id="userComments" maxlength="400" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;"></textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 400 characters)</span>
	                 </div>
	             </div>
	             <div style="clear:both"><br/></div>
	             <div class="form-group last">
	                 <div class="col-sm-offset-3 col-sm-9">
	                 	<button type="button" class="btn btn-primary" onclick="return saveRecords();">Send</button>
	                 </div>
	             </div>
             </div><!-- class="form-horizontal" -->
         </div> <!--class="panel-body"  -->
     </div><!--class="panel panel-default"  -->
</div><!--  -->


<div id="pendingReview" style="display: none;">
	<table style="cellpadding:0; cellspacing:0;border:0;" class="table table-striped table-bordered" id="previousReviewBlossomTable2" >
		<%-- <c:if test="${count > 0 }"> --%>
			<thead style="background-color: #3276B1; color: white;">
				<tr align="center">
					<th>To</th>
					<th>Media Name</th>
					<th>Type</th>
					<th>Title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${REVIEWLIST}" var="review">
					<c:if test="${review.comments == null && review.reviewStatus == 'Viewed'}">
						<tr>
							<td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${review.reviewerUserId.firstName } ${review.reviewerUserId.lastName }</p></td>
							<td><p style="word-wrap: break-word !important; width: 140px !important; display: block; position: relative;">${review.mediaId.mediaName }</p></td>
							<td>
								<c:if test="${review.type == 'journalist' }">LAIF Review</c:if>
								<c:if test="${review.type == 'vs' }">Air-Play Review</c:if>
								<c:if test="${review.type == 'dj' }">PAO Review</c:if> 
								<c:if test="${review.type == 'anchor' }">IMC Review</c:if>
							</td>
							<td><p style="word-wrap: break-word !important; width: 140px !important; display: block; position: relative;">${review.title }</p></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		<%-- </c:if>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if> --%>
	</table>
</div>

<div id="receivedReview" style="display: none;">
	<table style="cellpadding:0; cellspacing:0;border:0;" class="table table-striped table-bordered" id="previousReviewBlossomTable3" >
		<%-- <c:if test="${count > 0 }"> --%>
			<thead style="background-color: #3276B1; color: white;">
				<tr align="center">
					<th>From</th>
					<th>Media Name</th>
					<th>Type</th>
					<th>Title</th>
					<th style="text-align: center">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${REVIEWLIST}" var="review">
					<c:if test="${review.comments != null && review.reviewStatus == 'Viewed' }">
						<tr>
							<td><p style="word-wrap: break-word !important; width: 130px !important; display: block; position: relative;">${review.reviewerUserId.firstName} ${review.reviewerUserId.lastName}</p></td>
							<td><p style="word-wrap: break-word !important; width: 120px !important; display: block; position: relative;">${review.mediaId.mediaName}</p></td>
							<td>
								<c:if test="${review.type == 'journalist' }">LAIF Review</c:if>
								<c:if test="${review.type == 'vs' }">Air-Play Review</c:if>
								<c:if test="${review.type == 'dj' }">PAO Review</c:if>
								<c:if test="${review.type == 'anchor' }">IMC Review</c:if>
							</td>
							<td><p style="word-wrap: break-word !important; width: 120px !important; display: block; position: relative;">${review.title }</p></td>
							<td style="text-align: center"><input type="button" class="btn btn-primary" value="View" onclick="viewReview('${review.mediaReviewId }')"></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		<%-- </c:if>
		<c:if test="${count == 0 }">
			<h3>No Records Found !!</h3>
		</c:if> --%>
	</table>
</div>
