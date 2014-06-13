<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html> --%>
<%@ include file="header.jsp" %>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
    <title>Employees</title>
    <link rel="stylesheet" href="/timesheet-app/resources/style.css" type="text/css">
    <style type="text/css">
		#listUsrTbl tr th {
			background-color: #AAA;
			padding: 5px;
		}
		
		#listUsrTbl tr:nth-child(even) {
			background-color: #ffd;
		}
		
		#listUsrTbl tr:nth-child(odd) {
			background-color: #ddd;
		}
		
		#listUsrTbl tr td {
			padding: 3px;
		}
    </style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
function userMessageCount(loginUser){
	$.ajax({
		url : "/MediaLounge/userMessageCount",
		type : 'GET',
		data: {
			loginUser: loginUser
		    },
		success : function(response) {
			if(response!=0){
				document.getElementById("msgcount").innerHTML = response;
			}
		},
		error : function() {
			/* alert("error"); */
		}	
	});
}
function getStatusPage(loginUser){
	$.ajax({
		url : "/MediaLounge/getStatusPage",
		type : 'GET',
		data: {
			loginUser: loginUser
		    },
		success : function(response) {
			if (response !=0) {
				document.getElementById("statusBar").innerHTML = response;
			}
		},
		error : function() {
			alert("error");
		}	
	});
}
function saveStatus(loginUser){
	var status = document.getElementById("status").value;
	$.ajax({
		url : "/MediaLounge/saveStatus",
		type : 'GET',
		data: {
			loginUser: loginUser, status: status
		    },
		success : function(response) {
			document.getElementById("status").value ="";
		},
		error : function() {
			alert("error");
		}	
	});
}
</script>
</head>
<%String userId = (String)request.getSession().getAttribute("userSessionId"); 
	//System.out.println("userId : "+userId);
%>

<body style="background-color: #E7E7E7;" onload="userMessageCount('<%=userId%>')">
<jsp:include page="header.jsp"></jsp:include>
   	<div align="center">
   		<div><h1>Welcome to Medialounge</h1><span style="float: right;margin-right: 150px;margin-top: -70px;"><h3>Hello, ${userName} </h3></span></div>
   		<a href="getMyProfilePage">My Profile</a>&nbsp;&nbsp;<a href="getNewContactsList">Add new Contact</a> &nbsp;&nbsp;  <a href="pendingContactlist">Get Pending Contacts</a> &nbsp;&nbsp; <a href="getContactList">Get Contacts</a> &nbsp;&nbsp;
   		<a href="jobHomePage">Job Page</a>&nbsp;&nbsp;<a href="featuredJob">Featured Job</a>&nbsp;&nbsp; <a href="carrierHomePage">Carrier</a>&nbsp;&nbsp;<a href="listOfMedias?type=MyFeed">My Feed</a><br/>&nbsp;&nbsp;<a href="Messages?userId=<%=userId%>">Message<span class="badge" id="msgcount" ></span></a>&nbsp;&nbsp;<a href="suggestion?userId=<%=userId%>">Suggestions</a><br/>
   	</div>
   	<div align="center">
   		<a onclick="getStatusPage('<%=userId%>')" style="cursor: pointer;">Update Status</a>&nbsp;&nbsp;<a href="friendsStatus?userId=<%=userId%>">Know Friend's Status</a> 
   		<div id="statusBar"></div>
   	</div><br/>
    <table cellspacing="0" frame="box" align="center" id="listUsrTbl" class="main-table">
        <tr>
            <th>First Name</th>
            <th>Second Name</th>
            <th>Telephone</th>
            <th>Email</th>
        </tr>
      <c:forEach items="${userArrayList}" var="user">
            <tr>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                
            </tr>
        </c:forEach>
    </table>
    <br />
    <div align="center">
   	 	<a href="loginUserHome" onclick=" $.cookie('reevoUserEmail','');">Logout</a>
   	</div>
</body>
</html>