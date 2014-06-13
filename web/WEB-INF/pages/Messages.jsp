<%@page import="com.medialounge.reevo.dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Recorded Evolution - Home Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugin1/css/style.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js1/jquery-1.6.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugin1/jquery-jplayer/jquery.jplayer.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugin1/ttw-music-player-min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js1/myplaylist.js"/>"></script>
<script type="text/javascript">
<%-- <%HttpServletResponse httpResponse = (HttpServletResponse) response;
httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
httpResponse.setDateHeader("Expires", 0); // Proxies.%> --%>

 function saveMessage() {
	var a  = $("#status").val();
	var b  = $("#messageFrom").val();
	var c  = $("#messageTo").val();
	var d  = $("#description").val(); 
	$.ajax({
		url : "/MediaLounge/saveUserMessage",
		type : 'GET',
		data: {
			status: a , messageFrom: b, messageTo: c,  description: d
		    },
		success : function(response) {
			getMessage(b,c);
		},
		error : function() {
			getMessage(b,c);
		}
	});
}
 function getMessage(user,messageFrom){
		$.ajax({
			url : "/MediaLounge/getUserMessage123",
			type : 'GET',
			data: {
				loginUser: user , messageFrom: messageFrom
			 },
			success : function(response) {
				document.getElementById("chatMessage").innerHTML = response;
				viewFrndMsg(user,messageFrom);
			},
			error : function() {
				/* alert("error"); */
				viewFrndMsg(user,messageFrom);
			}
		});
	}
 
 function viewFrndMsg(loginUser,messageFrom){
		$.ajax({
			url : "/MediaLounge/viewFrndMsg",
			type : 'GET',
			data: {
				loginUser: loginUser , messageFrom: messageFrom
			    },
			success : function(response) {
				getMessagedFriend(loginUser,messageFrom);
				
			},
			error : function() {
			/* 	alert("error"); */
			}
		});
	}
 
	 
	
	function getFriendContactList(user){
		$.ajax({
			url : "/MediaLounge/getFriendContactList",
			type : 'GET',
			data: {
				loginUser: user 
			 },
			success : function(response) {
				document.getElementById("chatMessage").innerHTML = response;
				
			},
			error : function() {
				/* alert("error"); */
				
			}
		});
	}
	
	function getMessagedFriend(loginUser,messageFrom){
		$.ajax({
			url : "/MediaLounge/getMessagedFriend",
			type : 'GET',
			data: {
				loginUser: <%=(String)request.getAttribute("loginUser")%> 
			    },
			success : function(response) {
				document.getElementById("messegedfriend").innerHTML = response;
				getFriendMessageCount(loginUser,messageFrom);
			},
			error : function() {
				/* alert("error"); */
			}
		});
	}
	function getFriendMessageCount(loginUser,messageFrom){
		 <%
			String loginUser1 = (String)request.getAttribute("loginUser");
		 	//System.out.println("loginUser "+loginUser1);
			ArrayList user1 = (ArrayList)request.getAttribute("user");
			//System.out.println("size is ==> "+user1.size());
		 	for(int i = 0; i< user1.size();i++){
		 		if(i == 0 || i%2 == 0)	{
		 			//System.out.println("size is ==> "+user1.get(i));
		 %>
			$.ajax({
				url : "/MediaLounge/getFriendMessageCount",
				type : 'GET',
				 data: {
					user: <%=user1.get(i)%> , loginUser: <%=loginUser1%>
				    }, 
				success : function(response) {
					if(response != 0)
						{
						document.getElementById(<%=user1.get(i) %>).innerHTML = response ;
						}
				},
				error : function() {
					/*  alert("error");  */
				}
			});
		 <%}}%> 
	
	 }
 $(document).ready(function(){
     var description = 'Media Lounge ';

     $('#myPlayer').ttwMusicPlayer(myPlaylist, {
         autoPlay:false,
         description:description,
         jPlayer:{
             swfPath:'<c:url value="/resources/plugin1/jquery-jplayer"/>' //You need to override the default swf path any time the directory structure changes
         }
     });
 });
</script>
</head>
<body onload="getMessagedFriend('1','2');">
	<header>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="pull-left">
							<a class="navbar-brand" href="#">RECORED EVOLUTION</a>
						</div>
						<div class="pull-left mediaPlayer">
							<div class="pull-left mediaBox" id="myPlayer">
								<!-- Music Player comes here -->
							</div>
							<div class="pull-left mediaLinks">
								<div class="btn-group">
									<a data-toggle="dropdown" href="#">Feedback</a>
									<ul class="dropdown-menu feedbackPopup" role="menu">
										<li>
											<h3>Feedback</h3>
											<div class="panel panel-default">
												<div class="panel-heading panelGreen">Vocals</div>
												<div class="panel-body">Wrote water woman of heart it
													total other. By in entirely securing suitable graceful at
													families improved. Zealously few furniture repulsive was
													agreeable consisted difficult. Collected breakfast
													estimable questions in to favourite it. Known he place
													worth</div>
											</div>
											<p class="text-right info">
												Charaters 312/ <span class="userInfoClr">500</span>
											</p>
											<div class="panel panel-default">
												<div class="panel-heading panelOrange">Lyrics</div>
												<div class="panel-body">Nor hence hoped her after
													other known defer his. For county now sister engage had
													season better had waited. Occasional mrs interested far
													expression acceptance. Day either mrs talent pulled men
													rather regret admire but. Life ye sake it shed. Five lady
													he</div>
											</div>
											<p class="text-right info">
												Charaters 312/ <span class="userInfoClr">500</span>
											</p>
											<div class="panel panel-default">
												<div class="panel-heading panelRed">Instrumental</div>
												<div class="panel-body">Built purse maids cease her
													ham new seven among and. Pulled coming wooded tended it
													answer remain me be. So landlord by we unlocked sensible
													it. Fat cannot use denied excuse son law. Wisdom happen
													suffer common the appear ham beauty her had.</div>
											</div>
											<p class="text-right info">
												Charaters 312/ <span class="userInfoClr">500</span>
											</p>
											<div class="feedbackOptions">
												<div class="pull-left">
													<div class="checkbox">
														<label> <input type="checkbox"> Would buy
															this
														</label>
														<div class="clearfix"></div>
														<button class="btn btn-primary">Submit</button>
														<button class="btn btn-primary">Shared</button>
													</div>
												</div>
												<div class="pull-right">
													<p class="text-right">
														Overall 4/5 <br> <img
															src="<c:url value="/resources/images/rating.gif"/>">
													</p>
												</div>
												<div class="clearfix"></div>
											</div>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
								<div class="btn-group">
									<a data-toggle="dropdown" href="#">Share</a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul>
								</div>
								<div class="clearfix"></div>
								<div class="btn-group">
									<a data-toggle="dropdown" href="#">Add to Playlist</a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="pull-right cartInfo">
							<form class="navbar-form navbar-left" role="search">
								<span class="glyphicon glyphicon-cart"></span> 1 - Item(s) €0.00
								Checkout
								<div class="clearfix"></div>
								<div class="input-group headerSearch pull-right">
									<span class="input-group-addon glyphicon glyphicon-search"></span>
									<input class="form-control" type="text"
										placeholder="Type It, Search It, Find It">
								</div>
								<div class="clearfix"></div>
								<a class="linkWhite" href="#">Detailed search</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div id="mainContent" class="container">
		<section>
			<div class="row">
				<div class="col-lg-3 leftColumn">
					<a class="icon-home" href="listUsers" title="Home"></a>
					<div class="userInfo" id="messegedfriend">
					<%-- <%
						ArrayList user = (ArrayList)request.getAttribute("user");
						String loginUser = (String)request.getAttribute("loginUser");
					%>
						<h2>Messages</h2>
						<h5><span style="cursor: pointer;" onclick="getFriendContactList('<%=loginUser%>')">New Message</span></h5>
						<p>
							<span class="userInfoClr"> <strong>Search:</strong>
							</span> <input type="text" style:"height:10px;"="">
						</p>
						<ul class="list-group">
						<%
							for(int i=0; i<user.size(); i++){
							
						%>
							<li class="list-group-item"><a href="#" onclick="getMessage('<%=loginUser%>','<%=user.get(i)%>')"><%=user.get(++i)%></a>
							<span class="badge" id="<%=user.get(--i) %>" ></span>
							</li>
						<% ++i; }%>
						</ul> --%>
					</div>
					
				</div>
			<div class="col-lg-6 contentSection">
				<div style="height: 130px"></div>
					<div id="chatMessage"></div>
				</div>
				
			</div>
		</section>
	</div>
	<footer>
		<nav class="navbar navbar-default navbar-fixed-bottom"
			role="navigation">
			<div class="container">
				<ul class="list-inline">
					<li style="width: 250px;">
						<div id="myWallet">
							<h3>My Wallet</h3>
							<div class="pull-left">$ 200.00</div>
							<div class="pull-right">
								<span class="clrBlue">USD</span> GBP EUR
							</div>
							<div class="clearfix"></div>
							<p class="text-right">
								<img src="<c:url value="/resources/images/makeTranfer.gif"/>">
							</p>
						</div>
					</li>
					<li>
						<ul class="list-inline">
							<li><img src="<c:url value="/resources/images/bottomLink1.gif"/>">
							</li>
							<li><img src="<c:url value="/resources/images/bottomLink2.gif"/>">
							</li>
							<li><img src="<c:url value="/resources/images/bottomLink3.gif"/>">
							</li>
							<li><img src="<c:url value="/resources/images/bottomAd.gif" />">
							</li>
						</ul>
					</li>
					<li class="suggestionBox"><a id="suggestionLink" href="#">Suggestions</a>
						<div id="suggestionBox">
							<h3>Suggestions</h3>
							<textarea> Type Here... </textarea>
							<div class="checkbox leftPad-30">
								<label> <input type="checkbox"> Report a problem
								</label>
							</div>
							<div class="checkbox leftPad-30">
								<label> <input type="checkbox"> Make an
									Improvement
								</label>
							</div>
							<div class="checkbox leftPad-30">
								<label> <input type="checkbox"> New idea
								</label>
							</div>
							<div class="checkbox leftPad-30">
								<label> <input type="checkbox"> Show
									appreciation
								</label>
							</div>
							<div class="col-lg-6">
								<div class="media">
									<a class="pull-left" href="#"> <img class="media-object"
										alt="..."
										src="<c:url value="/resources/images/suggesstion_icon1.gif" />">
									</a>
									<div class="media-body">
										Voice <br> Feedback
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="media">
									<a class="pull-left" href="#"> <img class="media-object"
										alt="..."
										src="<c:url value="/resources/images/suggesstion_icon2.gif" />">
									</a>
									<div class="media-body">
										Voice <br> Feedback
									</div>
								</div>
							</div>
						</div></li>
				</ul>
			</div>
		</nav>
	</footer>
<!-- <script src="javascript/jquery.js"> -->
<script src="<c:url value="/resources/javascript/bootstrap.min.js"/>"></script>
		</body>
		</html>
	