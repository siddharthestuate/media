<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("button").click(function(event){
    event.preventDefault(); 
    var trId =  $(this).attr('value');
    $.post("setPendingContactsToContacts", { status: $(this).text() ,id: $(this).attr('name')},function(data,status){
    	if(status == "success"){
    		$("tr").each(function(){
    		    if($(this).attr("id") == trId){
    		        $(this).remove();
    		        return;
    		    }
    		});
    	}
      });
  });
});
</script>
<title>Pending Contacts</title>
<script>

</script>
<style>
	#pendingContactTable tr th {
		background-color: #AAA;
		padding: 5px;
		}
		
		#pendingContactTable tr:nth-child(even) {
			background-color: #ffd;
		}
		
		#pendingContactTable tr:nth-child(odd) {
			background-color: #ddd;
		}
		
		#pendingContactTable tr td {
			padding: 3px;
		}
</style>
</head>
<body align="center" style="background-color: #E7E7E7;">
	<p><h3>Pending Contacts</h3></p>
	<form:form method="POST" commandName="users" action="addContactsFinish">
		 <table cellspacing="0" frame="box" class="main-table" id="pendingContactTable" align="center">
	        <tr>
	            <th>First Name</th>
	            <th>Second Name</th>
	            <th>Telephone</th>
	            <th>Email</th>
	            <th colspan="2">Action</th>
	        </tr>
		  <%int i=0;%>	        
	      <c:forEach items="${userArrayList}" var="user">
	            <tr id="tr<%=i%>">
	                <td>${user.firstName}</td>
	                <td>${user.lastName}</td>
	                <td>${user.phone}</td>
	                <td>${user.email}</td>
	                <td><button name = "${user.userId}" value="tr<%=i%>" >confirm</button></td>
	                <td><button name = "${user.userId}" value="tr<%=i%>" >reject</button></td>
	                
	            </tr>
	        <%i++; %>
	        </c:forEach>
	    </table>
	   <p><a href="listUsers">Back</a></p>
    </form:form>
</body>
</html>