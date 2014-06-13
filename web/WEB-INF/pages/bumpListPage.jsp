<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>

<link href='<c:url value="resources/css/bootstrap.min.css" />' rel="stylesheet" />
<link href='<c:url value="resources/css/styles.css" />'  rel="stylesheet" />
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />
<script>
 
$('#bumpID').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );

function sendBumpInfo(){
    var contactArr = "";
	boxes = $('input[name=favourite]:checked').each(function() {
		if (contactArr != "")
			contactArr = contactArr	+ ","+ $(this).attr('id');
		else
			contactArr = $(this).attr('id');
	});
	$.ajax({
		url : 'addBumpDetails',
		type : 'POST',
		data : {
			'bumpDetails' : contactArr
		},
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr,ajaxOptions,thrownError) {
			alert(xhr.responseText);
			alert(thrownError);
		}
	}); 
}

function getfav() {
	$.ajax({
		url : 'getfav',
		type : 'POST',
		data : {
			
		},
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr,ajaxOptions,thrownError) {
			alert(xhr.responseText);
			alert(thrownError);
		}
	});
}

function getmutual() {
	$.ajax({
		url : 'getmutual',
		type : 'POST',
		data : {
			
		},
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr,ajaxOptions,thrownError) {
			alert(xhr.responseText);
			alert(thrownError);
		}
	});
}

function checkmaybe() {
	 $.ajax({
		url : 'checkmaybe',
		type : 'POST',
		data : {
			
		},
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr,ajaxOptions,thrownError) {
			alert(xhr.responseText);
			alert(thrownError);
		}
	});
}

</script> 
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td style="background-color: #3276B1;color: #fff;">Favourite</td>
			<td style="background-color: #3276B1;color: #fff;">Mutual</td>
			
		</tr>
	</thead>	
	<tbody>	
		<c:set var="count" value="0" scope="page"/>
		<c:forEach items="${USERLIST}" var="user">
		<c:set var="count" value="${count+1  }" scope="page"/>
		<tr>
			<input type="hidden" value="${user.userId }" id="userId${count }" name="userId"/>
			<c:set var="temp" value="${user.userId }" scope="page"/>
			<td>${user.firstName } ${user.lastName }</td>
			<td>${user.email }</td>
			<c:set var="flag" value="${true }" scope="page" />
			
			
			
			<c:set var="items" value="0" scope="page"/>
			<c:forEach items="${BUMPDETAILSLIST}" var="bumpDetails">
				<c:set var="items" value="${items+1  }" scope="page"/>
			</c:forEach>
			<c:if test="${items >0 }">
				<c:set var="repeat" value="0" scope="page"/>
				<c:forEach items="${BUMPDETAILSLIST}" var="bumpDetails">
					 <c:if test="${flag }">
						 <c:if test="${bumpDetails.toUser.userId == user.userId || bumpDetails.fromUser.userId == user.userId}">
						 	<c:set var="flag" value="${false }" scope="page" />
							<c:if test="${bumpDetails.favourite == 'Y' }">
								<td><input type="checkbox" id="${temp },favourite" name="favourite" disabled="disabled" checked="checked"></td>
							</c:if>
							<c:if test="${bumpDetails.favourite == 'N' }">
								<td><input type="checkbox" id="${temp },favourite" name="favourite"></td>
							</c:if>
							<c:if test="${bumpDetails.mutual == 'Y' }">
								<td><input type="checkbox" id="${temp },mutual" name="favourite" disabled="disabled" checked="checked"></td>
							</c:if>
							<c:if test="${bumpDetails.mutual == 'N' }">
								<td><input type="checkbox" id="${temp },mutual" name="favourite"></td>
							</c:if>
						</c:if>
					</c:if>
					
					
					<c:if test="${flag }">
						<c:set var="repeat" value="${repeat+1  }" scope="page"/>
					</c:if>
					<c:if test="${repeat == items }">
						<td><input type="checkbox" id="${temp },favourite" name="favourite"></td>
						<td><input type="checkbox" id="${temp },mutual" name="favourite"></td>
					</c:if>
					
				</c:forEach>
			</c:if>
			<c:if test="${items == 0 }">
				<td><input type="checkbox" id="${temp },favourite" name="favourite"></td>
				<td><input type="checkbox" id="${temp },mutual" name="favourite"></td>
			</c:if>
		</tr>
		</c:forEach>
	</tbody>
	<input type="hidden" value="${count }" id="count" name="count"/>
</table>
<button type="button" class="btn btn-primary" id="submitBump" onclick="sendBumpInfo()">Submit</button>
<button type="button" class="btn btn-primary" id="favBump" onclick="getfav()">Favourites</button>
<button type="button" class="btn btn-primary" id="mutualBump" onclick="getmutual()">Mutual</button>
<button type="button" class="btn btn-primary" id="maybeBump" onclick="checkmaybe()">May-BE</button>


