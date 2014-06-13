<%-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/bootstrap.min.css" />' rel="stylesheet" />
<link href='<c:url value="resources/css/styles.css" />'  rel="stylesheet" />
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" /> --%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">
<script>
$('#submitContact').click(function(event) {
			if ($(this).attr('id') == "addNewContact") {
					$("#addNewContact").html("Submit");
					$("#backToContact").show();
					$("#addNewContact").attr("id","submitContact");
					$.ajax({
						url : 'getNewContactsList',
						type : 'GET',
						success : function(	data) {
							$('#mainContainer').html(data);
						},
						error : function(xhr,ajaxOptions,thrownError) {
							//alert(xhr.responseText);
							//alert(thrownError);
							genericException();
						}
					});
			} else if ($(this).attr('id') == "submitContact") {
				var boxesArr = new Array();
				var i = 0;
				var contactArr = "";
				boxes = $('input[name=contactCheckbox]:checked').each(function() {
				if (contactArr != "")
				contactArr = contactArr	+ ","+ $(this).val();
				else
					contactArr = $(this).val();
			});
				if(contactArr.length == 0){
					alert("Please check user(s) to submit!");
				}else{
					$.ajax({
						url : 'addContactsFinish',
						type : 'POST',
						data : {
							'contactId' : contactArr
						},
						success : function(data) {
							$('#contactsTable').html(data);
							$("#addNewContact").html("Add New Contact(s)");
							$("#addNewContact").attr("id","addNewContact");
							$('#contactsMessage').html("Added Successfully");
						},
						error : function(xhr,ajaxOptions,thrownError) {
							alert(xhr.responseText);
							alert(thrownError);
					}
				});
			}
		}
	});
	$('#backToContact').click(function(event) {
			$('#backToContact').hide();
			//$("#submitContact").html("Add New Contact(s)");
			//$("#submitContact").attr("id","addNewContact");
			// $("#addNewContact").attr("id","submitContact");
			$.ajax({
				url : 'getContactList',
				type : 'GET',
				data :{
					userId : $("#profileDivUserId").val()
				},
				success : function(data) {
					$('#mainContainer').html(data);
				},
				error : function(xhr, ajaxOptions,thrownError) {
					alert(xhr.responseText);
					alert(thrownError);
				}
			});
	});
	$('#pendingContact').click(function(event) {
		$.ajax({
			url : 'pendingContactlist',
			type : 'GET',
			success : function(data) {
				$('#mainContainer').html(data);
			},
			error : function(xhr, ajaxOptions,thrownError) {
				alert(xhr.responseText);
				alert(thrownError);
			}
	  });
	});
	
$('#example1').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );
</script>
<form:form method="POST" commandName="users" action="addContactsFinish">
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example1" style="width: 100%" >
	     <thead style="background-color: #3276B1; color: white;">
	         <tr>
	            <th>Contact</th>
	            <th>First Name</th>
	            <th>Second Name</th>
	            <th>Telephone</th>
	            <th>Email</th>
	         </tr>
	     </thead>
	     <tbody>
	     	<c:forEach items="${userArrayList}" var="user">
		            <tr>
		            	<td align="center"> <input type = "checkbox" name = "contactCheckbox" value = "${user.userId}" /> </td>
		                <td><p style="word-wrap: break-word !important; width: 100px !important; display: block; position: relative;">${user.firstName}</p></td>
		                <td><p style="word-wrap: break-word !important; width: 100px !important; display: block; position: relative;">${user.lastName}</p></td>
		                <td>
			            	<c:if test="${user.phone == 0}">
			            		No Records Found
			            	</c:if>
			            	<c:if test="${user.phone != 0}">
			            		${user.phone}
			            	</c:if>
			            </td>
		                <td><p style="word-wrap: break-word !important; width: 100px !important; display: block; position: relative;">${user.email}</p></td>
		            </tr>
		        </c:forEach>
	     </tbody>
	</table>
</form:form>
<button type="button" class="btn btn-primary" id="submitContact">Submit</button>
<button type="button" class="btn btn-primary" id=pendingContact>Pending Contact(s)</button>
<button type="button" class="btn btn-primary" id="backToContact" >Back To Contact</button>
<div id="contactsMessage" style="color: orange;"></div> 
