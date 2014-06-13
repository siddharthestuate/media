<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FeedBack Details</title>

</head>
<style>

 .tdclass{
 	font-weight: bold;
 }
 div.hr {
  height: 15px;
}

</style>


<%
	String mediaId = request.getAttribute("MEDIA_ID").toString();
%>

<script>
 
function validateFeedback() {
	
    	var description = document.getElementById("feedbackDescription");
	
	 if($('#feedbackDescription').val() == ""){
		alert("Plz select Keyword and then Enter Description");
		return false;
	} else{
		
		$.post("saveUserFeedback?searchKey="+keyWordsArr[0]+"&colour="+color+"&desc="+description.value+"&mediaId="+<%=mediaId%>, function(data, status) {
			$('#showFeedbackReturnMsg').html(data);
		});
	} 
	document.getElementById("feedbackDescription").value = "";
}

var keyWordsArr = new Array();
var colorsArr = new Array();
var color = "";

function changeColorAndCount(searchKey){
	
	
	keyCount= document.getElementById("countOfKey").value;
	
		for(i=1;i<=keyCount;i++){
			if(searchKey=='searchLabel'+i) {
				sLabel=searchKey;			
			} else {		
				$('#searchLabel'+i).hide();
			}
		}

	/* if(searchKey=='searchLabel1'){
		$('#searchLabel2').hide();
		$('#searchLabel3').hide();
		$('#searchLabel4').hide();
		$('#searchLabel5').hide();
		$('#searchLabel6').hide();
	}
	else if(searchKey=='searchLabel2'){
		$('#searchLabel1').hide();
		$('#searchLabel3').hide();
		$('#searchLabel4').hide();
		$('#searchLabel5').hide();
		$('#searchLabel6').hide();
	} 
	else if(searchKey=='searchLabel3'){
		$('#searchLabel1').hide();
		$('#searchLabel2').hide();
		$('#searchLabel4').hide();
		$('#searchLabel5').hide();
		$('#searchLabel6').hide();
	}
	else if(searchKey=='searchLabel4'){
		$('#searchLabel1').hide();
		$('#searchLabel2').hide();
		$('#searchLabel3').hide();
		$('#searchLabel5').hide();
		$('#searchLabel6').hide();
	}
	else if(searchKey=='searchLabel5'){
		$('#searchLabel1').hide();
		$('#searchLabel2').hide();
		$('#searchLabel3').hide();
		$('#searchLabel4').hide();
		$('#searchLabel6').hide();
	}
	else if(searchKey=='searchLabel6'){
		$('#searchLabel1').hide();
		$('#searchLabel2').hide();
		$('#searchLabel3').hide();
		$('#searchLabel4').hide();
		$('#searchLabel5').hide();
	}
 */
 	 //alert("changeColorAndCount ==> " + $('#' + searchKey).css( "background-color" ));
	 if(($('#' + searchKey).css( "background-color")).trim() == 'rgb(204, 204, 204)'){ 
		 
		keyWordsArr[keyWordsArr.length] = $('#' + searchKey).text();
		color="green";
			
		//$('#feedbackDescription').show();
		//$('#descriptionText').show();
		document.getElementById("descriptionText").style.display = "block";
		document.getElementById("feedbackDescription").style.display = "block";
		document.getElementById("feedbackDescription").focus();
		document.getElementById("feedBackSubmitButton").style.display = "block";
		
		$('#' + searchKey).css( "background-color","green" );
		
	}
	 
	else if(($('#' + searchKey).css( "background-color")).trim() == 'rgb(0, 128, 0)'){
		
		keyWordsArr[keyWordsArr.length] = $('#' + searchKey).text();
		color="amber";
	
		$('#' + searchKey).css( "background-color","#FFC200" );
		
	}
	 
	 else if(($('#' + searchKey).css( "background-color")).trim() == 'rgb(255, 194, 0)'){
		 
		$('#' + searchKey).css( "background-color","red" );
		for(i=0;i<keyWordsArr.length;i++){
			if(keyWordsArr[i]==$('#' + searchKey).text()){
				colorsArr[2]= "red"; 
			}
		}
		color="red";
	}  
}
</script>

<body>
	<div>
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>
								<img class="media-object" src="<c:url value="resources/images/s.JPG" />" width="60" height="60" alt="..." />
							</td>
							<td>
								<h3>Name</h3>
								<span>Connection: 1st</span>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<h3>Post Info</h3>
								<span>Time Since Post</span>
								<c:set var="myVar" value="on" /> 
								<c:forEach items="${FEEDBACK_LIST}" var="feed">
										<c:if test="${myVar == 'on'}">
										<p style="background-color:${feed.bgColor};color:white; ">${feed.usersCount}</p>
											<c:set var="myVar" value="off" />
										</c:if>
								</c:forEach> 
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<img class="media-object" src="<c:url value="resources/images/arrow.png" />" width="40" height="40" alt="..." /><br> 
								<img class="media-object" src="<c:url value="resources//images/fb.png" />" width="25" height="26" alt="..." /><br>
							</td>
						</tr>
				</table>
				</td>
			</tr>
			<!-- 2nd tr starts -->
			<tr>
				<td>
					<table style="background-color: #00AEEF" height="150" width="400">
						<tr>
							<td>
								<div style="overflow-y: scroll; height: 150px;color: white">
									<table>
										<c:forEach items="${FEEDBACK_LIST}" var="feed">
											<tr>
												<td class="tdclass">User</td>
												<td>:</td>
												<td>${feed.userId.email}</td>
											</tr>
											<tr>
												<td class="tdclass">Keywords</td>
												<td>:</td>
												<td><font color="${feed.colour}">${feed.mediaSearchKey}</font></td>
											</tr>
											<tr>
												<td class="tdclass">Feedback</td>
												<td>:</td>
												<td>${feed.description}</td>
											</tr>
											<tr>
												<td>
													<div class="hr">
														<hr />
													</div>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!-- 2nd tr ends -->
			<!-- 3rd tr starts -->
			<tr>
				<td>
					<table style="" height="50" width="400">
						<tr>
							<td>
								<div>
									<table id="2ndTbl">
										<tr>
											<td align="left" colspan="3">
												<h3>Provide a Feedback</h3>
											</td>
										</tr>

										<tr>
											<td class="tdclass">Feedback KeyWord</td>
											<!-- <td>:</td> -->
											<td>
												<% 	int i = 1;	%>
												<div style="overflow: auto; height: 100px; width: 200px; border: 1px solid;">
													<c:forEach items="${mediaDtoList}" var="key">
														<div align="center" id=searchLabel<%=i%> onclick=" return changeColorAndCount('searchLabel<%=i%>');"
															style="width: 90px; border: 2px solid; color: white; background: rgb(204, 204, 204); cursor: pointer;">
															${key.mediaSearchKey}
														</div>
														<% i=i+1; %>
													</c:forEach>
													<% --i;%>
												</div> 
												 <input type="hidden" value=<%=i%> id="countOfKey"></input>
											</td>
										</tr>
										
										<tr>
											<td class="tdclass">
												<span id="descriptionText" style="display: none">Description</span>
											</td>
											<td style="display: none">:</td>
											<td>
												<textarea name="feedbackDescription" id="feedbackDescription" style="height: 98px; width: 309px; display: none;resize:none"/>
											</td>
										</tr>
										
										<tr>
											<td colspan="3" align="center">
												<input type="button" value="Submit" onclick="return validateFeedback();" class="btn btn-primary" id="feedBackSubmitButton" style="display: none;">
											</td>
										</tr>
									</table>
								</div>
								 <!-- <span style="background-color: yellow;">Vocals</span> -->
							</td>
						</tr>
							<!-- <tr>
							<td align="center" id= ><input type="button" value="Submit" onclick="return validateFeedback();" class="btn btn-primary"  /></td>
							<td><input type="button" value="Submit" onclick="" class="btn btn-primary"/></td>
						</tr>  -->
					</table>
				</td>
			</tr>
			<!-- 3rd tr starts -->
		</table>
	</div>
</body>
</html>