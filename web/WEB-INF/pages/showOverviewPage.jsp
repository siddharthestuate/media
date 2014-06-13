<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />
<style>

#overviewTbl tr th {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}

#overviewTblId tr th thead  {
	background-color: #0076A2;
	padding: 5px;
	color: #fff;
}

</style>

<%
	String userId = (String) request.getSession().getAttribute("userSessionId");
	String userEmail = (String) request.getSession().getAttribute("userSession");
	
%>
<c:set var="userEmail" value="<%=userEmail%>" scope="page" /> 
<c:set var="flag" value="-1" scope="page" /> 

 <script>
	$('#overviewTblId1').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
	
</script>  
<h3 style="align:center"> Quick OverView </h3>
<table  style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="1" class="table table-striped table-bordered" id="overviewTblId1"  >
	<thead style="background-color:#3276B1;color:white;">
		<tr>
				<th style="width: 10%;">Name</th>
				<th style="width: 20%;">Function Name</th>
				<th style="width: 20%;">How It Work</th>
				<th style="width: 20%;">Why To Use</th>
				<th style="width: 20%;">Status</th>  
				<th style="width: 5%;">Edit</th>
				<th style="width: 5%;">Delete</th>
		</tr>
	</thead>
	<tbody>
		<% int i = 1; %>
		<c:forEach items="${OVERVIEW_LIST}" var="user">
			<tr>
				<td>${user.overViewModulesEntity.quickOverViewModuleName}</td>
				<td><p style="word-wrap: break-word !important; width: 75px !important; display: block; position: relative;">${user.description}</p></td>
				<td><p style="word-wrap: break-word !important; width: 75px !important; display: block; position: relative;">${user.functionWork}</p></td>
				<td><p style="word-wrap: break-word !important; width: 75px !important; display: block; position: relative;">${user.whyToUse}</p></td>
				<td style="text-align: left;width:200px">
						<input type="radio" name="overViewStatus<%=i%>" value="Y" <c:if test="${user.status=='Y'}">checked </c:if>
						onclick=" return activeOrDeactive('Y',${user.overViewModulesEntity.quickOverViewModuleId});" />Active
						
						<input type="radio" name="overViewStatus<%=i%>" value="N" <c:if test="${user.status=='N'}">checked </c:if>
						onclick="return activeOrDeactive('N',${user.overViewModulesEntity.quickOverViewModuleId});" />De-active
						
				</td>
	
				<td style="cursor: pointer; text-align: center;" id="editOverViewId" onclick=" return editOverViewOnClickAdmin(<%=i%>);">
					<img src='<c:url value="resources/dummy/pensil.png" />' height="28px" width="28px" />
					<input type="hidden" id="id_<%=i%>" name="id" value="${user.overViewModulesEntity.quickOverViewModuleId}">
					<input type="hidden" id="overViewName_<%=i%>" name="overViewName" value="${user.overViewModulesEntity.quickOverViewModuleName}">
					<input type="hidden" id="desc_<%=i%>" name="desc" value="${user.description}">
					<input type="hidden" id="functionWork_<%=i%>" name="functionWork" value="${user.functionWork}">
					<input type="hidden" id="whytoUse_<%=i%>" name="whytoUse" value="${user.whyToUse}">
				</td>
				<td style="cursor: pointer; text-align: center" id="deleteOverViewId" onclick=" return deleteOverViewOnClick(${user.overViewModulesEntity.quickOverViewModuleId});">
					<img src='<c:url value="resources/dummy/delete.png" />' height="20px" width="20px" />
				</td>
       
	 	 </tr>
		<% i++;	%>
	</c:forEach>
	</tbody>
</table>
<br>
<button type="button" class="btn btn-primary" onclick="addNewModule();" id="quickOverViewAddModuleId">Add Module</button>

