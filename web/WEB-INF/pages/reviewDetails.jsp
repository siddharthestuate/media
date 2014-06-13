<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="count" value="0" scope="page"/>
<div>
	<c:forEach items="${REVIEWDETAILS}" var="review">
	<c:set var="count" value="${count+1 }" scope="page"/>
		<table>
			<tr> 
				<td style="color: black;">User Details :</td>
			</tr>
			<tr>
				<c:if test="${review.userId.contentPath == null}">
					<td rowspan="3" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="100px" ></td>
				</c:if>
				<c:if test="${review.userId.contentPath != null}">
				<td rowspan="3" ><img src="<c:url value="${review.userId.contentPath}" />" width="100px" height="100px" ></td>
				</c:if>
				<td>
				<table>
					<tr><td style="color: #00AFEC; margin-top: 2px;">&nbsp;&nbsp;${review.userId.firstName } ${review.userId.lastName}</td></tr>
					<tr><td style="margin-bottom: ">&nbsp;&nbsp;${review.userId.email }</td></tr>
					<tr><td style="margin-bottom: 2px ">&nbsp;&nbsp;${review.userId.country }</td></tr>
				</table>
				</td>
			</tr>
		</table>
	</br>
	<table>
		<tr> 
			<td style="color: black;">Media File Name :<span style="color: #00AFEC"> ${review.mediaId.mediaName  }</span></td>
		</tr>
		<tr>
			<td>
				<c:if test="${review.mediaId.contentType =='video/mp4' || review.mediaId.contentType =='video/mpeg' || review.mediaId.contentType =='video/ogg' || review.mediaId.contentType =='video/quicktime' || review.mediaId.contentType =='video/webm' || review.mediaId.contentType =='video/x-ms-wmv' ||  review.mediaId.contentType == 'video/xflv' || review.mediaId.contentType == 'video/x-flv' }">
					<video  id="videoFile"  width="180px" height="100px"  style="cursor: pointer;" controls><source src ="<c:url value="${review.mediaId.mediaPath }"></c:url>"></video>
				</c:if>
				<c:if test="${review.mediaId.contentType =='audio/mp3' || review.mediaId.contentType =='audio/basic' || review.mediaId.contentType =='audio/L24' || review.mediaId.contentType =='audio/mpeg' || review.mediaId.contentType =='audio/webm'  || review.mediaId.contentType =='audio/ogg' || review.mediaId.contentType =='audio/vorbis' || review.mediaId.contentType =='audio/vnd.rn-realaudio' || review.mediaId.contentType =='audio/vnd.wave' }">
					<audio controls preload="metadata"><source src ="<c:url value="${review.mediaId.mediaPath }"></c:url>" type="audio/mpeg"></audio>
				</c:if>
				<c:if test="${review.mediaId.contentType =='image/jpeg' || review.mediaId.contentType =='image/png' || review.mediaId.contentType =='image/gif' || review.mediaId.contentType =='image/pjpeg' || review.mediaId.contentType =='image/tiff' || review.mediaId.contentType =='image/svg+xml' || review.mediaId.contentType =='image/jpg'}">
					<img src="<c:url value="${review.mediaId.mediaPath }" ></c:url>" width="200px" height="100px" style="cursor: pointer;">
				</c:if>
			</td>
		</tr>
		<tr>
			<td style="color: black;">Added :<span  style="color: #00AFEC">${review.mediaId.created }</span></td>
		</tr>
		<tr>
			<td>
			 <c:set var="keywords" value="${fn:split(review.mediaId.mediaSearchKey,',')}" />
			 <b>KeyWord(s) : </b>
			 <c:set var="uniquekeyWordId" value="1" scope="page" />
			 <c:forEach items="${keywords}" var="keyword">
			 	 <input type="hidden" value ="${fn:trim(keyword)}" id="key${uniquekeyWordId }">
	         	 <a target="_blank" id="keyButton${uniquekeyWordId }" onclick="giveSuggestion('${uniquekeyWordId }')" class="tryitbtn" style="background-color:#808080;color:#FFFFFF" ><c:out value="${fn:trim(keyword)}"/></a>
	         <c:set var="uniquekeyWordId" value="${uniquekeyWordId + 1}" scope="page"/>
	         </c:forEach>
	         <input type="hidden" id="total" value="${uniquekeyWordId}" />
	         </td>
		</tr>
	</table>
	<c:set var="count" value="1" scope="page" />
	<c:forEach items="${keywords}" var="keyword">
	 <div id="giveSuggestion${count}" style="display: none;">
	 
	 	<div class="form-group">
            <div class="col-sm-9">
                <textarea id="expertReview${count}" maxlength="400" class="form-control form_textarea" rows="4" cols="20" style="width: 420px!important; height: 60px!important; margin-left: -16px; max-height: 60px; min-width: 420px;" placeholder="Enter Review for keyword ${fn:trim(keyword)} ...."></textarea>
                <span style="font-size: x-small;float: right; margin: -35px -135px; margin-top: -35px;">(Max 400 characters)</span>
            </div>
        </div>
        <br/><br/><br/><br/>
		<%-- <textarea id="expertReview${count}" style="width: 500px; height: 60px" placeholder="Enter Review for keyword ${fn:trim(keyword)}...."></textarea></br> --%>
		<span  id="inputSuggestion${count}"  style="color: orange; font-size: 12px; height: 20px"></span> </br>
		<c:if test="${review.type == 'journalist' }">
			<span style="color: black;">Publish
				<input type="checkbox" id="publish${count}">
			</span>
		</c:if>
        <div class="form-group last">
            <div class="col-sm-offset-3 col-sm-9">
            	<button type="button" class="btn btn-primary" onclick="saveSuggestion('${review.mediaReviewId}','${count }')" style="margin-right:118px; float: right;">Send</button>
            </div>
        </div>
		<%-- <input type="button" class="btn btn-primary" value="Send" onclick="saveSuggestion('${review.mediaReviewId}','${count }')" style="float: right; margin-right: 46px;" > --%>
	</div>
	<c:set var="count" value="${count+1 }" scope="page" />
	</c:forEach>
	</c:forEach>
</div>
<script>
	function giveSuggestion(keywordId){
		var total =  document.getElementById("total").value;
		//alert(total);
		var flag = true;
		var i = 1;
		for(var count=0 ; count< total ; count++){
			if(count == keywordId ){
				$("#keyButton"+keywordId).css('backgroundColor','#3276B1');
			}
			else{
				$("#keyButton"+count).css('backgroundColor','#808080');
			}
		}
		
		while(flag){
			if(i <= total){
				$('#giveSuggestion'+(i)).hide();
				i++;
			}else{
				$('#giveSuggestion'+keywordId).show();
				flag = false;
			}
		}
	}
</script>
<style>
	a.tryitbtn, a.tryitbtn:link, a.tryitbtn:visited, a.showbtn, a.showbtn:link, a.showbtn:visited {
		display: inline-block;
		/* color: #FFFFFF !important;
		background-color: #808080 !important; */
		font-weight: bold;
		font-size: 12px;
		text-align: center;
		padding-left: 10px;
		padding-right: 10px;
		padding-top: 3px;
		padding-bottom: 4px;
		text-decoration: none;
		margin-left: 5px;
		margin-top: 0px;
		margin-bottom: 5px;
		border: 1px solid #aaaaaa;
		border-radius: 5px;
		white-space: nowrap;
	}
	a.tryitbtn:hover, a.tryitbtn:active {
		white-space: nowrap;
		cursor: pointer;
	}
	#newFeedBack input-placeholder{
		color:  #FFFFFF;
	 }
	 /* .post_message button {
	 	top: 9px;
	 } */
</style>