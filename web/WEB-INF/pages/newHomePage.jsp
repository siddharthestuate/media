<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
/*  Retrieving login userid and email from session, In case the session is null, sets the userId and email as 0
	The criteria will be used to check session persists for the logged in user.
*/
	String userId = (String) request.getSession().getAttribute("userSessionId");
	if(userId == null) {
		userId = "0";
	}
	String userEmail = (String) request.getSession().getAttribute("userSession");
	if(userEmail == null) {
		userEmail = "0";
	}
	
	
%>

<html>
<head>
    <title>Recorded  Evolution</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="resources/css/styles.css" rel="stylesheet" />
    <link href="resources/css/nanoscroller.css" rel="stylesheet" />
	 <link href="resources/css/medialounge.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="resources/javascript/html5shiv.js"></script>
      <script src="resources/javascript/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/javascript/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/javascript/bootstrap.min.js"></script>
    <script src="resources/javascript/common.js"></script>
	<script type="text/javascript" src="resources/javascript/jquery.aw-showcase.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js1/jquery.cookiess.js" />"></script>
	<script type="text/javascript" src="resources/javascript/jquery.nanoscroller.min.js"></script>
	<script type="text/javascript" src="resources/javascript/medialounge.js"></script>
	<script type="text/javascript" src="http://www.jugbit.com/jquery/jquery.vticker-min.js"></script>
	<script type="text/javascript" src="resources/javascript/thumbnail-slider.js"></script>
	<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
	<!-- <script src="//maps.googleapis.com/maps/api/js?sensor=false"></script> 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/jquery.lazy.min.js" />" ></script>
	
	<!--Scripts For Music Player start -->
	<script type="text/javascript" src="resources/plugin1/jquery-jplayer/jquery.jplayer.js"></script>
    <script type="text/javascript" src="resources/plugin1/ttw-music-player-min.js"></script>
    <script type="text/javascript" src="resources/js1/myplaylist.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/plugin1/css/style.css">
    <!-- <link rel="stylesheet" type="text/css" href="resources/plugin1/css/demo.css"> -->
	<!--Scripts For Music Player End -->
	
  </head>
  <body onload="checkSession('<%=userId%>');">
    <c:if test="${sessionScope.userDto != null}" >
		<input type="hidden" id="myUserId" value="${sessionScope.userDto.userId}"/>
	    <input type="hidden" id="myloginId" value="${sessionScope.userDto.email}"/>
	    <input type="hidden" id="myFirstName" value="${sessionScope.userDto.firstName}"/>
	    <input type="hidden" id="myLastName" value="${sessionScope.userDto.lastName}"/>
	     <input type="hidden" id="myNicktName" value="${sessionScope.userDto.nickName}"/>
	     <input type="hidden" id="mylocation" value="${sessionScope.userDto.country}"/>
	     <c:choose>
	     	<c:when test="${empty sessionScope.userDto.contentPath}">
	    		<input type="hidden" id="myPhoto" value='<c:url value="/resources/dummy/dummy.jpg" />'/>
	   	 </c:when>
	   	 <c:otherwise>
	   	 	<input type="hidden" id="myPhoto" value='<c:url value="${sessionScope.userDto.contentPath}"/>'/>
	   	 </c:otherwise>
	    </c:choose>
	    <input type="hidden" id="chatUserId" value="-1"/>
	     <input type="hidden" id="chatUserName" value=""/>
	     <input type="hidden" id="selectedMediaId" value="-1"/>
	</c:if>
	 <c:if test="${sessionScope.userDto == null}" >
			<script>
				logoutUser();
			</script>
	</c:if>
    <header>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
           <div class="container">
           		<div class="row">
                	<div class="col-md-12">
                        
                             <div class="pull-left">
                                <a class="navbar-brand" title="Home" style="cursor: pointer;" onclick="window.location.reload();"></a>
                            </div>
                            
<!--                            <div class="pull-left brandLogo">
                            	<img src="resources/images/nike_logo.png" />
                            </div>-->
                            
                            <div class="pull-left mediaPlayer">
                                <div class="pull-left mediaBox">
                                    <!-- <img src="resources/images/media_player.gif" /> -->
                                    <div id="musicPlayer"></div>
                                </div>
                                
                                <!--<div class="pull-left mediaLinks">
                                        <div class="btn-group">
                                          <a href="#" data-toggle="dropdown">Feedback</a>

                                              <ul class="dropdown-menu feedbackPopup" role="menu">
                                                <li>
                                                	<h3>Feedback</h3>
                                                    <div class="panel panel-default">
                                                      <div class="panel-heading panelGreen">Vocals</div>
                                                      <div class="panel-body">
                                                        Wrote water woman of heart it total other. By in entirely securing suitable graceful at families improved. Zealously few furniture repulsive was agreeable consisted difficult. Collected breakfast estimable questions in to favourite it. Known he place worth 
                                                      </div>
                                                    </div>
                                                    <p class="text-right info">Charaters 312/<span class="userInfoClr">500</span></p>
                                                    
                                                    <div class="panel panel-default">
                                                      <div class="panel-heading panelOrange">Lyrics</div>
                                                      <div class="panel-body">
                                                        Nor hence hoped her after other known defer his. For county now sister engage had season better had waited. Occasional mrs interested far expression acceptance. Day either mrs talent pulled men rather regret admire but. Life ye sake it shed. Five lady he  
                                                      </div>
                                                    </div>
                                                    <p class="text-right info">Charaters 312/<span class="userInfoClr">500</span></p>
                                                    
                                                    <div class="panel panel-default">
                                                      <div class="panel-heading panelRed">Instrumental</div>
                                                      <div class="panel-body">
                                                        Built purse maids cease her ham new seven among and. Pulled coming wooded tended it answer remain me be. So landlord by we unlocked sensible it. Fat cannot use denied excuse son law. Wisdom happen suffer common the appear ham beauty her had. 
                                                      </div>
                                                    </div>
                                                    <p class="text-right info">Charaters 312/<span class="userInfoClr">500</span></p>
                                                    
                                                    <div class="feedbackOptions">
                                                    	<div class="pull-left">
                                                          <div class="checkbox">
                                                            <label>
                                                              <input type="checkbox"> Would buy this
                                                            </label>
                                                            <div class="clearfix"></div>
                                                            <button class="btn btn-primary">Submit</button>
                                                            <button class="btn btn-primary">Shared</button>
                                                          </div>
                                                        </div>
                                                    	<div class="pull-right">
                                                        	<p class="text-right">Overall 4/5<br /><img src="resources/images/rating.gif" /></p>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    
                                                </li>
                                              </ul>
                                        </div>
                                        
                                        <div class="clearfix"></div>
                                        
                                        <div class="btn-group">
                                          <a href="#" data-toggle="dropdown">Share</a>
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
                                          <a href="#" data-toggle="dropdown">Add to Playlist</a>
                                          <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Separated link</a></li>
                                          </ul>
                                        </div>
                                        
                                </div>-->
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="pull-right cartInfo">
                                    <form class="navbar-form navbar-left" role="search">
                                        <span class="glyphicon glyphicon-cart"></span> 0 - Item(s)&nbsp;&nbsp;0.00&nbsp;&nbsp;<a href="#">Checkout</a>
                                        <div class="clearfix"></div>
                                        
                                        
                                     <div class="dropdown">   
                                          <div class="input-group headerSearch pull-right">
                                            <input type="text" class="form-control search-field-header" placeholder="Type,Search,Find" id="searchItem"/>
                                            <span class="input-group-addon glyphicon glyphicon-align-justify" id="dropdownMenu1" data-toggle="dropdown" onclick="showUsersMiniProfile();" style="cursor: pointer;"></span>
                                            
                                            <ul class="dropdown-menu advancedSearch">
                                            <li class="clrBlue searchTitle" style="padding-left: 10px;">Advanced Search</li>
                                            <li><a href="#">Role</a></li>
                                            <li><a href="#">Skills &amp; expertise</a></li>
                                            <li><a href="#">Facilities</a></li>
                                            <li><a href="#">Characteristics</a></li>
                                            <li><a href="#">Hash Tag</a></li>
                                            <li><a href="#">Price</a></li>
                                            <li><a href="#">Location/Radius</a></li>
                                            <li><a href="#">Language</a></li>
                                            <li><a href="#" class="clrBlue">English</a></li>
                                            <li><a href="#" class="clrBlue">Espanol</a></li>
                                            <li><a href="#" class="clrBlue">Deutsche</a></li>
                                            <li><a href="#" class="clrBlue">Francais</a></li>
                                            <li><a href="#" class="clrBlue">Nihongo</a></li>
                                            <li><a href="#">Resources</a></li>
                                            <li><a href="#">Content Type</a></li>
                                            <li><a href="#">Status</a></li>
                                            <li><a href="#">Years of experience</a></li>
                                            <li><a href="#">Inspiration</a></li>
                                            <li><a href="#">Instruments</a></li>
                                            <li><a href="#">Genre</a></li>
                                            <li><a href="#">Groups</a></li>
                                            <li class="clrBlue recentSearchTitle" style="padding-left: 10px;">Recent Search</li>
                                            <li><a href="#">Search One</a></li>
                                            </ul>
                                            
                                          </div>
                                      
                                      </div>
                                      
                                      <div class="clearfix"></div>
                                      <!--<a href="#" class="linkWhite">Detailed search</a>-->
                                  </form>
                            </div>
                    
                    
                    </div>
            	</div>
           </div>
        </nav>
    </header>
    
    <div class="clearfix"></div>
  	<div class="container" id="mainContent">        
        <section>
        	<div class="row">
            	<div class="col-md-2 leftColumn">
                	<!--<a class="icon-home" href="#"></a>-->
                    <div id="profileImage">
                    	<c:choose>
	                   		<c:when test="${sessionScope.userDto.contentPath == null || fn:length(fn:trim(sessionScope.userDto.contentPath)) eq 0}">
	                   			 <img id="profileUserPic" src="/MediaLounge/resources/dummy/dummy.jpg" class="userPicture" style = "height: 190px; width: 190px;">
	                   		</c:when>
	                   		<c:otherwise>
	                   			 <img id="profileUserPic" src="<c:url value="${sessionScope.userDto.contentPath}"/>" class="userPicture" style = "height: 190px; width: 191px;" />
	                   		</c:otherwise>
	                   	</c:choose>
                    	<img src="/MediaLounge/resources/dummy/bottom_userPhoto.png" style="position: absolute; top: 165px !important; left: 0px !important; width:191px; height: 25px;">
                    </div>
                    
                    <div id="profileDiv" class="userInfo" style="display:block;">
                    	 	<c:choose>
	                    		<c:when test="${sessionScope.userDto.nickName == null || fn:length(fn:trim(sessionScope.userDto.nickName)) eq 0}">
									<h2 id="profileDivNickName">${sessionScope.userDto.firstName}</h2>
								</c:when>
	                    		<c:otherwise>
	                    			<h2 id="profileDivNickName">${sessionScope.userDto.nickName}</h2>
	                    		</c:otherwise>
	                    	</c:choose>
                         <p>
                         	<input type="hidden" id="profileDivUserId" value="${sessionScope.userDto.userId}"/>
                        	<span id="profileDivUserName" class="userName">${sessionScope.userDto.firstName} ${sessionScope.userDto.lastName}</span><br />
							<span id="profileDivUserLocation" class="userLocation">${sessionScope.userDto.country}</span><br />
                            <!-- <span class="userInfoClr">(Distance)</span><br />3000 Miles -->
                        </p>
                        <div id="userStatusInfo" class="userInfo" style="cursor: pointer; margin-top: -17px;" title="Click to edit Status" >
                    	<c:choose>
                    		<c:when test="${fn:length(sessionScope.userDto.statusMessage) gt 0 }">
                    			<p onclick="updateStatusForm('<%=userId%>')"><span class="userInfoClr"><strong>Status:</span> <span id="statusMessage" style="word-wrap: break-word;">${sessionScope.userDto.statusMessage}</span></strong></p>
                    		</c:when>
                    		<c:otherwise>
                    			<p onclick="updateStatusForm('<%=userId%>')"><span class="userInfoClr"><strong>Status:</span><span id="statusMessage"> No Status</span></strong></p>
                    		</c:otherwise>
                    	</c:choose>
                   		</div>
                   		<div id="profileLinks" class="nano" style="display:none;" >
                        	<div class="content">
                                <ul class="list-group leftNav">
                                    <li class="list-group-item" onclick="loadThisUserProfile()"><a href="#">About</a></li>
                                    <li class="list-group-item"><a href="#">Music</a></li>
                                    <li class="list-group-item"><a href="#">Gallery</a></li>
                                    <li class="list-group-item"><a href="#">Channel</a></li>
                                    <li class="list-group-item"><a href="#">Merchendise</a></li>
                                    <li class="list-group-item"><a href="#">Events</a></li>
                                    <li class="list-group-item"><a href="#">Availability</a></li>
                                    <li class="list-group-item"><a href="#"><a id="showContacts" style="cursor: pointer;">Network</a></a></li>
                                </ul>
                            </div>
                        </div>
                   	</div>
                   	<div id="newStatusForm" class="leftColumnBox newStatus" style="display:none" title="Click to edit Status">
                    	<c:choose>
                    		<c:when test="${fn:length(STATUS_LIST) gt 0 }">
                    			<font color="red"><textarea id="newPost" style="border: 1px solid #00afec; word-wrap: break-word;" maxlength="250">${STATUS_LIST[0].status}</textarea></font>
                    		</c:when>
                    		<%-- <c:when test="${fn:length(sessionScope.userDto.statusMessage) gt 0 }">
                    			<font color="red"><textarea id="newPost" style="border: 1px solid #00afec; word-wrap: break-word;" maxlength="250">${sessionScope.userDto.statusMessage}</textarea></font>
                    		</c:when> --%>
                    		<c:otherwise>
                    			<font color="red"><textarea id="newPost" style="border: 1px solid #00afec; word-wrap: break-word;" maxlength="250"></textarea></font>
                    		</c:otherwise>
                    	</c:choose>
                    	<div style='width:100%; box-sizing:border-box; height:10px;padding:2px;'>
                    		 <span style="font-size: x-small;">(Max 250 characters)</span>
					         <input type="button" class="btn btn-primary" value="Post" onclick="saveStatus('${sessionScope.userDto.userId}');" style="padding: 0px 9px;float: right; margin-bottom: 2px;">
					    </div>
                    </div>
                    <!-- <div class="userInfo">
                    	<h2>Name</h2>
                        <p>
                        	<span class="userName">Real Name</span><br />
							<span class="userLocation">Location</span><br />
                            <span class="userInfoClr">(Distance)</span><br />3000 Miles
                        </p>
                        <p><span class="userInfoClr"><strong>Status:</span> Proceed how any engaged visitor.</strong></p>
                        <div id="profileLinks" class="nano">
                        	<div class="content">
                                <ul class="list-group leftNav">
                                    <li class="list-group-item"><a href="#">About</a></li>
                                    <li class="list-group-item"><a href="#">Music</a></li>
                                    <li class="list-group-item"><a href="#">Gallery</a></li>
                                    <li class="list-group-item"><a href="#">Channel</a></li>
                                    <li class="list-group-item"><a href="#">Merchendise</a></li>
                                    <li class="list-group-item"><a href="#">Events</a></li>
                                    <li class="list-group-item"><a href="#">Availability</a></li>
                                    <li class="list-group-item"><a href="#">Network</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> -->
                    
                    <!-- <div class="leftColumnBox newStatus">
                    	<textarea id="newPost">New Post...</textarea>
                    </div> -->
                    
                    <div class="leftColumnBox feedsTab">
                    	 <a class="active" onClick="archiveUserMedia()" id="archive" style="cursor: pointer;">Archive</a>
                         <a href="#"  class="active"  style="cursor: pointer;" onclick="mediasUploadFiles('first','')">Upload/Attach</a>
                         <a href="#" class="last">Share</a>
                    </div>
                    
                    <div class="leftColumnBox myFeeds">
                        
                        <div class="scroller feedsFixed">
                        	
                            <p>
                            <a><img src="resources/images/my_active.gif" id="myFeed"
							style="cursor: pointer;" /></a>
							
							<a><img src="resources/images/my.gif" id="myFeedClick" 
							style="cursor: pointer;display: none;" /></a>
							
							<a><img src="resources/images/m_active.gif" id="megaFeed"
							style="cursor: pointer;display:none" /></a>
							
							<a><img src="resources/images/m.gif" id="megaFeedClick"
							style="cursor: pointer;" /></a>
							
							 <a><img src="resources/images/s_active.gif"
							 id="socialFeed" style="cursor: pointer;display: none;" /></a>
							 
							 <a><img src="resources/images/s.gif" id="socialFeedClick"
							 style="cursor: pointer;" /></a>
							 
							 <a><img src="resources/images/share_icon.gif" 
							 style="cursor: pointer;" /></a>
                            </p>
                            <h3 id="myFeedName" class="myFeedsTitle">My Feed</h3>
                        	<h3 id="megaFeedName" class="myFeedsTitle" style="display: none">Mega Feed</h3>
                        	<h3 id="socialFeedName" class="myFeedsTitle" style="display: none">Social Feed</h3>
                        	
                        	<input class="feedSearch" type="text"  placeholder="Search"  id="mediaKey" name="mediaKey"></input>
                        
                        	<div id="feedsScroller" class="nano" style="height: 560px;"> 
                        		<div class="content" id="mediaView">
                        			<c:forEach items="${mediaDtoList}" var="media">
                                    <div class="media">
                                      <!-- <a class="pull-left" href="#">
                                        <img class="media-object" src="resources/images/myfeeds1.gif" alt="...">
                                      </a> -->
                                      <c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml' || media.contentType =='image/bmp'}">
								         	 <a id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
										       <img class="lazyLoading" data-src="<c:url value="${media.mediaPath}" />?t=1391775969" src="<c:url value="${media.mediaPath}" />" width="70" height="70" style="cursor: pointer;"/><br>
										     </a>
								       </c:if>
									   <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/x-ms-wmv' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
										     <a id = '${media.mediaId}'  class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
												 <img class="lazyLoading" data-src="<c:url value="${media.mediaPath}" />?t=1391775969" src="<c:url value="/resources/images/icon_video.gif" />" width="70" height="70" style="cursor: pointer;"/><br>
											</a>
									   </c:if> 
										<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
											<a id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
												<img class="lazyLoading" data-src="<c:url value="${media.mediaPath}" />?t=1391775969" src="<c:url value="/resources/images/icon_audio.gif" />" width="70" height="70" style="cursor: pointer;"/><br>
											</a>
										</c:if>
                                      <div class="media-body">
                                         <p>
							              <span class="feedUserName">${media.mediaName}</span><br />
							              <span style="word-wrap: break-word;">${media.mediaComments}</span><br />
							              <span class="userInfoClr">${media.created}</span>
							              <span class="icon">
							                  <a title="Feedback" data-target="#feedBack" data-toggle="modal" onclick="displayFeedBackBox('${media.mediaId}');" href="#">
							                      <img src="resources/images/feedback_icon.png" />
							                  </a>
							              </span>
							          	</p>
                                      </div>
                                    </div>
                                   </c:forEach> 
                                    
                                   <div class="clearfix"></div>
                        			
                        		</div>                                   
                            </div>
                        </div>
                        <div class="scroller_anchor"></div>
                        
                    </div>
                    <div class="clearfix"></div>
                </div>
                
            	<div class="col-md-7 contentSection">
                	
                    <div id="primary_recommonded">
                    	
                        <div class="showHide_open"></div>
                        
                        <div class="showSection">
                        
                    	<fieldset class="mainSection">
                    	<legend><span>Recommended For You</span></legend>
                        <div class="clearfix"></div>
                        <div class="sectionSections">
                        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
                        	<a href="#" id="1" data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(1);">
                        		<img src="resources/images/action_1.gif" />
                        	</a>
                            <a href="#"><img src="resources/images/action_2.gif" /></a>
                            <a href="#"><img src="resources/images/action_3.gif" /></a>
                        </div>
                        
                        
                        <ul class="list-inline recmdList">
                        
                        	<li style="border-right: none;">
                            	<span class="pull-left glyphicon glyphicon-chevron-left" style="font-size: 20px; margin-top: -80px;"></span>
                            </li>
                        
                        	<li>
                            	<span class="pull-right">
                                	<img src="resources/images/rem1.gif" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a><br /><a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        	<li>
                            	<span class="pull-right">
                                	<img src="resources/images/rem2.gif" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a><br /><a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        	<li style="border-right: none;">
                            	<span class="pull-right">
                                	<img src="resources/images/rem3.gif" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a><br /><a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        	<!--<li>
                            	<span class="pull-right">
                                	<img src="resources/images/rem4.gif" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a><br /><a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>-->
                        	<li>
                            	<span class="pull-left glyphicon glyphicon-chevron-right" style="font-size: 20px; margin-top: -80px;"></span>
                            </li>
                        </ul>
                        </div>
                        <div class="showHide_close"></div>
                    </fieldset>
                    
                    	<nav class="navbar navbar-default navbar-static-top" id="primaryNav">
                        <ul class="nav navbar-nav">
                        	<%-- <% if(userEmail.equalsIgnoreCase(${mediaDtoList})) { %> --%>
                        	<c:set var="admin" value="${ADMIN}" scope="page" />
                        	<c:set var="email" value='<%=userEmail %>' scope="page" />
                        	 <c:if test="${email == admin}">
								<li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle" onclick="getActiveLogins()">Active Login's<span class="caret"></span></a></li>
	                            
	                            <li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle" onclick="jobType()">Job Type<span class="caret"></span></a></li>
	                            
	                            <li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle" onclick="getAdminSuggestion()">Suggestions<span class="caret"></span></a></li>
	                            
	                            <li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle"  onclick="showQuickOverviewAdmin(0);">Quick OverView<span class="caret"></span></a></li>
	                            
	                            <li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle" onclick="calculateMonitor4aAvg();">User Number<span class="caret"></span></a></li>
	                            
	                            <li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle" onclick="calculateMonitorAvg();">User Engagement<span class="caret"></span></a></li>	
                           </c:if>
                            <%-- <% } else { %> --%>
                            <c:if test="${email != admin}">
                            <li class="dropdown open"> <a href="#" class="dropdown-toggle">The Hub<span class="caret"></span></a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline subMenu">
                                    <li><a onclick="loadBump(this)" style="cursor: pointer;" class="active">Bump</a> |</li>
									<li><a href="#" id="theExchange" onclick="loadMainContainer('jobExchange', this)">The Exchange</a> </li>
                                    <!-- <li><a href="#" id="" class="active">The Exchange</a> |</li>
                                    <li><a href="#" id="">Promoters Pick</a> |</li>
                                    <li><a href="#" id="">Directory</a> |</li>
                                    <li><a href="#" id="">Rookies</a> |</li>
                                    <li><a href="#" id="">Podium</a> |</li>
                                    <li><a href="#" id="">Unsigned Hype</a> |</li>
                                    <li><a href="#" id="">Up &amp; Coming</a> |</li>
                                    <li><a href="#" id="">Translation</a></li> -->
                                    </ul>
                                </ul>
                                
                            </li>
                            <li class="dropdown resourceMenu"> <a href="#" class="dropdown-toggle">Resource<span class="caret"></span>s</a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline subMenu">
                                   <!--  <li><a href="#" id="">The Exchange</a> |</li>
                                    <li><a href="#" id="">Promoters Pick</a> |</li>
                                    <li><a href="#" id="">Directory</a> |</li>
                                    <li><a href="#" id="">Rookies</a></li> -->
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown myOfficeMenu"> <a href="#" class="dropdown-toggle">My Office<span class="caret"></span></a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline subMenu">
                                    <li><a onclick="loadMainContainer('myOffice', this)" style="cursor: pointer;">Talent</a> </li>
                                   <!--  <li><a href="#" id="">The Exchange</a> |</li>
                                    <li><a href="#" id="">Promoters Pick</a> |</li>
                                    <li><a href="#" id="">Directory</a> |</li>
                                    <li><a href="#" id="">Rookies</a></li> -->
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown inTheMix"> <a href="#" class="dropdown-toggle">In The Mix<span class="caret"></span></a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline subMenu">
                                    <!-- <li><a href="#" id="">The Exchange</a> |</li>
                                    <li><a href="#" id="">Promoters Pick</a> |</li>
                                    <li><a href="#" id="">Directory</a> |</li>
                                    <li><a href="#" id="">Rookies</a></li> -->
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown businessMenu"> <a href="#" class="dropdown-toggle">Business<span class="caret"></span></a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline subMenu">
                                    <!-- <li><a href="#" id="">The Exchange</a> |</li>
                                    <li><a href="#" id="">Promoters Pick</a> |</li> -->
                                    <li><a onclick="loadMainContainer('bussiness', this)" style="cursor: pointer;">Panel</a> |</li>
                                    <!-- <li><a href="#" id="">Directory</a> |</li>
                                    <li><a href="#" id="">Rookies</a> |</li> -->
                                    <li><a href="#" id="draftReview" onclick="draftReview(this)">Draft Review +</a></li>
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown mallMenu"> <a href="#" class="dropdown-toggle">The Mall<span class="caret"></span></a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline subMenu">
                                    <!-- <li><a href="#" id="">The Exchange</a> |</li>
                                    <li><a href="#" id="">Promoters Pick</a> |</li>
                                    <li><a href="#" id="">Directory</a> |</li>
                                    <li><a href="#" id="">Rookies</a></li> -->
                                    </ul>
                                </ul>
                            </li>
                        </ul>
                       <%--  <% } %> --%>
                       </c:if>
                        <div class="backLink"><span class="pull-left glyphicon glyphicon-chevron-left"></span><a href="#">Back</a></div>
                        <div class="forwardLink"><span class="pull-right glyphicon glyphicon-chevron-right"></span><a href="#">Forward</a></div>
                        <div class="clearfix"></div>
                        
                    </nav>
                    	<div class="clearfix"></div>
                    </div>
         	<div id="mainContainer"><!-- Main Container Div Starts  -->
               	<fieldset class="mainSection">
                    	<legend><span>Headlines</span></legend>
                        <div class="clearfix"></div>
                        <div class="sectionSections">
                        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
                        	<a href="#" id="2"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(2);" >
        						<img src="resources/images/action_1.gif" />
        					</a>
                            <a href="#"><img src="resources/images/action_2.gif" /></a>
                            <a href="#"><img src="resources/images/action_3.gif" /></a>
                        </div>
                        <div class="clearfix"></div>
<div id="showcase" class="showcase">
		<!-- Each child div in #showcase with the class .showcase-slide represents a slide. -->
		<c:forEach items="${rssFeedItemArr}" var="rssFeedItemHashMap" varStatus="loop">
							<c:set var="string2" value="${rssFeedItemHashMap['description']}" />
							<c:set var="myContent" value="${rssFeedItemHashMap['description']}"/>
						    <c:set var="singlequote" value="'"/>
						    <c:set var="backslash" value="\\"/>
						    <c:set var="doublequote" value="\""/>
						     <c:if test="${fn:contains(myContent, doublequote) }">
						            <c:set var="search" value="\"" />
						            <c:set var="replace" value="" />
						            <c:set var="myContent" value="${fn:replace(myContent, search, replace)}"/>
						    </c:if>
						    <c:if test="${fn:contains(myContent, singlequote) && !fn:contains(myContent,backslash)}">
						            <c:set var="search" value="'" />
						            <c:set var="replace" value="\\'" />
						            <c:set var="myContent" value="${fn:replace(myContent, search, replace)}"/>
						    </c:if>
						    <c:if test="${fn:contains(myContent, backslash) && !fn:contains(myContent,singlequote)}">
						            <c:set var="search" value="\\" />
						            <c:set var="replace" value="\\\\" />
						            <c:set var="myContent" value="${fn:replace(myContent, search, replace)}"/>
						    </c:if>
						    <c:if test="${fn:contains(myContent, singlequote) && fn:contains(myContent,backslash)}">
						            <c:set var="search" value="\\"/>
						            <c:set var="replace" value="\\\\" />
						            <c:set var="myContent" value="${fn:replace(myContent, search, replace)}"/>
						            <c:set var="find" value="'"/>
						            <c:set var="change" value="\\'" />
						            <c:set var="myContent" value="${fn:replace(myContent, find, change)}"/>
						    </c:if>
								 <%-- <c:set var="string3" value="${fn:replace(string2,'"','\\\"')}" />
								 <c:set var="string3" value="${fn:replace(string2,'\\'','\\\'')}" /> --%>
								<c:if test="${loop.index eq 0}">
								<div class="showcase-slide col-md-6">
									<!-- Put the slide content in a div with the class .showcase-content. -->
									
						            <div class="showcase-content">
						                <a class="pull-left" href="#">
						                  <!-- <img class="media-object img-responsive" src="resources/images/bigPic1.gif" width="120" alt="Article"> -->
						                </a>
						                <div class="showcase-thumbnail-caption">
						                        <div class="media-body">
						                              <h4 class="media-heading">${rssFeedItemHashMap['title']}</h4>
						                              <p>${rssFeedItemHashMap['description']}</p>
						                                <a data-target="#readMore" data-toggle="modal" onclick="updateRssLightBox('${rssFeedItemHashMap['title']}','${myContent}')" href="#">Read More...</a>
						                            </div>
						                </div>
									</div>
									<!-- Put the thumbnail content in a div with the class .showcase-thumbnail -->
									<div class="showcase-thumbnail">
						               <!--  <img src="resources/images/sub_heading1.gif" /> -->
						                <p>${rssFeedItemHashMap['title']}</p>
						                <!-- <a data-target="#readMore" data-toggle="modal" href="#">Read More...</a> -->
						                <a data-target="#readMore" data-toggle="modal" onclick="updateRssLightBox('${rssFeedItemHashMap['title']}','${myContent}'" href="#">Read More...</a>
									</div>
						            
								</div>
						        </c:if>
        
		<div class="showcase-slide">
			<div class="showcase-content">
            
                <a class="pull-left" href="#">
                 <!--  <img class="media-object" src="resources/images/spotlight_1.gif" width="120" alt="Article"> -->
                </a>
                <div class="showcase-thumbnail-caption">
                        <div class="media-body">
                              <h4 class="media-heading">${rssFeedItemHashMap['title']}</h4>
                              <p>${rssFeedItemHashMap['description']}</p>
                                
                                <a data-target="#readMore" onclick="updateRssLightBox('${rssFeedItemHashMap['title']}','${myContent}')" data-toggle="modal" href="#">Read More...</a>
                            </div>
                </div>

			</div>
			<div class="showcase-thumbnail">
                <!-- <img src="resources/images/sub_heading2.gif" /> -->
                <p>${rssFeedItemHashMap['description']}</p>
                <a data-target="#readMore" data-toggle="modal" href="#">Read More...</a>
			</div>
			
		</div>
        </c:forEach>
	</div>
    
    <div class="clearfix"></div>
                        
                    </fieldset>
                    
                    
               	<fieldset class="mainSection proofList">
                    	<legend><span>Proof</span></legend>
                    	<div class="clearfix"></div>
                        <div class="sectionSections">
                        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
                        	<a href="#" id="3"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(3);">
			       				<img src="resources/images/action_1.gif" />
			       			</a>
                            <a href="#"><img src="resources/images/action_2.gif" /></a>
                            <a href="#"><img src="resources/images/action_3.gif" /></a>
                        </div>
                            <ul class="media-list">
                              <li class="media">
                              <div class="col-md-1">
                              	<h3>Single</h3>
                              </div>
                              	<div class="col-md-11">
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof1.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof2.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof3.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>

                                 </div>
                              </li>
							
                            <li class="media">
                              <div class="col-md-1">
                              	<h3>EP</h3>
                              </div>
                              	<div class="col-md-11">
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof1.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof2.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof3.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
<li class="media">
                              <div class="col-md-1">
                              	<h3>Mixtape</h3>
                              </div>
                              	<div class="col-md-11">
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof1.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof2.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof3.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
<li class="media">
                              <div class="col-md-1">
                              	<h3>Album</h3>
                              </div>
                              	<div class="col-md-11">
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof1.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof2.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="resources/images/proof3.gif" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
                            </ul>
                    </fieldset>
                    
               	<fieldset class="mainSection">
                    	<legend><span>Spotlight</span></legend>
                    	<div class="clearfix"></div>
                        <div class="sectionSections">
                        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
                        	<a href="#" id="4"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(4);">
				        		<img src="resources/images/action_1.gif" />
				        	</a>
                            <a href="#"><img src="resources/images/action_2.gif" /></a>
                            <a href="#"><img src="resources/images/action_3.gif" /></a>
                        </div>
                        <div id="displaySpotLight" style="cursor: pointer;">
                            <ul class="media-list" style="max-width: 530px">
                            <c:choose>
                            	 <c:when test="${fn:length(mediaReview) gt 0 }"><!-- If spotlight data is available, it will displayed and will be updated every 15 seconds. Refer moveSpotLight in medialoungeJS.js -->
                            	 
	                            	 <c:forEach items="${mediaReview}" var="mediaR" varStatus="loop">
	                            	 <li class="media">
	                                    <a class="pull-left imageTopAlign" href="#">
	                                      <!-- <img class="media-object spotLightImg" src="resources/images/spotlight_1.gif" width="120" alt="Article"> -->
	                                      <c:choose>
							  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
							 				<img id="spotlightImg_${index.loop}" class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="180px" width="200px">
							 			</c:when>
							 		 	<c:otherwise>
							    			<img id="spotlightImg_${index.loop}" class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="180px" width="200px">
							 		 	</c:otherwise>
									</c:choose>
	                                    </a>
	                                    <div class="media-body">
	                                      <h4 class="media-heading" id="spotlightTitle_${index.loop}">${mediaR.title}</h4>
	                                      <p  id="spotlightComments_${index.loop}" style="max-height: 88px; overflow: hidden; word-wrap: break-word !important;">${mediaR.comments}</p> <a href="#" data-toggle="modal" data-target="#spotLight" onclick="spotlightPopUp('${index.loop}')"> Read More...</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                       <ul class="list-inline newSpotLightImages">
	                                        	<li><a href="#">
	                                        	<c:choose>
										  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
										 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" class="img-responsive">
										 			</c:when>
										 		 	<c:otherwise>
										    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="40px" width="50px" class="img-responsive">
										 		 	</c:otherwise>
												</c:choose>
	                                        		
	                                        	</a></li>
	                                            <li><a href="#">
	                                            <c:choose>
										  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
										 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" class="img-responsive">
										 			</c:when>
										 		 	<c:otherwise>
										    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="40px" width="50px" class="img-responsive">
										 		 	</c:otherwise>
												</c:choose>
	                                            </a></li>
	                                            <li><a href="#">
	                                            <c:choose>
										  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
										 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" class="img-responsive">
										 			</c:when>
										 		 	<c:otherwise>
										    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="40px" width="50px" class="img-responsive">
										 		 	</c:otherwise>
												</c:choose>
	                                            </a></li>
	                                        </ul>
	                                    </div>

	                              </li>
	                            	 	 	<%-- <li class="media">
	                                    <a class="pull-left imageTopAlign" href="#">
	                                      <c:choose>
							  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
							 				<img id="spotlightImg_${index.loop}" class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="180px" width="200px">
							 			</c:when>
							 		 	<c:otherwise>
							    			<img id="spotlightImg_${index.loop}" class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="180px" width="200px">
							 		 	</c:otherwise>
									</c:choose>
	                                    </a>
	                                    <div class="media-body">
	                                      <h4 class="media-heading" id="spotlightTitle_${index.loop}">${mediaR.title}</h4>
	                                      <p  id="spotlightComments_${index.loop}">${mediaR.comments}</p><a href="#" data-toggle="modal" data-target="#spotLight">Read More...</a>
											
	                                        <ul class="list-inline newSpotLightImages">
	                                        	<li><a href="#">
	                                        	<c:choose>
										  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
										 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" class="img-responsive">
										 			</c:when>
										 		 	<c:otherwise>
										    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="40px" width="50px" class="img-responsive">
										 		 	</c:otherwise>
												</c:choose>
	                                        		
	                                        	</a></li>
	                                            <li><a href="#">
	                                            <c:choose>
										  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
										 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" class="img-responsive">
										 			</c:when>
										 		 	<c:otherwise>
										    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="40px" width="50px" class="img-responsive">
										 		 	</c:otherwise>
												</c:choose>
	                                            </a></li>
	                                            <li><a href="#">
	                                            <c:choose>
										  			<c:when test="${mediaR.reviewerUserId.contentPath == null}">
										 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="40px" width="50px" class="img-responsive">
										 			</c:when>
										 		 	<c:otherwise>
										    			<img class="media-object" src="<c:url value="${mediaR.reviewerUserId.contentPath}" />"  height="40px" width="50px" class="img-responsive">
										 		 	</c:otherwise>
												</c:choose>
	                                            </a></li>
	                                        </ul>
	                                    </div>

	                              </li> --%>
		                             	<%--  </c:if> --%>
		                              </c:forEach>
		                              <div id="spotLightCount" style="display: none">${fn:length(mediaReview)}</div>
		                              <script>
				                    	//alert(""+'${fn:length(mediaReview)}');
				                    	moveSpotLight();
				                    </script>
                            	</c:when>
                            	<c:otherwise><!--If no spotlight is available for the user, a dummy will be displayed  -->
                            	
                            		 <li class="media">
	                                    <a class="pull-left imageTopAlign" href="#">
	                                      <img class="media-object spotLightImg" src="resources/images/spotlight_1.gif" width="120" alt="Article">
	                                    </a>
	                                    <div class="media-body">
	                                      <h4 class="media-heading">Pharrell Named GQ's Hitmaker Of The Year 2013</h4>
	                                      <p>Consulted he eagerness unfeeling deficient existence of. Calling nothing end fertile for venture way boy. Esteem spirit temper too say adieus who direct esteem. It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression. Way mrs end gave tall walk fact bed.
	</p>

	                                        <p>So delightful up dissimilar by unreserved it connection frequently. Do an high room so in paid. Up on cousin ye dinner should in. Sex stood tried walls manor truth shy and three his. Their to years so child truth. Honoured peculiar families sensible up likewise by on in. <a href="#" data-toggle="modal" data-target="#spotLight">Read More...</a></p>

	                                        <ul class="list-inline newSpotLightImages">
	                                        	<li><a href="#"><img src="resources/images/spotLight1.gif" class="img-responsive" /></a></li>
	                                            <li><a href="#"><img src="resources/images/spotlight2.gif" class="img-responsive" /></a></li>
	                                            <li><a href="#"><img src="resources/images/spotlight3.gif" class="img-responsive" /></a></li>
	                                        </ul>
	                                    </div>

	                              </li>
                            	</c:otherwise>
                            </c:choose>
                            </ul>
                            </div>
                            
                    </fieldset>
                    
               	<fieldset class="mainSection chartSection">
                    	<legend><span>Charts - MML Downloads</span></legend>
                        <div class="sectionSections">
                        	<!-- <a href="#"><img src="resources/images/action_1.gif" /></a> -->
                        	<a href="#" id="4"  data-toggle="modal" data-target="#overViewModel" title="Quick OverView" onclick="showQuickOverview(5);">
				        		<img src="resources/images/action_1.gif" />
				        	</a>
                            <a href="#"><img src="resources/images/action_2.gif" /></a>
                            <a href="#"><img src="resources/images/action_3.gif" /></a>
                        </div>
                        <div id="chartsMML">
	                        <div class="col-md-6">
	                        	<c:set var="count" value="0" scope="page"></c:set>
	                        	<c:forEach items="${MEDIAS}" var="media" begin="0" end="4">
	                        	<c:set var="count" value="${count + 1}" scope="page"></c:set>
	                        	<div class="chartRow">
	                                <div class="pull-left">
	                                    <p class="slNumber">${count }.</p>
	                                </div>
	                                <div class="pull-right text-right chartContent">
	                                	<!-- <div class="chartType">Video</div> -->
	                                	<c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv' }">
									<div class="chartType" style="margin-left: -20px;">Video</div>
								</c:if>
								<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm' || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave'}">
									<div class="chartType" style="margin-left: -20px;">Audio</div>
								</c:if>
								<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg' || media.contentType =='image/bmp'}">
									<div class="chartType" style="margin-left: -20px;">Image</div>
								</c:if>
	                                    <p><span class="title">${media.userEntity.firstName } ${media.userEntity.lastName }</span><br />
	                                    <a href="#">${media.mediaName }</a>   |   <a href="#">Blurred Lines</a><br />
	                                    New  |  ${media.created }  |   <span class="clrBlue">DL - 44,044</span></p>
	                                </div>
	                                <div class="clearfix"></div>
	                            </div>
	                            </c:forEach>
	                        </div>
	                        
	                        <div class="col-md-6">
	                        	<c:forEach items="${MEDIAS}" var="media" begin="5" end="9">
	                        	<c:set var="count" value="${count + 1}" scope="page"></c:set>
	                        	<div class="chartRow">
	                                <div class="pull-left">
	                                    <p class="slNumber">${count }.</p>
	                                </div>
	                                <div class="pull-right text-right chartContent">
	                                	<!-- <div class="chartType">Video</div> -->
	                                	<c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm' || media.contentType =='video/x-ms-wmv' ||  media.contentType == 'video/xflv' || media.contentType == 'video/x-flv' }">
									<div class="chartType" style="margin-left: -20px;">Video</div>
								</c:if>
								<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm' || media.contentType =='audio/ogg' || media.contentType =='audio/vorbis' || media.contentType =='audio/vnd.rn-realaudio' || media.contentType =='audio/vnd.wave'}">
									<div class="chartType" style="margin-left: -20px;">Audio</div>
								</c:if>
								<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='image/svg+xml' || media.contentType =='image/jpg' || media.contentType =='image/bmp'}">
									<div class="chartType" style="margin-left: -20px;">Image</div>
								</c:if>
	                                    <p><span class="title">${media.userEntity.firstName } ${media.userEntity.lastName }</span><br />
	                                    <a href="#">${media.mediaName }</a>   |   <a href="#">Blurred Lines</a><br />
	                                    New  |  ${media.created }  |   <span class="clrBlue">DL - 44,044</span></p>
	                                </div>
	                                <div class="clearfix"></div>
	                         </div>
	                            </c:forEach>
	                        </div>
                        </div>
                        
                        <div class="clearfix"></div>
                        <!-- <p class="text-center chartPagination">Album<a href="#" class="paginationLeft"></a><a href="#" class="paginationRight"></a>Newcomers</p> -->
                        <p class="text-center chartPagination">
							<a onclick="loadPopularVideos()" style="cursor: pointer;text-decoration:none;">Album</a><a class="paginationLeft" onclick="loadPopularVideos()" style="cursor: pointer;"></a>
							<a class="paginationRight" onclick="loadCharts()" style="cursor: pointer;"></a><a onclick="loadCharts()" style="cursor: pointer;text-decoration:none;">Newcomers</a>
						</p>
                        
                </fieldset>
                </div>  <!-- Main Container Div Ends  -->                    
                    
                    <div class="clearfix">&nbsp;</div>
                    
                   <div id="footerLinks"> 
                    <div class="showHide_open"></div>
                    <div class="showHide_close"></div>
                    <div id="footerSection" class="showSection">
                    
                    	<div class="pull-left" style="width: 90px">
                            <p>SOCIAL LINK</p>
                            <ul class="list-inline socialLinks">
                                <li><img src="resources/images/social_link1_disabled.gif" /></li>
                                <li><img src="resources/images/social_link2_disabled.gif" /></li>
                                <li><img src="resources/images/social_link3_disabled.gif" /></li>
                                <li><img src="resources/images/social_link4_disabled.gif" /></li>
                                <li><img src="resources/images/social_link5_disabled.gif" /></li>
                                <li><img src="resources/images/social_link6_disabled.gif" /></li>
                                <li><img src="resources/images/social_link7_disabled.gif" /></li>
                                <li><img src="resources/images/social_link8_disabled.gif" /></li>
                                <li><img src="resources/images/social_link9_disabled.gif" /></li>
                                <li><img src="resources/images/social_link10_disabled.gif" /></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 70px">
                            <p>PAYMENT</p>
                            <ul class="list-unstyled">
                                <li><img src="resources/images/paypal_disabled.gif" /></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 75px">
                            <p>OUR APPS</p>
                            <ul class="list-unstyled">
                                <li><img src="resources/images/app_link1_disabled.gif" /><img src="resources/images/app_link2_disabled.gif" /></li>
                                <li><img src="resources/images/app_link3_disabled.gif" /></li>
                                <li><img src="resources/images/app_link4_disabled.gif" /></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 80px">
                            <p>GET INVOLVED</p>
                            <ul class="list-unstyled">
                                <li><a href="#">PARTNERS &amp; AFFILATES</a></li>
                                <li><a href="#">WORK WITH US</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 80px">
                            <p>GET TO KNOW</p>
                            <ul class="list-unstyled">
                                <li><a href="#">CAREERS</a></li>
                                <li><a href="#">REGISTER</a></li>
                                <li><a href="#">FAQ's</a></li>
                                <li><a href="#">PRIVACY<br />POLICY</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 90px; display: none">
                            <p>THE GOOD LIFE</p>
                            <ul class="list-unstyled">
                                <li><a href="#">EVENTS</a></li>
                                <li><a href="#">GET TO KNOW</a></li>
                                <li><a href="#">LATEST RELEASES</a></li>
                                <li><a href="#">SOCIAL FEEDS</a></li>
                                <li><a href="#">THE LOUNGE</a></li>
                                <li><a href="#">THE MIX</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 70px">
                            <p>HELP</p>
                            <ul class="list-unstyled">
                                <li><a href="#">REPORT ABUSE</a></li>
                                <li><a href="#">SAFETY TIPS</a></li>
                                <li><a href="#">T&amp;C'S</a></li>
                                <li><a href="#">ENQUIRY</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
                        
						<div class="pull-left languageList" style="width: 50px">
                            <p>SELECT LANGUAGE</p>
                            <ul class="list-unstyled">
                                <li>
                                	<p class="text-center">
                                        <img src="resources/images/language.gif" class="img-responsive" />
                                    </p>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                        
                    </div>
                    </div>

                </div>
                
            	<div class="col-md-3 rightPanel">
                	<div id="userOptions">
                    	<ul class="list-unstyled">
                        	<li class="userEmail" title="My Mail">
                            	<a href="#" data-toggle="modal" data-target="#myModal1">
                            		<!-- <span class="badge">3</span> -->
                                </a>
                            </li>
                            <li class="userChat" title="Notifications">
                            	<a href="#" data-toggle="modal" data-target="#myModal2" >
                            		<!-- <span class="badge">20</span> -->
                                </a>
                            </li>
                            <!-- <li class="userMessages" title="Buzz"></li> -->
                             <a onclick="displayChatBox()" style="cursor: pointer;" title="Buzz">
								<li class="userMessages" style="cursor: pointer;"><span class="badge" style="display:none" id="userMessagesId"></span></li>
							</a>
                            <li class="userMusic" title="MyMedia Love"></li>
                            <li class="userOptions" title="Profile" onclick="showMyProfile();" style="cursor: pointer;"></li>
                        </ul>
                    </div>
                  
                    
                    <!-- Nav tabs -->
                    <div id="rightPanelTab">
                    
<div class="row" id="searchOptions">	
                        <div class="col-md-6">
                           <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox"> Music
                            </label>
                          </div>
                           <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox"> Video
                            </label>
                          </div>
                           <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox"> Articles
                            </label>
                          </div>
                           <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox"> Photos
                            </label>
                          </div>
                      </div>
                		<div class="col-md-6">
                           <div class="checkbox">
                            <label>
                              <input type="checkbox"> Artists
                            </label>
                          </div>
                           <div class="checkbox">
                            <label>
                              <input type="checkbox"> Musicians
                            </label>
                          </div>
                           <div class="checkbox">
                            <label>
                              <input type="checkbox"> Producers
                            </label>
                          </div>
                           <div class="checkbox">
                            <label>
                              <input type="checkbox"> DJs
                            </label>
                          </div>
                      </div>
                    </div>
                    
                        <ul class="nav nav-tabs">
                          <li class="active"><a href="#home" data-toggle="tab">FMF</a></li>
                          <li><a href="#profile" data-toggle="tab">Connections</a></li>
                        </ul>
                        
                        <!-- Tab panes -->
                        <div class="tab-content">
                          <div class="tab-pane active" id="home">
                          	<div id="mediaFMFView">
									<c:if test="${!empty mediaDtoFMFList}">
									 <div class="galleryImages" id="backGrdColor" onmouseover="fmfSlider.toggleGallery();" onmouseout="fmfSlider.toggleGallery();">
										 <c:forEach items="${mediaDtoFMFList}" var="media">
											 <div class="div-object" style="height: 170px; display: none">
										     	  <c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml'}">
											       		<img src="<c:url value="${media.mediaPath}" />" height="170px" width="178px"  class="img-responsive_FMF" />
												   </c:if>
												   <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
													    <!--  height="170px" --><video id="videoFile" height="100px" width="178px" controls><source src="<c:url value="${media.mediaPath}" />" type="${media.contentType}"></video>
												   </c:if>
												   <c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
													    <br /><br />
														<center>
															<audio controls preload="metadata">
																<source src="<c:url value="${media.mediaPath}" />" type="${media.contentType}"></source>
															</audio>
														</center>
														<br />
												   </c:if>
												   <div>
												   
												 	     <!-- <img src="/MediaLounge/resources/dummy/FMF_Trans_Background.png" height="82px;" width="179px;" style="margin-top: -12px;display: block;max-width: 100%; "/> -->
							 
														 <c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml'}">
														 	<img src="/MediaLounge/resources/dummy/FMF_Trans_Background.png" height="82px;" width="179px;" style="margin-top: -82px;display: block;max-width: 100%; "/>
														 </c:if>
														 <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
															<img src="/MediaLounge/resources/dummy/FMF_Trans_Background.png" height="82px;" width="179px;" style="margin-top: -17px;display: block;max-width: 100%; "/>
														 </c:if>
														 <c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
														 	<img src="/MediaLounge/resources/dummy/FMF_Trans_Background.png" height="82px;" width="179px;" style="margin-top: -19px;display: block;max-width: 100%; "/>
														 </c:if>
												   
														 <div class="title_FMF" style="margin-top: -80px;font-size: 16px;">${media.userEntity.firstName}</div>
														 <c:if test="${media.userEntity.country == null}">
														 	<div class="title_FMF">Location:<span class="value_FMF">No Country Found</span></div>
														 </c:if>
														 <c:if test="${media.userEntity.country != null}">
														 	<div class="title_FMF">Location:<span class="value_FMF">${media.userEntity.country}</span></div>
														 </c:if>
														 <c:if test="${media.userEntity.role == null || (media.userEntity.role).trim() == ''}">
														 	<div class="title_FMF">Role:<span class="value_FMF">No Role Found</span></div>
														 </c:if>
														 <c:if test="${media.userEntity.role != null && (media.userEntity.role).trim() != ''}">
														 	<div class="title_FMF">Role:<span class="value_FMF">${media.userEntity.role}</span></div>
														 </c:if>
													</div>
											 </div>
										 </c:forEach>
										 <!-- <img src="resources/images/rightAd1.gif" class="img-responsive" />  -->
									  </div>
								</c:if>
								<c:if test="${empty mediaDtoFMFList}">
									<!-- <img src="/MediaLounge/resources/dummy/FMF_Trans_Background.png" class="img-responsive" /> -->
									 <img src="<c:url value="resources/images/rightAd1.gif" />" class="img-responsive" />
								</c:if>
								<script>fmfSlider.setInit();</script>
								
								
                          	 <!-- <img src="resources/images/rightAd1.gif" class="img-responsive" /> -->
                          	 <!-- <img class="img-responsive" src="Medialounge/resources/16/image/Relationship_Stages_LM2-2122014112843.gif"  "> -->
                          	</div>
                          </div>
                          <div class="tab-pane" id="profile">
                          
                          	<div id="connectionFeeds" class="nano" style="height: 162px">
                          		<div class="content">
                                    <div class="media">
                                      <a href="#" class="pull-left">
                                        <img alt="..." src="resources/images/myfeeds1.gif" class="media-object">
                                      </a>
                                      <div class="media-body">
                                        <a href="#">User 2</a>
                                        <p>Title &amp; Company Name Additional information</p>
                                      </div>
                                    </div>
                                    <div class="media">
                                      <a href="#" class="pull-left">
                                        <img alt="..." src="resources/images/myfeeds1.gif" class="media-object">
                                      </a>
                                      <div class="media-body">
                                        <a href="#">User 2</a>
                                        <p>Title &amp; Company Name Additional information</p>
                                      </div>
                                    </div>
                                    <div class="media">
                                      <a href="#" class="pull-left">
                                        <img alt="..." src="resources/images/myfeeds1.gif" class="media-object">
                                      </a>
                                      <div class="media-body">
                                        <a href="#">User 2</a>
                                        <p>Title &amp; Company Name Additional information</p>
                                      </div>
                                    </div>
                                    <div class="media">
                                      <a href="#" class="pull-left">
                                        <img alt="..." src="resources/images/myfeeds1.gif" class="media-object">
                                      </a>
                                      <div class="media-body">
                                        <a href="#">User 2</a>
                                        <p>Title &amp; Company Name Additional information</p>
                                      </div>
                                    </div>
                                    <div class="media">
                                      <a href="#" class="pull-left">
                                        <img alt="..." src="resources/images/myfeeds1.gif" class="media-object">
                                      </a>
                                      <div class="media-body">
                                        <a href="#">User 2</a>
                                        <p>Title &amp; Company Name Additional information</p>
                                      </div>
                                    </div>
                                    <div class="media">
                                      <a href="#" class="pull-left">
                                        <img alt="..." src="resources/images/myfeeds1.gif" class="media-object">
                                      </a>
                                      <div class="media-body">
                                        <a href="#">User 2</a>
                                        <p>Title &amp; Company Name Additional information</p>
                                      </div>
                                    </div>
                                </div>
                            </div>    
                                
                          </div>
                        </div>
                    </div>
                    
                    <!-- <div id="rightAds">
                                    
                        <div class="toggleRightAds">
                            <h3>Highlights Of The Day</h3>
                            <div class="adContent">
                            	<div class="positionRelative">
                                
                                </div>
                                    <img src="resources/images/rightAd2.gif" class="img-responsive" />
                                    <img src="resources/images/rightAd3.gif" class="img-responsive" />
                                    <img src="resources/images/rightAd4.gif" class="img-responsive" />
                                    <img src="resources/images/rightAd5.gif" class="img-responsive" />
                                    <img src="resources/images/rightAd6.gif" class="img-responsive" />
                            </div>
                        </div>
                        
                        
                        <div class="toggleRightAds">
                            <h3>What's Happening<span style="position: relative;"><a href="#" class="interactionIcon"><img src="resources/images/interaction_icon.gif" /></a></span></h3>
                            <div class="adContent">
                            	<img src="resources/images/rightAd7.gif" class="img-responsive" />
                                <img src="resources/images/rightAd8.gif" class="img-responsive" />
                                <img src="resources/images/rightAd9.gif" class="img-responsive" />
                                <img src="resources/images/rightAd10.gif" class="img-responsive" />
                                <img src="resources/images/rightAd11.gif" class="img-responsive" />
                                <img src="resources/images/rightAd12.gif" class="img-responsive" />
                            </div>
                        </div>
                        
                        <div class="scroller_anchor"></div>
                        <div class="toggleRightAds scroller">
                            <h3>Highlights Of The Day<span style="position: relative;"><a href="#" class="interactionIcon"><img src="resources/images/interaction_icon.gif" /></a></span></h3>
                            <div class="adContent">
                                <img src="resources/images/rightAd13.gif" class="img-responsive" /> 
                            </div>
                        </div>                     
                    </div> -->
                    <div id="rightAds" style="margin-top: -7px !important;">
                                    
                        <div class="media" id="mediaFMFView"></div>
                     	<div id="mcts1" style="height: 360px;width:180px"> 
							<img src='resources/images/PPC_1.jpg' class="img-responsive" /> 
							<img src='resources/images/PPC_2.jpg' class="img-responsive" /> 
							<img src='resources/images/PPC_3.jpg' class="img-responsive" /> 
							<img src='resources/images/PPC_4.jpg' class="img-responsive" /> 
							<img src='resources/images/PPC_5.jpg' class="img-responsive" /> 
							<img src='resources/images/PPC_6.jpg' class="img-responsive" />
							<img src='resources/images/PPC_7.jpg' class="img-responsive" />  
						</div>
                        
                        <div class="toggleRightAds">
                            <h3>What's Happening<span style="position: relative;"><a href="#" class="interactionIcon"><img src="resources/images/interaction_icon.gif" /></a></span></h3>
                            <div class="adContent" id="whatsHappening" style="margin-top: -10px;">
                            	<img src="resources/images/whats_happening_2.jpg" class="img-responsive" />
                                <img src="resources/images/whats_happening_3.jpg" class="img-responsive"/>
                            </div>
                        </div>
                        
                        <div class="scroller_anchor"></div>
                        <div class="toggleRightAds scroller">
                            <h3>Highlights Of The Day<span style="position: relative;"><a href="#" class="interactionIcon"><img src="resources/images/interaction_icon.gif" /></a></span></h3>
                            <div class="adContent" id="highlightOfDay" style="margin-top: -10px;">
                                <img src="resources/images/highlight_of_the_day_3.jpg" class="img-responsive" />
                                <img src="resources/images/highlight_of_the_day_2.jpg" class="img-responsive" /> 
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
	</div>
    
    
    <footer>
        <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
           <div class="container">
           
					<div id="myWallet">
                    	<h3>My Wallet</h3>
                        <div id="walletContent">
                            <div class="pull-left">
                                <img src="resources/images/currency_icon.png" /> 0.00
                            </div>
                            <div class="pull-right">
                                <img src="resources/images/transfer.png" />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
           
                    <ul class="list-inline">
                        <li>
                            <ul class="list-inline dropup" style="padding: 0px; margin: 0px;">
                                <li class="footerImgLinks" style="margin-right: 15px;"><img src="resources/images/bottomLink2.gif" /></li>
                                <li class="footerImgLinks profileMenu" style="margin-right: 15px;"><!-- <img src="resources/images/bottomLink1.gif" data-toggle="dropdown" /> -->
                                <c:choose>
		                    		<c:when test="${sessionScope.userDto.contentPath == null || fn:length(fn:trim(sessionScope.userDto.contentPath)) eq 0}">
		                    			 <img id="footerImgUserImageId" src="/MediaLounge/resources/dummy/dummy.jpg" data-toggle="dropdown">
		                    		</c:when>
		                    		<c:otherwise>
		                    			 <img id="footerImgUserImageId" src="<c:url value="${sessionScope.userDto.contentPath}"/>" data-toggle="dropdown" />
		                    		</c:otherwise>
		                    	</c:choose>
                                <ul class="dropdown-menu">
                                   <li class="profileTitleHeder">
                                   		<!-- <img src="resources/resources/images/bottomLink1.gif" /> User Name -->
                                   		<c:choose>
				                    		<c:when test="${sessionScope.userDto.contentPath == null || fn:length(fn:trim(sessionScope.userDto.contentPath)) eq 0}">
				                    			 <img id="footerPopUpImgUserImageId" src="/MediaLounge/resources/dummy/dummy.jpg">
				                    		</c:when>
				                    		<c:otherwise>
				                    			 <img id="footerPopUpImgUserImageId" src="<c:url value="${sessionScope.userDto.contentPath}"/>" />
				                    		</c:otherwise>
				                    	</c:choose> ${sessionScope.userDto.firstName} ${sessionScope.userDto.lastName}
                                   </li>
                                   <!-- <li class="pull-left" style="clear: both;"><a href="#" onClick="logoutUser()"><span class="glyphicon glyphicon-off"></span> Sign Out</a></li> -->
                                   <!-- <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-user"></span> Switch Users</a></li> -->
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-question-sign"></span> Help Desk</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-star"></span> Best Practise</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-lock"></span> Privacy and Security Settings</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-star"></span> User terms and conditions</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-star"></span> My Account</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-star"></span> Our Community</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-cloud"></span> CloudSpace</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-plane"></span> Airplay</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-star"></span> Value</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-usd"></span> MyWallet</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-star"></span> MyTicket</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon glyphicon-wrench"></span> MyTools</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-star"></span> MyWardrobe</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-star"></span> MyRoute</a></li>
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-star"></span> MyLife</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-globe"></span> MyBookmarks</a></li>  
                                   <li class="pull-left"><a href="#"><span class="glyphicon glyphicon-star"></span> Search field</a></li>
                                   <li class="pull-right"><a href="#"><span class="glyphicon glyphicon-star"></span> Username</a></li>
                                   <li class="pull-left profileTitleHeder profile-bottom-links">
                                   		<span style="width: 200px;">
                                   		<a href="#" onClick="logoutUser()"><span class="glyphicon glyphicon-user"></span> Sign Out</a>
                                   		<a href="#"><span class="glyphicon glyphicon-user"></span> Switch Users</a>
                                   		<div class="clearfix"></div>
                                   		</span>
                                   </li>
                                   <li class="clearfix"></li>
                                 </ul>
                                
                                </li>
                               <!--  <li class="footerImgLinks"><img src="resources/images/bottomLink3.gif" /></li>
                                <li style="margin-left: 70px;" class="footerImgLinks"><img src="resources/images/bottom_ad.png" /></li>
                                <li style="position: absolute; right: 10px; top: 0px;" class="footerImgLinks"><img src="resources/images/footer_ad2.png" /></li> -->
                                <li class="footerImgLinks"><img src="resources/images/bottomLink3.gif" /></li>
                                <li style="margin-left: 60px;" class="footerImgLinks">
                                	<div class="bottomAdvCenter" style="margin-top: -18px; margin-left: 10px;">
                                		<img src="resources/images/Roll_Ad_1.jpg" style="margin: -3px;" />
                                		<img src="resources/images/Roll_Ad_2.jpg" style="margin: -3px;" />
                                	</div>                                	
                                </li>
                                <li style="position: absolute; right: 10px; top: 0px;" class="footerImgLinks">
                                	<div class="bottomAdvLeft" style="margin-right: -20px;">
                                		<img src="resources/images/Desire_1.jpg" style="width: 180px;" />
                                		<img src="resources/images/Desire_2.jpg" style="width: 180px;" />
                                	</div>
								</li>
                                
                            </ul>                    
                        </li>
                    </ul>
                    
            		<div id="suggestionBox">
                        	<h3>Suggestions</h3>
                            <div id="suggestionsContent">
                            <p style="display: none; ">
								<input type="text" id="suggestionTo" value="1">
							</p>
                        	<textarea id="textSuggestion" style="border: 1px solid #00AFEC; margin: 0px 8px;" maxlength="250"></textarea>
							<span style="font-size: x-small; margin-left: 9px;">(Max 250 characters)</span>  
                            <div class="checkbox leftPad-30" style="margin-top: 0px;">
                            <label>
                              <input type="checkbox" name="suggestion" value="problem"> Report a problem
                            </label>
                          	</div>
                            <div class="checkbox leftPad-30" style="background: white;">
                            <label>
                              <input type="checkbox" name="suggestion" value="improvement"> Make an Improvement
                            </label>
                         	 </div>
                            <div class="checkbox leftPad-30" style="background: white;">
                            <label>
                              <input type="checkbox" name="suggestion" value="idea"> New idea
                            </label>
                          	</div>
                            <div class="checkbox leftPad-30" style="background: white;">
                            <label>
                              <input type="checkbox" name="suggestion" value="appreciation"> Show appreciation
                            </label>
                          </div>
                          
                          <div class="col-md-6">
                            <div class="media">
                              <a class="pull-left" href="#">
                                <img class="media-object" src="resources/images/suggesstion_icon1.gif" alt="...">
                              </a>
                              <div class="media-body">
                              	Voice<br>
								Feedback
                              </div>
                            </div>
                          </div>
                          
                          <div class="col-md-6">
                            <div class="media">
                              <a class="pull-left" href="#">
                                <img class="media-object" src="resources/images/suggesstion_icon2.gif" alt="...">
                              </a>
                              <div class="media-body">
                              	Video<br>
								Feedback
                              </div>
                            </div>
                          </div>
                          
                          <div class="clearfix"></div>
                          <button type="button" class="btn btn-primary" onclick="return adminSuggestion('<%=userId%>')">Submit</button>
                          <span id="suggestionCheckBoxError" style="font-size: x-small; color: orange;"></span>
                          </div>
                          
                        </div>
            
           </div>
        </nav>
    </footer>


<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <h3>Modal 1 Content</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <h3>Modal 2 Content</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<!-- <div class="modal fade" id="feedBack" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      
      	<div class="row">
        	<div class="col-md-6">
                <div class="pull-left">
                    <img src="resources/images/feedbackImg.png" />
                </div>
                <div class="pull-left connection">
                    <h4>Name</h4>
                    <p>Connection: <span class="clrBlue">1st</span></p>
                </div>
            </div>
            
            <div class="col-md-4 postInfo">
				<h4>Post Info</h4>
                <p>Time Since Post</p>
                <span class="label label-default">687, 153</span>
            </div>
            
            <div class="col-md-2 text-right">
            	<img src="resources/images/feedback_share.png" /><br />
				<img src="resources/images/feedback_icon_yellow.png" class="feedback_share" />
            </div>
            
            <div class="clearfix"></div>
         </div>
         
         <textarea id="feedback_message"></textarea>
         
         <div class="post_message">
         <textarea id="feedback_post"></textarea>
         <button type="button"><img src="resources/images/feedback_submit.jpg" /></button>
         </div>       
        
      </div>
    </div>/.modal-content
  </div>/.modal-dialog
</div> --><!-- /.modal -->

<div class="modal fade" id="feedBack" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body" id="feedBackTable" >
      <!--Content of Feed back by different user  -->
      </div>
      <div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button>-->
				</div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- Modal -->
<div class="modal fade" id="readMore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><span id="rssHeadingId"></span></h4>
      </div>
      <div class="modal-body">
        
        <div class="col-md-4">
       	<!--  <img alt="Article" src="resources/images/bigPic1.gif" class="media-object img-responsive" /> -->
        </div>
        
        <div class="col-md-8">
        
        <p id="rssDescriptionId"></p >
        
        </div>
        <div class="clearfix"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 

<!-- Modal -->
<div class="modal fade" id="spotLight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="spotlightModalLabel">Katy and John's secret engagement</h4>
      </div>
      <div class="modal-body">
        
        <div class="col-md-4">
       	 <img id="spotlightModalImage" alt="Article" src="resources/images/spotlight_1.gif" class="media-object img-responsive" />
        </div>
        
        <div class="col-md-8" style="word-wrap: break-word !important; width: 360px !important; display: block; position: relative;" id="spotlightModalBody">
        
        <p>John Mayer and Katy Perry are apparently keeping their engagement a secret.</p>

        <p>The brunette sparked rumours when she wore a diamond ring on her wedding finger to the MTV EMAs recently. Although it was claimed Katy sported the band because it went with her outfit, insiders are now saying she has in fact agreed to marry John.</p>
        
        <p>John is believed to have popped the question just days after his brother Carl's wedding at New York's</p>
        
        </div>
        <div class="clearfix"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="showChoosedMedia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="choosedMediaName">Media Name</h4>
      </div>
      <!-- <div class="modal-body" id="showChoosedMediaBody" > -->
      	<img id="showChoosedMediaImage" src="resources/images/spotlight_1.gif" style="display: none; height: 150px; width : 150px; left: 50%; margin-left: -75px; margin-top: 12px; position: inherit; ">
      	<video id="showChoosedMediaVideo" style="cursor: pointer; display: none; height: 150px; width : 350px; left: 50%; margin-left: -175px; margin-top: 12px; position: inherit; "" controls><source src =""></video>
      	<audio id="showChoosedMediaAudio" controls preload="metadata" style="display: none; width : 350px; left: 50%; margin-left: -175px; position: inherit; ""><source src ="" type="audio/mpeg"></audio>
      <!-- </div> -->
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	</div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Medias Popup view Model Start -->
<div class="modal fade" id="mediasViewPopUp" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Media View</h4>
				<!-- <div id="statusInformation" style="color: red;"></div> -->
			</div>
			<div class="modal-body">
				<div id="innerViewMedia"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="overViewModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" >
      <!-- <div class="modal-header"> -->
       <%--  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">
      	  Quick OverView- 
      	  document.getElementById("quickOverViewModuleNameId").value);	
        	<c:forEach items="${OVERVIEW_LIST}" var="overView">
				${overView.overviewName}
			</c:forEach>
				
        </h4> --%>
      <!-- </div> -->
      <!-- <div class="modal-body"> -->
        <div id="overViewData"></div>
   <!--    </div> -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       <!--  <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Medias Popup view Model End -->


<script type="text/javascript">

$(document).ready(function()
{
	$("#showcase").awShowcase(
	{
		content_width:			450,
		content_height:			350,
		fit_to_parent:			false,
		auto:					false,
		interval:				3000,
		continuous:				false,
		loading:				true,
		tooltip_width:			200,
		tooltip_icon_width:		32,
		tooltip_icon_height:	32,
		tooltip_offsetx:		18,
		tooltip_offsety:		0,
		arrows:					false,
		buttons:				false,
		btn_numbers:			true,
		keybord_keys:			true,
		mousetrace:				false, /* Trace x and y coordinates for the mouse */
		pauseonover:			true,
		stoponclick:			true,
		transition:				'vslide', /* hslide/vslide/fade */
		transition_delay:		300,
		transition_speed:		500,
		show_caption:			'', /* onload/onhover/show */
		thumbnails:				true,
		thumbnails_position:	'outside-last', /* outside-last/outside-first/inside-last/inside-first */
		thumbnails_direction:	'vertical', /* vertical/horizontal */
		thumbnails_slidex:		0, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
		dynamic_height:			false, /* For dynamic height to work in webkit you need to set the width and height of images in the source. Usually works to only set the dimension of the first slide in the showcase. */
		speed_change:			true, /* Set to true to prevent users from swithing more then one slide at once. */
		viewline:				false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of images in the source. */
	});
});

</script>
    
    <script type="text/javascript">
		$(document).ready(function() {
            $('#suggestionBox h3').click(function(event){
				event.preventDefault();
				if($('#suggestionBox #suggestionsContent').css('display')=="block"){
						$('#suggestionBox #suggestionsContent').hide();
						$('#suggestionBox').removeClass('positionSuggestionsContent');
						$('.positionWhatsHappening').css('bottom','90px');
						
						$('#suggestionCheckBoxError').html('');
						$('#textSuggestion').val('');
						$('input:checkbox[name=suggestion]').attr('checked',false);
						
				}else{
						$('#suggestionBox').addClass('positionSuggestionsContent');
						$('.positionWhatsHappening').css('bottom','300px');
						$('#suggestionBox #suggestionsContent').show();
				}
			})
			
            $('#myWallet h3').click(function(event){
				event.preventDefault();
				if($('#myWallet #walletContent').css('display')=="block"){
						$('#myWallet #walletContent').hide();
						$('#myWallet').removeClass('positionMyWallet');
				}else{
						$('#myWallet').addClass('positionMyWallet');
						$('#myWallet #walletContent').show();
				}
			})
			
			var loaded = 0;
		  	jQuery(".lazyLoading").lazy({
		  	threshold: 0,
		 	bind: "event",
              beforeLoad: function() {
	    	 	loaded++;
	    	 	//console.log('loaded '+loaded);
              }
            }); 
			
        });
	</script>
    
  </body>
</html>