<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.tzSelect{
	
	/* This is the container of the new select element */
	
	height:34px;
	display:inline-block;
	min-width:200px;
	position:relative;
	
	/* Preloading the background image for the dropdown */
	background:url("../img/dropdown_slice.png") no-repeat -99999px;
}

.tzSelect .selectBox{
	position:absolute;
	
	height:100%;
	width:100%;
	
	/* Font settings */
	
	font:13px/34px "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	text-align:center;
	text-shadow:1px 1px 0 #EEEEEE;
	color:#666666;

	/* Using CSS3 multiple backgrounds and a fallback */
	
	background:url('../img/select_slice.png') repeat-x #ddd;
	background-image:url('../img/select_slice.png'),url('../img/select_slice.png'),url('../img/select_slice.png'),url('../img/select_slice.png');
	background-position:0 -136px, right -204px, 50% -68px, 0 0;
	background-repeat: no-repeat, no-repeat, no-repeat, repeat-x;
	
	cursor:pointer;
	
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
}

.tzSelect .selectBox:hover,
.tzSelect .selectBox.expanded{
	background-position:0 -170px, right -238px, 50% -102px, 0 -34px;
	color:#2c5667;
	text-shadow:1px 1px 0 #9bc2d0;
}

.tzSelect .dropDown{
	position:absolute;
	top:40px;
	left:0;
	width:100%;
	border:1px solid #32333b;
	border-width:0 1px 1px;
	list-style:none;
	
	-moz-box-sizing:border-box;
	-webkit-box-sizing:border-box;
	box-sizing:border-box;
	
	-moz-box-shadow:0 0 4px #111;
	-webkit-box-shadow:0 0 4px #111;
	box-shadow:0 0 4px #111;
}


.tzSelect li{
	height:85px;
	cursor:pointer;
	position:relative;
	
	/* Again, using CSS3 multiple backgrounds with a fallback */
	
	background:url('../img/dropdown_slice.png') repeat-x #222;
	background-image:url('../img/dropdown_slice.png'),url('../img/dropdown_slice.png'),url('../img/dropdown_slice.png');
	background-position: 50% -171px, 0 -85px, 0 0;
	background-repeat: no-repeat, no-repeat, repeat-x;
}

.tzSelect li:hover{
	background-position: 50% -256px, 0 -85px, 0 0;
}

.tzSelect li span{
	left:88px;
	position:absolute;
	top:27px;
}

.tzSelect li i{
	color:#999999;
	display:block;
	font-size:12px;
}

.tzSelect li img{
	left:9px;
	position:absolute;
	top:13px;
}

/* Page Styles */

#footer{
	background-color:#212121;
	position:fixed;
	width:100%;
	height:70px;
	bottom:0;
	left:0;
}

a.tzine,a.tzine:visited{
	background:url("../img/tzine.png") no-repeat right top;
	border:none;
	color:#FCFCFC;
	font-size:12px;
	height:70px;
	left:50%;
	line-height:31px;
	margin:23px 0 0 110px;
	position:absolute;
	top:0;
	width:290px;
}

.tri{
	border-color:transparent transparent #212121;
	border-style:solid;
	border-width:20px 17px;
	height:0;
	left:50%;
	margin:-40px 0 0 -400px;
	position:absolute;
	top:0;
	width:0;
}

#footer h1{
	font-size:20px;
	font-weight:normal;
	left:50%;
	margin-left:-400px;
	padding:25px 0;
	position:absolute;
	width:400px;
}

/* a, a:visited {
	text-decoration:none;
	outline:none;
	border-bottom:1px dotted #97cae6;
	color:#97cae6;
} */

/*  a:hover{
	border-bottom:1px dashed transparent;
}  */

.clear{
	clear:both;
}

#userChatListDiv{
    float:left;
    width:65%;
    overflow:hidden;
}
#chatMessagesDiv{
    overflow:hidden;
}
 </style>
 <style>
        html, body {
            margin:0;
        }
        .tableContainer {
            height: 256px;
            overflow: auto;
        }
        .divTable {
            display: table;
            position: relative;
        }
        .divRow {
            display: table-row;
        }
        .headerRow {
            display: table-row;
            position: fixed;
            top: 0px;
            left: 0px;
            z-index: 1000;
            background-color: white;
        }
        .divCell {
            display: table-cell;
            padding: 3px;
            width: 75px;
        }
        .header {
            font-weight: bold;
        }
        table tr:nth-child(odd) td{
        	/*  background: #D8D8D8; */
        	 /* background: #E6F8E0; */
        	
		}
		/* table tr:nth-child(even) td{
			background: #380606;
		} */
		table.previousChatMessageTable tr:nth-child(odd) td{
        	background: #C4C4C4; 
		}
		.displayContacts:hover {
		 	background: #380606; 
		 }
		textarea {
   			resize: none;
		} 
    </style>

    <script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>

    <script>
       function newUserSelect(){
    	  // alert("I am called "+$(' #newSelectUser option:selected').html());
    	    var chatUserImgLocal = "",chatUserNameLocal="";
    	    
    	   if(parseInt($('#newSelectUser option:selected').attr('id'))  > 0 ){
    		 //  alert($('#newSelectUser option:selected').val());
    		   chatUserNameLocal =$(' #newSelectUser option:selected').html();
    		  // alert("new user name"+chatUserNameLocal);
    		   chatUserImgLocal = $('#newSelectUser option:selected').val();
    		   $('#chatSpecificUserName').html($('#newSelectUser option:selected').text());
        	   $('#chatUserId').val($('#newSelectUser option:selected').attr('id'));
        	  
        	   if($.trim($('#newSelectUser option:selected').val()) !== ""){
        		  // alert("1");
        		   $("#chatUserImgSrc").attr('src',"/MediaLounge"+$('#newSelectUser option:selected').val());
        		 //  alert( $("#chatUserPhoto").attr('src'));
        	   }else{
        		   //alert("2");
        		   $("#chatUserPhoto").attr('src',"/MediaLounge/resources/dummy/dummy.jpg");
        	   }
        	  /*  $('#chatUserPhoto').src("/MediaLounge"+$('#newSelectUser option:selected').val());
        	   alert("photo is "+$('#chatUserPhoto').html());  */
	  	 		$.ajax({
					url : 'getPreviousChatsMessages',
					data : {
						'chatUserId' : $('#chatUserId').val()
					},
					type : 'GET',
					success : function(data) {
						 //$('#chatsTable').html(data);
						$('#chatDivWrapper').html(data);
						//alert("ne wuser "+chatUserImgLocal);
						if(chatUserImgLocal == "" ){
							$("#chatUserImgSrc").attr('src',"/MediaLounge/resources/dummy/dummy.jpg");
						}else{
							$("#chatUserImgSrc").attr('src',"/MediaLounge"+chatUserImgLocal);
						}
						
						$("#chatUserNameTd").html(chatUserNameLocal);
						//$("#chatUserVisible").css("display","block");
						
						
					},
					error : function(xhr, ajaxOptions,
							thrownError) {
						genericException();
					}
				});
	    	}
       }
       function getParticularUserChatDetails(chatUserId){
    	   var chatUserLocal = $('#chatUserId_'+chatUserId).val();
    	   var chatUserPhoto = $('#chatImg_'+chatUserId).attr('src');
    	   //alert($('#chatUserId_'+chatUserId).val());
    	   $('#chatSpecificUserName').html($('#chatUserId_'+chatUserId).val());
    	   $('#chatUserId').val(chatUserId);
    	   $("#chatUserPhoto").attr('src',$('#chatImg_'+chatUserId).attr('src'));
    	   //alert($('#chatImg_'+chatUserId).attr('src'));
    	   $.ajax({
				url : 'getPreviousChatsMessages',
				data : {
					'chatUserId' : $('#chatUserId').val()
				},
				type : 'GET',
				success : function(data) {
					// $('#chatsTable').html(data);
					$('#chatDivWrapper').html(data);
					$("#chatUserNameTd").html(chatUserLocal);
					if(chatUserPhoto == "" ){
						$("#chatUserImgSrc").attr('src',"/MediaLounge/resources/dummy/dummy.jpg");
					}else{
						$("#chatUserImgSrc").attr('src', chatUserPhoto);
					}
					//$("#chatUserImgSrc").attr('src', $("#chatUserPhoto").attr('src'));
					
				},
				error : function(xhr, ajaxOptions,thrownError) {
					//alert(xhr.responseText);
					//alert(thrownError);
					genericException();
				}
			});
       }
       function sendChatMessage(){
    	   if(parseInt($('#chatUserId').val()) > 0 && ($.trim($("#chatMessageText").val()) != "")){
    		    $.ajax({
				url : 'sendChatMessage',
				data : {
					'chatUserId' : $('#chatUserId').val(),
					'chatMessageText' : $.trim($("#chatMessageText").val())
				},
				type : 'GET',
				success : function(data) {
					// $('#chatsTable').html(data);
					$('#chatDivWrapper').html(data);
				},
				error : function(xhr, ajaxOptions,
						thrownError) {
					//alert(xhr.responseText);
					//alert(thrownError);
					genericException();
				}
			}); 
    	   }
       }
    </script>
  
<div id="chatDivWrapper" style="border: 2px solid;height: 290px;color:#eee; background-color:#E6E6E6;font:15px Calibri,Arial,sans-serif;">
<!--User List Div  -->
	
    <div id="userChatListDiv" style="border: 2px solid;color: #F3F8F8; height:100%;width: 38%;" >
    <table border="0" frame="box" style="height: 20px;width: 100%" >
		<tr bgcolor="#2E9AFE" id="chatUserVisible" >
			<c:choose>
			    <c:when test="${empty sessionScope.userDto.contentPath}">
			        <td align="left" valign="middle"><img id="chatUserImgSrc" src='<c:url value="/resources/dummy/dummy.jpg" />' width="60" height="39" /></td>
			    </c:when>
			    <c:otherwise>
			        <td align="left" valign="middle"><img id="chatUserImgSrc" src='<c:url value="${sessionScope.userDto.contentPath}" />' width="35" height="39" /></td>
			    </c:otherwise>
			</c:choose>
			<%-- <td align="left" valign="middle"><img id="chatUserImgSrc" src='<c:url value="/resources/dummy/dummy.jpg" />' width="60" height="39" /></td> --%>
			<td align="left" id="chatUserNameTd">${sessionScope.userDto.firstName} ${sessionScope.userDto.lastName}</td>
		</tr>

   		<tr bgcolor="#2E9AFE">
   		<td ><font color="white" style="font-weight: bold;">New&nbsp;User</font></td>
   		<td>
   			<select class="" onchange="newUserSelect()" id="newSelectUser">
	  			<option value="0" selected="selected" data-skip="1">Select User</option>
	        	<c:forEach items="${contactList}" var="user">
	        		<option value="${user.contentPath}" id="${user.userId}" data-html-text="${user.firstName} ${user.lastName}">${user.firstName} ${user.lastName}</option>
	        	</c:forEach>
   			</select>
   		</td>
 	</tr>
   </table> 
   
    <div class="tableContainer" id="ex3" style="border: 2px solid; color:;width: 100%">
    <div class="divTable" style="width:100%">
        <!-- <div class="divRow headerRow">
            <div class="divCell header">A</div>
        </div> -->
        <div class="divRow" style="width:100%">
            <div class="divCell" style="width:100%">	
				<table style="width: 100%" frame="above">
				<c:forEach items="${previousChatsUsers}" var="user">
						<tr class="" onclick="getParticularUserChatDetails('${user.userId}')"  value="tr_${user.userId}" style="cursor: pointer;">
						<c:choose>
						    <c:when test="${empty user.contentPath}">
						        <td width="3%"> <img id="chatImg_${user.userId}" src='<c:url value="/resources/dummy/dummy.jpg" />' width="39" height="39" /> </td> 
						    </c:when>
						    <c:otherwise>
						        <td width="3%"> <img id="chatImg_${user.userId}" src='<c:url value="${user.contentPath}" />' width="39" height="39" /></td>
						    </c:otherwise>
						</c:choose>
						<td valign="middle" align="left">
						<input type="hidden" id="chatUserId_${user.userId}" value="${user.firstName} ${user.lastName}"/>
							<a id="sp_${user.userId}">${user.firstName} ${user.lastName}</a>
							  <c:if test="${user.unreadMessageCount gt 0 }">
								<span class="badge">${user.unreadMessageCount}</span></td>
							</c:if> 
						</tr>
				</c:forEach>	
				</table>
			</div>
        </div>
    </div>
</div>
	</div><!--  User div Ends-->
    <div id="chatMessagesDiv" style="border: 2px solid;width:62%;height: 100%">
    	<div id="previousChatMessages" style="border: 2px solid;height:232px;overflow:auto;">
    		<div id="previousChatMessagesOfPartciularUser">
					<table border="0" width="100%" id="previousChatMessageTable" class="previousChatMessageTable" >
						 <c:choose>
					      <c:when test="${fn:length(previousChatMessagesOfPartciularUser) gt 0 }">
					      	<c:forEach items="${previousChatMessagesOfPartciularUser}" var="previousMessage">
			        			<tr  style="color: black" class="particularChatUserId" id="">
			        				 <c:choose>
					      			 <c:when test="${ previousMessage.messageFrom.userId eq sessionScope.userDto.userId}">
					      					<td align="left" background="" width="10%"><font color="#00AAF1"><b>${previousMessage.messageFrom.firstName}&nbsp;${previousMessage.messageFrom.lastName}</b>
					      						</font>&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small;">
					      							<%-- <fmt:formatDate type="both" value="${previousMessage.created}" /> --%>
					      							<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${previousMessage.created}" />
					      							</span>
					      						<br/><span><font color="#000000" style="font-size: small;">${previousMessage.description}</font></span>
					      					</td>
					      				</c:when>
					      				<c:otherwise> 
									        <td align="left" background="" width="10%"><font color="#00AAF1"><b>${previousMessage.messageFrom.firstName}&nbsp;${previousMessage.messageFrom.lastName}</b>
									        	</font>&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small;">
									        		<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${previousMessage.created}" />
									        		
									        		</span> 
									        	<br/><span><font color="#000000" style="font-size: small;">${previousMessage.description}</font></span>
									        </td>
									    </c:otherwise>
					      			</c:choose> 
					      			<%-- <td align="left" background="" width="10%"><font color="#0000FF"><b>${previousMessage.messageFrom.firstName}&nbsp;${previousMessage.messageFrom.lastName}</b></font>&nbsp;&nbsp; </td> --%>
			        				<%-- <td><font color="#0000FF">${previousMessage.description}</font></td> --%>
								</tr>
			        		</c:forEach>
					      </c:when>
					      <c:otherwise>
					      </c:otherwise>
					</c:choose> 
						<%-- <c:if test="${empty  previousChatMessagesOfPartciularUsert }">  
							<p >I am empty</p>
						</c:if> --%>
					</table>
				</div>
				<div id="chatsTable"></div>
    	</div>
    	<div id="currentChatMessages" style="border: 2px solid;color: ;height:80px; vertical-align: middle;">
			<table style="width: 100%">
				<tr>	
					<td><textarea rows="2" cols="30" id="chatMessageText" maxlength="255"></textarea></td>
					<td valign="middle" align="center"><input type="button" value="Send" onclick="sendChatMessage()" class="btn btn-primary"/></td>
				</tr>
			</table>
		</div>
    </div>
    <div style="border-radius:7px;"> <!-- style="background-image: url('/MediaLounge/resources/dummy/PPC 2.jpg');background-repeat: repeat-x;" -->
    	 <img src="/MediaLounge/resources/dummy/PPC 2.jpg" style="width: 100%" height="28px" />  
    </div>
</div>

<style>
.div_backgrndimg
{
    background-repeat: repeat-y;
    background-image: url("/MediaLounge/resources/dummy/PPC 2.jpg");
    width:200px;
}
</style>