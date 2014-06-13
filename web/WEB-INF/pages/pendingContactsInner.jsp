<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
function setPendingContacts(event){
	//alert("myTest ==> " + event.name +  " event.status ==> " + event.innerHTML);
	$.ajax({
	    url: 'setPendingContactsToContacts',
	    type: 'GET',
	    data:{id : event.name,status:event.innerHTML},
	    success: function(data){
	       $('#mainContainer').html(data);
	      //alert(data);
	    },
	    error: function (xhr, ajaxOptions, thrownError) {
	        //alert(xhr.responseText);
	        //alert(thrownError);
	    	genericException();
	    }
  });
}

$('#addNewContact').click(function(event) {
	if ($(this).attr('id') == "addNewContact") {
		// alert("reached1 ==>" + $(this).attr('id'));
			$("#addNewContact").html("Submit");
			$("#backToContact").show();
			//$("#backToContact").text("Back to Contact");
			// $("#goToContacts").html("Go to Contacts");
			$("#addNewContact").attr("id","submitContact");
		   //$("#addNewContact").attr("id","submitContact");
		   
			$.ajax({
				
				url : 'getNewContactsList',
				type : 'GET',
				success : function(	data) {
					//alert(" change of value ==> "+   $("#backToContact").text());
					$('#mainContainer').html(data);
					/* $("#addNewContact").val('Save'); */
					// $("#closeContact").val('Back');
					//closeContact
					//alert(data);
				},
				error : function(xhr,ajaxOptions,thrownError) {
					alert(xhr.responseText);
					alert(thrownError);
				}
			});
			
	} else if ($(this).attr('id') == "submitContact") {
		
		/* 	alert("reached2 ==>"+ $(this).attr('id')); */
		// event.preventDefault();
		var boxesArr = new Array();
		var i = 0;
		var contactArr = "";
		boxes = $('input[name=contactCheckbox]:checked').each(function() {
		//alert( $(this).val() );
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
				//alert(data);
				$('#contactsTable').html(data);
				$("#addNewContact").html("Add New Contact(s)");
				$("#addNewContact").attr("id","addNewContact");
			},
			error : function(xhr,ajaxOptions,thrownError) {
				alert(xhr.responseText);
				alert(thrownError);
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
			//alert(data);
		},
		error : function(xhr, ajaxOptions,thrownError) {
								
			alert(xhr.responseText);
			alert(thrownError);
		}
  });
});

$('#pendingContactTbl').dataTable({
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
});
</script>


<table  style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="1" class="table table-striped table-bordered" id="pendingContactTbl"  >
    <thead style="background-color: #3276B1; color: white;">
     <tr>
         <th>Name</th>
         <th>Telephone</th>
         <th>Email</th>
         <th style="text-align: center">Action</th>
     </tr>
    </thead>	
     <tbody>
	<%int i=0;%>	        
   <c:forEach items="${userArrayList}" var="user">
        <tr id="tr<%=i%>">
            <td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${user.firstName} ${user.lastName}</p></td>
            <td>
            	<c:if test="${user.phone == 0}">
            		No Record Found
            	</c:if>
            	<c:if test="${user.phone != 0}">
            		${user.phone}
            	</c:if>
           </td>
            <td>${user.email}</td>
            <td style="text-align: center">
            	<button  name = "${user.userId}" value="tr<%=i%>" onclick="setPendingContacts(this)" class="btn btn-primary" style="padding: 2px 4px">confirm</button>
            	<button  name = "${user.userId}" onclick="setPendingContacts(this)" value="tr<%=i%>" class="btn btn-primary" style="padding: 2px 4px">reject</button>
            </td>
        </tr>
    <%i++; %>
    </c:forEach> 
    </tbody>
</table>
<button type="button" class="btn btn-primary" id="addNewContact">Add New Contact(s)</button>
<button type="button" class="btn btn-primary" id=pendingContact>Pending Contact(s)</button>
<button type="button" class="btn btn-primary" id="backToContact" style="display: none;">Back To Contact</button>	  
