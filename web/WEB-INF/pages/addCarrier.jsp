<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<html>
<head>
<title>Add Carrier Details</title>
<style>
#carrierTbl tr:nth-child(even) {
	background-color: #fff;
}

#carrierTbl tr:nth-child(odd) {
	background-color: #ddd;
}

#carrierTbl tr td {
	padding: 3px;
}

.astreik{
	color: red;
	cursor: help;
}
</style>
</head>
<body style="background-color: #E7E7E7;" onload="clearSpringFormIntField();">
		<div align="left">
			<table align="center">
				<div align="center">
					<h3>Add Carrier Details</h3>
				</div>
				<tr>
					<td width="70%">
						<table id="carrierTbl" width="85%" height="50%" frame="box" cellspacing="0">
							<tr>
								<td>
									<b>Industry</b> <span class="astreik" title="* fields are mandatory!">*</span> 
								</td>
								<td>:</td>
								<td>
									<select id="industry" >
										<option value="">Select</option>
										<option value="Agriculture">Agriculture</option>
										<option value="Accounting">Accounting</option>
										<option value="BPO">BPO</option>
										<option value="Real Estate">Real Estate</option>
										<option value="Software">Software</option>
										<option value="Technology">Technology</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<b>Expertise</b> <span class="astreik" title="* fields are mandatory!">*</span> 
								</td>
								<td>:</td>
								<td>
									<select id="expertise" >
										<option value="">Select</option>
										<option value="JAVA">JAVA</option>
										<option value="Mechanics">Mechanics</option>
										<option value="Consultant">Consultant</option>
										<option value="Practice Head">Practice Head</option>
										<option value="Business Developer">Business Developer</option>
										<option value="Accountant">Accountant</option>
									</select>
								</td>
								</tr>
							<tr>
								<td>
									<b>Experience</b> <span class="astreik" title="* fields are mandatory!">*</span> 
								</td>
								<td>:</td>
								<td>
									<select id="experience">
										<option value="">Select</option>
											<%for (int i = 1; i < 9; i++) { %>
												<option value="<%=i%>"><%=i%></option>
											<%} %>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<b>Contact</b> <span class="astreik" title="* fields are mandatory!">*</span>
								</td>
								<td>:</td>
								<td>
									<input id="contact" placeholder="Enter phone number..."/>
								</td>	
							</tr>							
							<tr>
								<td colspan="3" align="center">
									<input type="button" value="Add" onclick="return validateCarrier();" class="btn btn-primary"/>
									<input type="reset" value="Cancel" onclick="hideAddCarrierDiv();" class="btn btn-primary"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>
<script>
function clearSpringFormIntField() {
	document.forms[0].contact.value = "";
}
function validateCarrier() {
	var industry = document.getElementById("industry").value;
	var expertise = document.getElementById("expertise").value;
	var experience = document.getElementById("experience").value;
	var contact = document.getElementById("contact").value;
	
	if(industry == ""){
		alert("Please Select Industry");
		return false;
	}
	if(expertise == ""){
		alert("Please Select Expertise");
		return false;
	}
	if(experience == ""){
		alert("Please Select Experience");
		return false;
	}
	if(contact == ""){
		alert("Please Enter contact");
		document.getElementById("contact").focus();
		return false;
	}
	$.post("addCarrierPage?industry="+industry+"&expertise="+expertise+"&experience="+experience+"&contact="+contact, function(data, status) {
		showCarrierPage();
		//hideAddCarrierDiv();
	});
}
</script>