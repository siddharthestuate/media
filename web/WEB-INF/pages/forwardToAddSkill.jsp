<%--
    File   	   : forwardToAddSkill.jsp
    Created on : Dec 18, 2013, 05:00:33 PM
    Author     : Anirudhha
--%>

<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<%
	ArrayList<JobDTO> jobTypeList = (ArrayList<JobDTO>) request.getAttribute("JOBTYPE_LIST");
%>
<html>
<head>
<title>Welcome To Add Skill Page</title>
<script>
// try here ---> //http://jsfiddle.net/sqrrt/2/
$(document).ready(function () {
	 var counter = 1;
	 $("#addrow").on("click", function () {
		var newRow = $("<tr>");
		 var cols = "";
		 // 1st column td
		 cols +='<td><select style="height: 30px;width: 110px;" name="jobTypeId">'
		 +'<option value="">-- Select --</option>'+
		 <%for(JobDTO dto : jobTypeList){%>
		 +'<option value="<%=dto.getJobTypeId()%>"><%=dto.getJobTypeDescription()%></option>'
		 <%}%>
		 +'</select></td>';
		 // 2nd column td
		 cols +='<td><input type="text" placeholder="Enter more skills here..." style="height: 30px;width: 300px;" name="skills" maxlength="40"/></td>';
		 // 3rd column delete
		 cols += '<td><input type="button" value="Delete" class="btn-primary"></td>';
		 newRow.append(cols);
		 $("table.order-list").append(newRow);
		 counter++;
	 });
	 
	 $("table.order-list").on("click", ".btn-primary", function (event) {
	        $(this).closest("tr").remove();
	        counter -= 1;
	    });
});

</script>
</head>
<style>
.astreik {
    color: #FF0000;
}
#myTable tr th {
	background-color: #AAA;
	padding: 5px;
}

#myTable tr:nth-child(even) {
	background-color: #ddd;
}

#myTable tr:nth-child(odd) {
	background-color: #ddd;
}

#myTable tr td {
	padding: 3px;
}
</style>
<body style="background-color: #E7E7E7">
<form:form method="post" commandName="addingSkill" action="addSkill">
	<div align="left">
		<span><h3>Add Skill Details</h3></span>
	</div>
	<div align="left" >
			<table id="myTable" class="order-list">
				<thead>
				<tr>
					<td>Select Expertise <span class="astreik" title="* fields are mandatory!" style="cursor: help;">*</span></td>
					<td>Enter Skills</td>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						<select name="jobTypeId" style="height: 30px;width: 110px;">
							<option value="">-- Select --</option>
							<c:forEach items="${JOBTYPE_LIST}" var="job">
								<option value="${job.jobTypeId }">${job.jobTypeDescription }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<!-- <form:input id="skills" path="skills" placeholder="Enter more skills here..." style="height: 30px;width: 300px;"/>&nbsp;&nbsp;-->
						<input type="text" placeholder="Enter more skills here..." style="height: 30px;width: 300px;" name="skills" maxlength="40"/>
					</td>
				</tr>
				</tbody>
			</table>
			<table align="left">
				<tr>
					<td colspan="3" align="left">
						<input type="button" value="Add Row" id="addrow" class="btn btn-primary" style="margin-bottom: 20px; margin-top: 30px;" />
						<input type="button" value="Save" onclick="return validateSkill();" class="btn btn-primary" style="margin-bottom: 20px; margin-top: 30px;" />
						<input type="button" value="Cancel" onclick="cancelDiv();" class="btn btn-primary" style="margin-bottom: 20px; margin-top: 30px;"/>
					</td>
				</tr>
			</table>
	</div>
	</form:form>
</body>
</html>
<script>
function validateSkill() {
	if ($('select[name=jobTypeId]').val() == "") {
		alert("Please Select Expertise");
		return false;
	}
	if ($("input[name='skills']").val() == "") {
		alert("Please Enter Skills");
		//$("input[name='skills']").focus();
		return false;
	}

	//var len_tr = $('#myTable tbody tr').length;
	//alert("Total rows:"+len_tr);
	var expertArray = [];
	var skillArray = []; 
	$('select[name=jobTypeId]').each(function(){
		//alert("select: "+$(this).val());
		expertArray.push($(this).val());
	});
	
	$("input[name='skills']").each(function(){
		//alert("text: "+$(this).val());
		skillArray.push($(this).val());
	});
	
	$.post("addSkill?expertArray="+expertArray+"&skillArray="+skillArray, function(data, status) {
		//$('#mySkillDiv').html(data);
		showMyProfile();
	})
	.fail(function() {
		genericException();
	});
}

function genericException() {
	window.location.href = "genericException"; 
}
</script>