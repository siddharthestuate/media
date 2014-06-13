<%-- <script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/bootstrap.min.css" />' rel="stylesheet" />
<link href='<c:url value="resources/css/styles.css" />'  rel="stylesheet" />
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />
 --%>
<%@page import="com.medialounge.reevo.dto.UserDto"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">
 <script>
 $('#addNewContact').click(function(event) {
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
					},
					error : function(xhr,ajaxOptions,thrownError) {
						//alert(xhr.responseText);
						//alert(thrownError);
						genericException();
					}
				});
		}
	});
	$('#backToContact').click(function(event) {
			$('#backToContact').hide();
			$("#submitContact").html("Add New Contact(s)");
			$("#submitContact").attr("id","addNewContact");
			// $("#addNewContact").attr("id","submitContact");
			$.ajax({
	
				url : 'getContactList',
				type : 'GET',
				success : function(data) {
					$('#mainContainer').html(data);
						//alert(data);
				},
				error : function(xhr, ajaxOptions,thrownError) {
					//alert(xhr.responseText);
					//alert(thrownError);
					genericException();
				}
			});
	});
	$('#pendingContact').click(function(event) {
		$.ajax({
			url : 'pendingContactlist',
			type : 'GET',
			success : function(data) {
				$('#mainContainer').html(data);
				//alert(data);
			},
			error : function(xhr, ajaxOptions,thrownError) {
				//alert(xhr.responseText);
				//alert(thrownError);
				genericException();
			}
	  });
	});
$('#example3').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );

function genericException() {
	window.location.href = "genericException"; 
}
</script>
<%UserDto userDto =  (UserDto)request.getSession().getAttribute("userDto"); %>
<div align="left"><h3>Contacts of User <%=userDto.getFirstName() +" "+ userDto.getLastName()%></h3></div>   
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example3" style="width: 100%" >
     <thead style="background-color: #3276B1; color: white;">
         <tr align="center">
             <th>Image</th>	
             <th>Name</th>
             <th>Email</th>
         </tr>
     </thead>
     <tbody>
     	 <c:forEach items="${userArrayList}" var="user"> 
     		 <tr>
	     		<td class="photo">
		     		<c:if test="${user.contentPath == null}">
	            		<img src='<c:url value="resources/dummy/dummy.jpg" />'  height="40px" width="40px"/>
	            	</c:if>
	            	<c:if test="${user.contentPath != null}">
	            		<img src='<c:url value="${user.contentPath }" />'  height="40px" width="40px"/>
	            	</c:if>
	     		</td>
	    		<td valign="middle">${user.firstName} ${user.lastName}</td>
	             <td><a href="#">${user.email}</a></td>
             </tr>
     	 </c:forEach> 
    </tbody>
</table>
<button type="button" class="btn btn-primary" id="addNewContact">Add New Contact(s)</button>
<button type="button" class="btn btn-primary" id="pendingContact">Pending Contact(s)</button>
<button type="button" class="btn btn-primary" id="backToContact" style="display: none;">Back To Contact</button>