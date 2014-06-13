<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Media</title>
	<script type="text/javascript" >
	$("#ff").submit(function(e)
	{
	    var postData = $(this).serializeArray();
	    var formURL = $(this).attr("action");
	   // alert('${mediaId}');
	    $.ajax(
	    {
	        url : "saveCommentsToExpert?media_Id=${mediaId}",
	        type: "POST",
	        data : postData,
	        success:function(data, textStatus, jqXHR) 
	        {
	           // alert("success "+data);
	            $('#info').html(data);
	        },
	        error: function(jqXHR, textStatus, errorThrown) 
	        {
	            //if fails  
	        	alert("failure "+errorThrown);
	        }
	    });
	    e.preventDefault(); //STOP default action
	});
	</script>
</head>
<body style="background-color: #E7E7E7;">
	<c:set var="mediaId" value="${mediaId}" scope="page" />	
	<form:form id="ff" commandName="user" method="post" action="saveCommentsToExpert">
		<table>
			<tr align="center">
				<td><div id="info" style="color: red;"></div></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					DJ<select name="djValues" multiple="multiple" style="width: 100px" size="15">
					  <c:forEach items="${djList}" var="u">
					  	<option value="${u.userId}">${u.firstName}</option>
					  </c:forEach>
					</select>
				</td>
				<td style="padding-left: 20px;">
					VS<select name="vsValues" multiple="multiple" style="width: 100px" size="15">
					  <c:forEach items="${vsList}" var="u">
					  	<option value="${u.userId}">${u.firstName}</option>
					  </c:forEach>
					</select>
				</td>
				<td style="padding-left: 20px;">
					Journalist<select name="journalistValues" multiple="multiple" style="width: 100px" size="15">
					  <c:forEach items="${journaList}" var="u">
					  	<option value="${u.userId}">${u.firstName}</option>
					  </c:forEach>
					</select>
				</td>
				<td style="padding-left: 20px;">
					Anchor<select name="anchorValues" multiple="multiple" style="width: 100px" size="15">
					  <c:forEach items="${anchorList}" var="u">
					  	<option value="${u.userId}">${u.firstName}</option>
					  </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="submit" />
					
					<!--  <a onclick="submitValue('${mediaId}');" style="cursor: pointer;">Submit</a><div id="info"></div>-->
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>