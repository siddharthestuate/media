<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.CarrierDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/bootstrap.min.css" />' rel="stylesheet" />
<link href='<c:url value="resources/css/styles.css" />'  rel="stylesheet" />
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />
<%
	ArrayList<CarrierDTO> list = (ArrayList<CarrierDTO>) request.getAttribute("CARRIER_LIST");
%>
<style>
	#jobTbl tr th {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}
#jobTbl tr td {
	padding: 3px;
}
</style>

<head>
<script type="text/javascript">
$('#jobTbl').dataTable({
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
});
</script>
</head>

<body style="background-color: #E7E7E7;">
		<div align="center"><h3>CARRIER POST</h3></div>
		<%if(list.size() > 0) {%>
			<div id="loadAddCarrier">
			<table align="center" id="jobTbl" cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Industry</th>
						<th>Expertise</th>
						<th>Experience (Year)</th>
						<th>Contact</th>
					</tr>
				</thead>
				<tbody>
					<%for(CarrierDTO dto:list){ %>
					<tr>
						<td><%=dto.getIndustry() %></td>
						<td><%=dto.getExpertise() %></td>
						<td align="center"><%=dto.getExperience() %></td>
						<td><%=dto.getContact() %></td>
					</tr>
						<%} %>
				</tbody>
			</table>
		</div>
		<%}else{ %>
			<div align="center"><h3>No Post Found!</h3></div>
		<%} %>
		<br/>
		<div align="left" id="addCarrBtn">
			<a class="btn btn-primary" onclick="loadAddCarrierPage()">Add Carrier</a>
		</div>
</body>
