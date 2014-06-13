<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Paid Content</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	
	<script> 
	//var number = document.getElementById("userNumber").value;
	//alert(number);
	$(document).ready(function(){
	  $("#userNumber").blur(function(){
		  var number =  document.getElementById("userNumber").value;
		  $.post("checkNumber?checkNumber="+number, { status: $(this).attr('name'),id: $(this).text()},function(data,status){
			  $('#info').html(data);
			  if(data == "Already Used Number") {
				  $('#userNumber').val("");
				  $('#userNumber').focus();
				  //document.getElementById("userNumber").value = "";
			  }
		  });
	  });
	});
	</script>
</head>
<body>
<h2>Paid User Register</h2>
	<form:form method="post" commandName="media" action="savePaidContentRegister.html" enctype="multipart/form-data">

		<table>
			<tr>
				<td><form:label path="userNumber">User Number</form:label></td>
				<td><form:input path="userNumber" id="userNumber" /><div style="float: right;" id="info"></div></td>
			</tr>
			
			<tr>
				<td><form:label path="username">Name</form:label></td>
				<td><form:input path="username" /></td>
			</tr>
			
			<tr>
				<td><form:label path="files">File</form:label></td>
				<td><input name="files[0]" type="file" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /></td>
			</tr>
		</table>

	</form:form>
</body>
</html>