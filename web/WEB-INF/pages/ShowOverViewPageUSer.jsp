<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<%
	String userId = (String) request.getSession().getAttribute("userSessionId");
	String userEmail = (String) request.getSession().getAttribute("userSession");
	
%>
<c:set var="userEmail" value="<%=userEmail%>" scope="page" />  --%>

<!-- <table style="width: 100% ;cellpadding:0; cellspacing:0" border="1" class="table table-striped table-bordered" > -->
<div class="modal-header">
	<%-- <c:if test="${! empty OVERVIEW_LIST}">
		<c:forEach items="${OVERVIEW_LIST}" var="user">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel" >
	      	  Quick OverView- ${user.overViewModulesEntity.quickOverViewModuleName}
	      	 </h4>
		</c:forEach>
    </c:if>
	 <c:if test="${ empty OVERVIEW_LIST}">
	     	<h4 class="modal-title" id="myModalLabel">Quick OverView- </h4>
	 </c:if> --%>
	 
	
		<c:forEach items="${OverViewModulesList}" var="overViewModule">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel" >
	      	  Quick OverView- ${overViewModule.quickOverViewModuleName}
	      	 </h4>
		</c:forEach>
</div>
<div class="modal-body"> 
<table style="width: 100% ;cellpadding:0; cellspacing:0" border="1">
	<thead style="background-color: #3276B1; color: white;">
		<tr>
			<!-- <th style="text-align: center; width: 200px">Name</th> -->
			<th>Function Name</th>
			<th>How It Work</th>
			<th>Why To Use</th>
			
			<%-- <c:if test="${userEmail == 'admin@reevo.com'}">
			<th style="text-align: center; width: 170px;">Status</th>
			</c:if> --%>
		</tr>
	</thead>
	<tbody>
		<c:if test="${! empty OVERVIEW_LIST}">
				<%-- <% int i = 1; %> --%>
			<c:forEach items="${OVERVIEW_LIST}" var="user">
				<tr>
					<%-- <td>
						${user.overViewModulesEntity.quickOverViewModuleName}
					</td> --%>
					<td><p style="word-wrap: break-word !important; width: 184px !important; display: block; position: relative;">
						${user.description}
					</p></td>
				<%-- <c:if test="${userEmail == 'admin@reevo.com'}">
					<td style="text-align: left;width:200px">
						<input type="radio" name="overViewStatus<%=i%>" value="Y" <c:if test="${user.status=='Y'}">checked </c:if>
						onclick=" return activeOrDeactive('Y',${user.overViewModulesEntity.quickOverViewModuleId});" />Active
						
						<input type="radio" name="overViewStatus<%=i%>" value="N" <c:if test="${user.status=='N'}">checked </c:if>
						onclick="return activeOrDeactive('N',${user.overViewModulesEntity.quickOverViewModuleId});" />De-active
					</td>
		       </c:if> --%>
					<td><p style="word-wrap: break-word !important; width: 184px !important; display: block; position: relative;">
						${user.functionWork}
					</p></td>
					<td><p style="word-wrap: break-word !important; width: 184px !important; display: block; position: relative;">
						${user.whyToUse}
					</p></td>
				</tr>
				<%-- <% i++;	%> --%>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br>
<c:if test="${ empty OVERVIEW_LIST}">
		No Quick OverView Found !
</c:if>
</div>
