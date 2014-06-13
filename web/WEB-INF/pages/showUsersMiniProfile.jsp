<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="resources/javascript/paginationscript.js"></script>
<style>
/* #bkDiv{
	background-color: #363633; 
	color: #FFFFFF; 
	padding: 10px;
	border-radius:7px;
}

.box{
	overflow-x: auto;
} */

body{
	/* Setting default text color, background and a font stack */
	background:url('img/page_bg.jpg') repeat-x #383b3f;
}

#main{
	/* The main container div */
	/* position:relative;
	width:100%;
	background:url('img/main_bg.jpg') repeat-x #aeadad;
	border:1px solid #CCCCCC;
	padding:70px 25px 60px; */
	
	/* CSS3 rounded cornenrs */
	
	/* -moz-border-radius:12px;
	-webkit-border-radius:12px;
	border-radius:12px; */
	background-color: #363633; 
	/* color: #FFFFFF;  */
	padding: 10px;
	border-radius:7px;
}

#holder{
	/* The unordered list that is to be split into pages */

	width:497px;
	overflow:hidden;
	position:relative;
	/* background:url('img/dark_bg.jpg') repeat #4e5355; */
	padding-bottom:10px;

	/*	CSS3 inner shadow (the webkit one is commeted, because Google Chrome
		does not like rounded corners combined with inset shadows): */

	-moz-box-shadow:0 0 10px #222 inset;
	/*-webkit-box-shadow:0 0 10px #222 inset;*/
	/* box-shadow:0 0 10px #222 inset; */
}

.swControls{
	position:absolute;
	margin-top:10px;
}

a.swShowPage{

	/* The links that initiate the page slide */

	background-color:#444444;
	float:left;
	height:15px;
	margin:4px 3px;
	text-indent:-9999px;
	width:15px;
	/*border:1px solid #ccc;*/
	
	/* CSS3 rounded corners */
	
	/* -moz-border-radius:7px;
	-webkit-border-radius:7px; */
	border-radius:7px;
}

a.swShowPage:hover,
a.swShowPage.active{
	background-color:#2993dd;
	
	/*	CSS3 inner shadow */
	
	-moz-box-shadow:0 0 7px #1e435d inset;
	/*-webkit-box-shadow:0 0 7px #1e435d inset;*/
	box-shadow:0 0 7px #1e435d inset;
}

#holder li{
	background-color:#F4F4F4;
	list-style:none outside none;
	margin:12px 19px 0;
	padding:20px;
	float:left;

	/* Regular CSS3 box shadows (not inset): */

	-moz-box-shadow:0 0 6px #111111;
	-webkit-box-shadow:0 0 6px #111111;
	 box-shadow:0 0 6px #111111;
}

#holder,
#holder li{
	/* Applying rouded corners to both the holder and the holder lis */
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
}

.clear{
	/* This class clears the floated elements */
	clear:both;
}


/* The styles below are only necessary for the styling of the demo page */

/* h1{
	background-color:#272B2C;
	border-bottom:1px solid #000000;
	color:#EEEEEE;
	font-size:32px;
	font-weight:normal;
	margin-bottom:30px;
	padding:30px 0;
	text-align:center;
	
	-moz-box-shadow:0 1px 0 #444444;
	-webkit-box-shadow:0 1px 0 #444444;
	box-shadow:0 1px 0 #444444;
}

h1,h2{
	font-family:"Myriad Pro",Arial,Helvetica,sans-serif;
}

h2{
	font-size:14px;
	font-weight:normal;
	text-align:center;
	
	position:absolute;
	right:40px;
	top:43px;
} */


/* a:hover{
	text-decoration:underline;
}

a img{
	border:none;
} */
</style>
<%-- <div class="box">
	<table>
		<tr>
			<c:if test="${empty SEARCH_USERLIST}">
				<td><h3>No Users Found!</h3></td>
			</c:if>			
			<c:if test="${!empty SEARCH_USERLIST}">
			<c:forEach items="${SEARCH_USERLIST}" var="mini" varStatus="loop">
				<td>
					<div id="bkDiv" style="width: 200px; height: 150px;" align="center" onclick="loadThisUser('${loop.index}');">
					<table>
						<tr>
							<td >
								<c:if test="${mini.contentPath != null}">
									<img id="loadUserContenPath_${loop.index}" src="<c:url value="${mini.contentPath}" />" width="55px" height="50px"/>
								</c:if>
								<c:if test="${mini.contentPath == null}">
									<img id="loadUserContenPath_${loop.index}" src="/MediaLounge/resources/dummy/dummy.jpg" width="55px" height="50px" >
								</c:if>
							</td>
							<td></td>
							<td>
								<div class="caption" style="cursor: pointer;"><!-- onclick="loadThisUser('${mini.userId}')"  -->
								<h3 id="loadUserFirstName_${loop.index}">${mini.firstName}</h3></div>
								<input type="hidden" id="loadUserLastName_${loop.index}" value="${mini.lastName}"/>
								<input type="hidden" id="loadUserNickName_${loop.index}" value="${mini.nickName}"/>
								<input type="hidden" id="loadUserId_${loop.index}" value="${mini.userId}"/>
								<input type="hidden" id="loadUserStatusMessage_${loop.index}" value="${mini.statusMessage}"/>
							</td>
						</tr>
						<tr>
							<td>Location</td>
							<td>:</td>
							<td id="loadUserLocation_${loop.index}">${mini.country}</td>
						</tr>
						<tr>
							<td>Role</td>
							<td>:</td>
							<c:if test="${mini.role == null || mini.role.trim() == ''}">
							<td>No Records Found!!</td>
							</c:if>
							<c:if test="${mini.role != null || mini.role.trim() != ''}">
							<td>${mini.role}</td>
							</c:if>
							
						</tr>
						<tr>
							<td>Genre</td>
							<td>:</td>
							<c:if test="${mini.genre == null || mini.genre.trim() == ''}">
							<td>No Records Found!!</td>
							</c:if>
							<c:if test="${mini.genre != null || mini.genre.trim() != ''}">
							<td>${mini.genre}</td>
							</c:if>
						</tr>
					</table>
					</div>
				</td>
			</c:forEach>
			</c:if>
		</tr>
	</table>
</div> --%>
<div id="main">
    <ul id="holder" style="padding:0px;">
    <c:if test="${empty SEARCH_USERLIST}">
		<td><h3>No Users Found!</h3></td>
	</c:if>			
	<c:if test="${!empty SEARCH_USERLIST}">
	<c:forEach items="${SEARCH_USERLIST}" var="mini" varStatus="loop">
		<li style="height: 110px;">
			<div id="bkDiv" style="width: 437px; height: 75px;"  onclick="loadThisUser('${loop.index}');">
			<table style="float: left; width: 100%;">
				<tr>
					<td style="width: 20%">
					<table>
						<tr>
							<c:if test="${mini.contentPath != null}">
								<td rowspan="4" ><img id="loadUserContenPath_${loop.index}" src="<c:url value="${mini.contentPath}" />" width="85px" height="70px"/></td>
							</c:if>
							<c:if test="${mini.contentPath == null}">
								<td rowspan="4" ><img id="loadUserContenPath_${loop.index}" src="/MediaLounge/resources/dummy/dummy.jpg" width="85px" height="70px" ></td>
							</c:if>
						</tr>
					</table>
					</td>
					<td style="width: 40%">
					<table >
						<tr>
							<td>
							<div class="caption" style="cursor: pointer;"><!-- onclick="loadThisUser('${mini.userId}')"  -->
							<h4 id="loadUserFirstName_${loop.index}" style="color: #00AFEC; word-wrap: break-word ! important; display: block; position: relative; width: 145px ! important;">${mini.firstName}</h4></div>
							</td>
						<input type="hidden" id="loadUserLastName_${loop.index}" value="${mini.lastName}"/>
						<input type="hidden" id="loadUserNickName_${loop.index}" value="${mini.nickName}"/>
						<input type="hidden" id="loadUserId_${loop.index}" value="${mini.userId}"/>
						<input type="hidden" id="loadUserStatusMessage_${loop.index}" value="${mini.statusMessage}"/>
						</tr>
						<tr>
							<td id="loadUserLocation_${loop.index}">${mini.country}</td>
						</tr>
					</table>
					</td>
					<td style="width: 40%">
						<table>
							<tr>
								<td>Role</td>
								<td>:</td>
								<c:if test="${mini.role == null || mini.role.trim() == ''}">
								<td style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">No Records Found!!</td>
								</c:if>
								<c:if test="${mini.role != null || mini.role.trim() != ''}">
								<td style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${mini.role}</td>
								</c:if>
							</tr>
							<tr>
								<td>Genre</td>
								<td>:</td>
								<c:if test="${mini.genre == null || mini.genre.trim() == ''}">
								<td style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">No Records Found!!</td>
								</c:if>
								<c:if test="${mini.genre != null || mini.genre.trim() != ''}">
								<td style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${mini.genre}</td>
								</c:if>
							</tr>
					   </table>
				  </td>
				</tr>
			</table>
			</div>
		</li>
	</c:forEach>
	</c:if>
    </ul>
</div>
