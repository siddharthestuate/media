<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <!-- <script type="text/javascript" src="resources/javascript/jquery.simplePagination.js"></script> -->
 <script type="text/javascript" src="resources/javascript/jquery.pajinate.js"></script>
 
 <style>
 #mediaFeedbackInnerDiv table {
  background-color: #00adef;
  color:white;
}
 #mediaFeedbackInnerDiv table:nth-child(even) {
  background-color: red;
  
}
a.tryitbtn, a.tryitbtn:link, a.tryitbtn:visited, a.showbtn, a.showbtn:link, a.showbtn:visited {
		/* display: inline-block;
		color: #FFFFFF !important; 
		background-color: #808080 !important;*/ 
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
	
	.page_navigation , .alt_page_navigation{
	padding-bottom: 10px;
	}

	.page_navigation a, .alt_page_navigation a{
		padding:6px 18px;
		/* margin:2px; */
		/* color:#00afec; */
		text-decoration:none;
		float: left;
		/* font-family: Tahoma; */
		font-size: 12px;
		/* background-color:white; */
		border-color: #dddddd;
		border: 1px solid #dddddd;
		margin-left: -1px;
	}
	
	.content li, .alt_content li, .content > p{
		padding: 5px
	}
	
	.ellipse{
	float: left;
	} 
	
	.active_page{
	background-color:#428bca !important;
	color: #ffffff !important;
	/* border: 1px solid #dddddd; */
	border-color: #428bca;
}	
	

 </style>
<script >
/* $(function() {
    $('#mediaFeedbackInnerDiv').pagination({
        items: 100,
        itemsOnPage: 10,
        cssStyle: 'light-theme'
    });
}); */
$(document).ready(function(){
	$('#paging_container7').pajinate({
		num_page_links_to_display : 4,
		items_per_page : 5
	});
});	
</script>
<%--  <div id = "mediaFeedbackInnerDiv" style="overflow: auto; height: 300px">
  <table border="1" style="width: 100%">
  
<c:if test="${empty allMediaFeedbackDetailsOfParticularUser}">
	<span><h3>No Review Found!</h3></span>
</c:if>			
<c:if test="${!empty allMediaFeedbackDetailsOfParticularUser}">
 <c:forEach items="${allMediaFeedbackDetailsOfParticularUser}" var="previousFeedback">
      		<tr>
      			<td>
      				<table frame="box" style="width: 100%">
         		<tr>
         			<td width="14%">Media&nbsp;&nbsp;&nbsp;&nbsp;   :</td>
         			
         			<td>
         			<a style="color: #FFFFFF; cursor: pointer;" id = '${previousFeedback.mediaEntity.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" 
         			onClick="mediasViewPopUp('${previousFeedback.mediaEntity.contentType}','${previousFeedback.mediaEntity.mediaPath}','${previousFeedback.mediaEntity.mediaId}')">
         				${previousFeedback.mediaEntity.mediaName}
         			</a>
         			</td>
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
</c:if>
</table>
</div> --%>
<div id = "mediaFeedbackInnerDiv" style="width :100%;">
<c:if test="${empty allMediaFeedbackDetailsOfParticularUser}">
			<span><h3>No Review Found!</h3></span>
		</c:if>			
		<c:if test="${!empty allMediaFeedbackDetailsOfParticularUser}">
<div id="paging_container7"  style="float: left;margin: 0px 0px 10px;padding: 20px;width :100%; ">
	<div class="page_navigation"></div><br/><br/>
	<div class="info_text"></div>
	<ul class="content" style="text-align: left;">
		
		<c:forEach items="${allMediaFeedbackDetailsOfParticularUser}" var="previousFeedback">
			<li style="margin-left: -45px; list-style: none;">
				<table frame="box" style="width: 100%; " >
         		<tr>
         			<td width="14%">&nbsp;&nbsp;Media&nbsp;&nbsp;&nbsp;&nbsp;   :</td>
         			
         			<td>
         			<a style="color: #FFFFFF; cursor: pointer;" id = '${previousFeedback.mediaEntity.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" 
         			onClick="mediasViewPopUp('${previousFeedback.mediaEntity.contentType}','${previousFeedback.mediaEntity.mediaPath}','${previousFeedback.mediaEntity.mediaId}')">
         				${previousFeedback.mediaEntity.mediaName}
         			</a>
         			</td>
         		</tr>
         			<td>&nbsp;&nbsp;Keyword :</td>
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
         			<td colspan="2"><p style="word-wrap: break-word !important; width: 480px !important; display: block; position: relative;">&nbsp;&nbsp;${previousFeedback.description}</p></td>
         		</tr>
         	</table>
			</li>
		</c:forEach>
	</ul>	
	<div class="info_text"></div>
	<div class="page_navigation"></div>
	</div>
	</c:if>	
</div>
