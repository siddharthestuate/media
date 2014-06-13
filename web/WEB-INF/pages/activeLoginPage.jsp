<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">

<script>
	$('#activeLoginTbl').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
</script>	

<br/>
<div> 
<table  style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="0" class="table table-striped table-bordered" id="activeLoginTbl"  >
	<thead>
	<tr>
		<th style="background-color: #3276B1;color: #fff; ">Sl No</th>
	  	<th style="background-color: #3276B1;color: #fff; width: ">Login User</th>
	  	<th style="background-color: #3276B1;color: #fff;"width: >IP Address</th>
	  	<th style="background-color: #3276B1;color: #fff; width: ">Browser & Version</th>
  	</tr>
  	</thead>
  	<tbody>
	<c:forEach items="${ACTIVELOGIN}" var="login">
		<tr>
			<td>${login.activeLoginId }</td>
			<td style="width: 30%">${login.userId.firstName } ${login.userId.lastName }</td>
			<td style="width: 25%" >${login.IP }</td>
			<td style="width: 43%">${login.browser }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>