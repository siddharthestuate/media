<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recorded  Evolution - Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="javascript/html5shiv.js"></script>
      <script src="javascript/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    	function adminSuggestion(loginUser) {
   			 var checkBoxes = document.getElementsByName('suggestion');
   			 var suggestiontype = "";
   			 var suggestionMsg = "";
   			 var countType = 0;
   			 var suggestionTo = document.getElementById("suggestionTo").value;
             for (var counter=0; counter < checkBoxes.length; counter++) {
                    if (checkBoxes[counter].type.toUpperCase()=='CHECKBOX' && checkBoxes[counter].checked == true) {
                    	  countType++;
                    	  suggestiontype = checkBoxes[counter].value;
                          suggestionMsg = document.getElementById('textSuggestion').value;
                          if (suggestionMsg.trim() == "") {
						  alert("no suggestion entered");
						  return false;
						  }
             		}
             }
             if (suggestiontype == "" || countType > 1) {
				alert("Please check  one checkbox");
				return false;
			} 
             $.ajax({
     			url : "/MediaLounge/adminSuggestion123",
     			type : 'GET',
     			data: {
     				type: suggestiontype , message: suggestionMsg , loginUser: loginUser , suggestionTo: suggestionTo
     			 },
     			success : function(response) {
     				alert(response);
     				document.getElementById('textSuggestion').value = "";
     			},
     			error : function() {
     				alert("error");
     				
     			}
     		});
		}
    </script>
  </head>
  <body>
    
    <header>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
           <div class="container">
           		<div class="row">
                	<div class="col-lg-12">
                        
                            <div class="pull-left">
                                <a class="navbar-brand" href="#">RECORED EVOLUTION</a>
                            </div>
                            <div class="pull-left mediaPlayer">
                                <div class="pull-left mediaBox">
                                    <img src="<c:url value="/resources/images/musicPlay.png" />" class="visible-lg" />
                                </div>
                                
                                <div class="pull-left mediaLinks">
                                        <!-- Single button -->
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
                                                        	<p class="text-right">Overall 4/5<br /><img src="<c:url value="/resources/images/rating.gif" />" /></p>
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
                                        
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="pull-right cartInfo">
                                    <form class="navbar-form navbar-left" role="search">
                                        <span class="glyphicon glyphicon-cart"></span> 1 - Item(s)&nbsp;&nbsp;&euro;0.00&nbsp;&nbsp;Checkout
                                        <div class="clearfix"></div>
                                      <div class="input-group headerSearch pull-right">
                                        <span class="input-group-addon glyphicon glyphicon-search"></span>
                                        <input type="text" class="form-control" placeholder="Type It, Search It, Find It" />
                                      </div>
                                      <div class="clearfix"></div>
                                      <a href="#" class="linkWhite">Detailed search</a>
                                  </form>
                            </div>
                    
                    
                    </div>
            	</div>
           </div>
        </nav>
    </header>
    
  	<div class="container" id="mainContent">        
        <section>
        	<div class="row">
            	<div class="col-lg-3 leftColumn">
                	<a class="icon-home" href="#"></a>
                    
                    <img src="<c:url value="/resources/images/leftAd1.gif" />" />
                    <div class="userInfo">
                    	<h2>Name</h2>
                        <p>
                        	<span class="userName">Real Name</span><br />
							<span class="userLocation">Location</span><br />
                            <span class="userInfoClr">(Distance)</span><br />
                            3000 Miles
                        </p>
                        <p><span class="userInfoClr"><strong>Status:</strong></span> Proceed how any engaged visitor.</p>
                        <ul class="list-group">
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
                    
                    <div class="leftColumnBox newStatus">
                    	<p>New Status...</p>
                    </div>
                    
                    <div class="leftColumnBox feedsTab">
                    	<a href="#" class="active">Publish</a>
                        <a href="#">Upload/Attach</a>
                        <a href="#">Share</a>
                    </div>
                    
                    <div class="leftColumnBox myFeeds">
                    	<p class="text-right"><img src="<c:url value="/resources/images/mshare.gif" />" /></p>
                        <h3>My Feed</h3>
                        
                        <div class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value="/resources/images/myfeeds1.gif" />" alt="...">
                          </a>
                          <div class="media-body">
                            <p>
                            	<span class="feedUserName">Real Name</span>&nbsp; New Status<br />
                                Subjects to ecstatic children he. Could ye leave up as built match.<br />
                                <span class="userInfoClr">1 Min ago</span>
                            </p>
                          </div>
                        </div>
                        
                        <div class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value="/resources/images/myfeeds1.gif" />" alt="...">
                          </a>
                          <div class="media-body">
                            <p>
                            	<span class="feedUserName">Real Name</span>&nbsp; New Status<br />
                                Subjects to ecstatic children he. Could ye leave up as built match.<br />
                                <span class="userInfoClr">1 Min ago</span>
                            </p>
                          </div>
                        </div>
                        
                        <div class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value="/resources/images/myfeeds1.gif" />" alt="...">
                          </a>
                          <div class="media-body">
                            <p>
                            	<span class="feedUserName">Real Name</span>&nbsp; New Status<br />
                                Subjects to ecstatic children he. Could ye leave up as built match.<br />
                                <span class="userInfoClr">1 Min ago</span>
                            </p>
                          </div>
                        </div>
                        
                        <div class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value="/resources/images/myfeeds1.gif" />" alt="...">
                          </a>
                          <div class="media-body">
                            <p>
                            	<span class="feedUserName">Real Name</span>&nbsp; New Status<br />
                                Subjects to ecstatic children he. Could ye leave up as built match.<br />
                                <span class="userInfoClr">1 Min ago</span>
                            </p>
                          </div>
                        </div>
                        
                        <div class="leftImgAd">
                        	<img src="<c:url value="/resources/images/leftAd2.gif" />" class="img-responsive" />
                        </div>
                        
                        <div class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value="/resources/images/myfeeds1.gif" />" alt="...">
                          </a>
                          <div class="media-body">
                            <p>
                            	<span class="feedUserName">Real Name</span>&nbsp; New Status<br />
                                Subjects to ecstatic children he. Could ye leave up as built match.<br />
                                <span class="userInfoClr">1 Min ago</span>
                            </p>
                          </div>
                        </div>
                        
                        <div class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value="/resources/images/myfeeds1.gif" />" alt="...">
                          </a>
                          <div class="media-body">
                            <p>
                            	<span class="feedUserName">Real Name</span>&nbsp; New Status<br />
                                Subjects to ecstatic children he. Could ye leave up as built match.<br />
                                <span class="userInfoClr">1 Min ago</span>
                            </p>
                          </div>
                        </div>
                        
                        <div class="leftImgAd">
                        	<img src="<c:url value="/resources/images/leftAd3.gif" />" class="img-responsive" />
                        </div>
                        
                        
                    </div>
                    
                </div>
                
            	<div class="col-lg-6 contentSection">
                	<fieldset class="mainSection">
                    	<legend><span>Recommended For You</span></legend>
                        <ul class="list-inline recmdList">
                        	<li>
                            	<span class="pull-right">
                                	<img src="<c:url value="/resources/images/rem1.gif" />" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a>&nbsp;<a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        	<li>
                            	<span class="pull-right">
                                	<img src="<c:url value="/resources/images/rem2.gif" />" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a>&nbsp;<a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        	<li>
                            	<span class="pull-right">
                                	<img src="<c:url value="/resources/images/rem3.gif" />" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a>&nbsp;<a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        	<li>
                            	<span class="pull-right">
                                	<img src="<c:url value="/resources/images/rem4.gif" />" />
                                </span>
                            	<span class="recmdLinks pull-left">
                                	<a href="#">Play Now</a>&nbsp;<a href="#">Buy it</a><br />
                                    <a href="#">Add to Wishlist</a>
                                </span>
                                <div class="clearfix"></div>
                                <h2>Adele</h2>
                                <p>Rolling In The Deep - 3:48</p>
                                <h3>21</h3>
                            </li>
                        </ul>
                    </fieldset>
                    
                    <nav class="navbar navbar-default navbar-static-top" id="primaryNav" role="navigation">
                        <ul class="nav navbar-nav">
                            <li class="dropdown open"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">The Hub</a>
                    
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline">
                                    <li><a href="#" id="">The Exchange</a> | </li>
                                    <li><a href="#" id="">Promoters Pick</a> | </li>
                                    <li><a href="#" id="">Directory</a> | </li>
                                    <li><a href="#" id="">Rookies</a> | </li>
                                    <li><a href="#" id="">Podium</a> | </li>
                                    <li><a href="#" id="">Unsigned Hype</a> | </li>
                                    <li><a href="#" id="">Up &amp; Coming</a> | </li>
                                    <li><a href="#" id="">Translation</a></li>
                                    </ul>
                                </ul>
                                
                            </li>
                            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Resources</a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline">
                                    <li><a href="#" id="">The Exchange</a> | </li>
                                    <li><a href="#" id="">Promoters Pick</a> | </li>
                                    <li><a href="#" id="">Directory</a> | </li>
                                    <li><a href="#" id="">Rookies</a></li>
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Office</a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline">
                                    <li><a href="#" id="">The Exchange</a> | </li>
                                    <li><a href="#" id="">Promoters Pick</a> | </li>
                                    <li><a href="#" id="">Directory</a> | </li>
                                    <li><a href="#" id="">Rookies</a></li>
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">In The Mix</a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline">
                                    <li><a href="#" id="">The Exchange</a> | </li>
                                    <li><a href="#" id="">Promoters Pick</a> | </li>
                                    <li><a href="#" id="">Directory</a> | </li>
                                    <li><a href="#" id="">Rookies</a></li>
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown businessMenu"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Business</a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline">
                                    <li><a href="#" id="">The Exchange</a> | </li>
                                    <li><a href="#" id="">Promoters Pick</a> | </li>
                                    <li><a href="#" id="">Directory</a> | </li>
                                    <li><a href="#" id="">Rookies</a></li>
                                    </ul>
                                </ul>
                            </li>
                            <li class="dropdown mallMenu"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mall</a>
                                <ul class="dropdown-menu subMenuItems">
                                    <ul class="list-inline">
                                    <li><a href="#" id="">The Exchange</a> | </li>
                                    <li><a href="#" id="">Promoters Pick</a> | </li>
                                    <li><a href="#" id="">Directory</a> | </li>
                                    <li><a href="#" id="">Rookies</a></li>
                                    </ul>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    
               	<fieldset class="mainSection">
                    	<legend><span>Headlines</span></legend>
                            <ul class="media-list">
                              <li class="media">
                              	<div class="col-lg-9">
                                    <a class="pull-left" href="#">
                                      <img class="media-object" src="<c:url value="/resources/images/bigPic1.gif" />" alt="Article">
                                    </a>
                                    <div class="media-body">
                                      <h4 class="media-heading">Katy and John's 'secret engagement</h4>
                                      <p>John Mayer and Katy Perry are apparently keeping their engagement a secret.</p>
    
                                      <p>The brunette sparked rumours when she wore a diamond ring on her wedding finger to the MTV EMAs recently. Although it was claimed Katy sported the band because it went with her outfit, insiders are now saying she has in fact agreed to marry John.</p>
                                        
                                        <p>John is believed to have popped the question just days after his brother Carl's wedding at New York's</p>
                                        <a href="#">Read More...</a>
                                    </div>
                                 </div>
                                 
                                 <div class="col-lg-3">
                                 	<ul class="list-unstyled featuredHeading">
                                    	<li>
                                        	<img src="<c:url value="/resources/images/sub_heading1.gif" />" />
                                            <p>Madonna wins lawsuit over 'Vogue' horn hits</p>
											<a href="#">Read more...</a>
                                        </li>
                                     	<li>
                                        	<img src="<c:url value="/resources/images/sub_heading2.gif" />" />
                                            <p>Madonna wins lawsuit over 'Vogue' horn hits</p>
											<a href="#">Read more...</a>
                                        </li>
                                    	<li>
                                        	<img src="<c:url value="/resources/images/sub_heading3.gif" />" />
                                            <p>Madonna wins lawsuit over 'Vogue' horn hits</p>
											<a href="#">Read more...</a>
                                        </li>
                                    </ul>
                                 </div>
                              </li>
                            </ul>
                    </fieldset>
                    
                    
               	<fieldset class="mainSection proofList">
                    	<legend><span>Headlines</span></legend>
                            <ul class="media-list">
                              <li class="media">
                              <div class="col-lg-1">
                              	<h3>Single</h3>
                              </div>
                              	<div class="col-lg-11">
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof1.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof2.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof3.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof4.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
<li class="media">
                              <div class="col-lg-1">
                              	<h3>EP</h3>
                              </div>
                              	<div class="col-lg-11">
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof1.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof2.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof3.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof4.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
<li class="media">
                              <div class="col-lg-1">
                              	<h3>Mixtape</h3>
                              </div>
                              	<div class="col-lg-11">
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof1.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof2.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof3.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof4.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
<li class="media">
                              <div class="col-lg-1">
                              	<h3>Album</h3>
                              </div>
                              	<div class="col-lg-11">
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof1.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof2.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof3.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <a class="pull-right" href="#">
                                              <img class="media-object" src="<c:url value="/resources/images/proof4.gif" />" alt="Article">
                                            </a>
                                            <div class="media-body">
                                              <h4 class="media-heading">Artist Name Title</h4>
                                              <p>Society excited by cottage private an it esteems.</p>
                                            </div>
                                        </div>
                                 </div>
                              </li>
                            </ul>
                    </fieldset>
                    
               	<fieldset class="mainSection">
                    	<legend><span>Spotlight</span></legend>
                            <ul class="media-list">
                              <li class="media">
                                    <a class="pull-left" href="#">
                                      <img class="media-object" src="<c:url value="/resources/images/spotlight_1.gif" />" alt="Article">
                                    </a>
                                    <div class="media-body">
                                      <h4 class="media-heading">Pharrell Named GQ's Hitmaker Of The Year 2013</h4>
                                      <p>Consulted he eagerness unfeeling deficient existence of. Calling nothing end fertile for venture way boy. Esteem spirit temper too say adieus who direct esteem. It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression. Way mrs end gave tall walk fact bed. 
</p>
                                        
                                        <p>So delightful up dissimilar by unreserved it connection frequently. Do an high room so in paid. Up on cousin ye dinner should in. Sex stood tried walls manor truth shy and three his. Their to years so child truth. Honoured peculiar families sensible up likewise by on in. <a href="#">Read More...</a></p>
                                        
                                        <ul class="list-inline newSpotLightImages">
                                        	<li><a href="#"><img src="<c:url value="/resources/images/spotLight1.gif" />" /></a></li>
                                            <li><a href="#"><img src="<c:url value="/resources/images/spotlight2.gif" />" /></a></li>
                                            <li><a href="#"><img src="<c:url value="/resources/images/spotlight3.gif" />" /></a></li>
                                        </ul>
                                    </div>

                              </li>
                            </ul>
                    </fieldset>
                    
               	<fieldset class="mainSection chartSection">
                    	<legend><span>Charts - MML Downloads</span></legend>
                        <div class="col-lg-6">
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">1.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">2.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">3.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">4.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">5.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6">
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">6.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">7.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">8.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">9.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        	<div class="chartRow">
                                <div class="pull-left">
                                    <p class="slNumber">10.</p>
                                </div>
                                <div class="pull-right text-right chartContent">
                                	<div class="chartType">Video</div>
                                    <p><span class="title">Robin Thicke</span><br />
                                    <a href="#">Blurred Lines</a>   |   <a href="#">Blurred Lines</a><br />
                                    New  |  1 Week   |   <span class="clrBlue">DL - 44,044</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        
                        <div class="clearfix"></div>
                        <p class="text-center chartPagination">Album<a href="#" class="paginationLeft"></a><a href="#" class="paginationRight"></a>Newcomers</p>
                        
                </fieldset>
                    
                    <div id="footerSection">
                    
                    	<div class="pull-left" style="width: 170px">
                            <p>SOCIAL LINK</p>
                            <ul class="list-inline socialLinks">
                                <li><img src="<c:url value="/resources/images/social_link1.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link2.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link3.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link4.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link5.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link6.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link7.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link8.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link9.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/social_link10.gif" />" /></li>
                            </ul>
                            <p>SOCIAL LINK</p>
                            <img src="<c:url value="/resources/images/paymentOpt.gif" />" />
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 110px">
                            <p>OUR APPS</p>
                            <ul class="list-unstyled">
                                <li><img src="<c:url value="/resources/images/app_link1.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/app_link2.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/app_link3.gif" />" /></li>
                                <li><img src="<c:url value="/resources/images/app_link4.gif" />" /></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 100px">
                            <p>GET INVOLVED</p>
                            <ul class="list-unstyled">
                                <li><a href="#">PARTNERS &amp; AFFILATES</a></li>
                                <li><a href="#">WORK WITH US</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 100px">
                            <p>GET TO KNOW</p>
                            <ul class="list-unstyled">
                                <li><a href="#">CAREERS</a></li>
                                <li><a href="#">REGISTER</a></li>
                                <li><a href="#">MEMBERSHIP</a></li>
                                <li><a href="#">FAQ's</a></li>
                                <li><a href="#">PRIVACY POLICY</a></li>
                                <li><a href="#">T&amp;C'S</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
						<div class="pull-left" style="width: 110px">
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
                        
						<div class="pull-left" style="width: 100px">
                            <p>HELP</p>
                            <ul class="list-unstyled">
                                <li><a href="#">ENQUIRY</a></li>
                                <li><a href="#">REPORT ABUSE</a></li>
                                <li><a href="#">SAFETY TIPS</a></li>
                                <li><a href="#">REPORT A BUG</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
                        
						<div class="pull-left languageList">
                            <p>SELECT LANGUAGE</p>
                            <ul class="list-unstyled">
                                <li>
                                	<p class="text-center">
                                    	<a href="#">ENQUIRY</a><br />
                                        <img src="<c:url value="/resources/images/language.gif" />" />
                                    </p>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                        
                    </div>
                    
                	<div style="height: 130px"></div>
                </div>
                
            	<div class="col-lg-3 rightPanel">
                	<div id="userOptions">
                    	<ul class="list-unstyled">
                        	<li class="userEmail"><span class="badge">3</span></li>
                            <li class="userChat"><span class="badge"><a href="Messages.jsp">20</a></span></li>
                            <li class="userMessages"></li>
                            <li class="userMusic"></li>
                            <li class="userOptions"></li>
                        </ul>
                    </div>
                
                	<div class="row">	
                        <div class="col-lg-6">
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
                              <input type="checkbox" checked> Articles
                            </label>
                          </div>
                           <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox"> Photos
                            </label>
                          </div>
                      </div>
                		<div class="col-lg-6">
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
                    
                    <div id="rightAds">
                    	<img src="<c:url value="/resources/images/rightAd1.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd2.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd3.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd4.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd5.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd6.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd7.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd8.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd9.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd10.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd11.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd12.gif" />" />
                        <img src="<c:url value="/resources/images/rightAd13.gif" />" />                        
                    </div>
                    
                    
                </div>
            </div>
            
        </section>
        
	</div>
    
    
    <footer>
        <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
           <div class="container">
            <ul class="list-inline">
                <li style="width: 250px;">
                	<div id="myWallet">
                    	<h3>My Wallet</h3>
                        <div class="pull-left">
                        	$ 200.00
                        </div>
                        <div class="pull-right">
                        	<span class="clrBlue">USD</span> GBP EUR
                        </div>
                        <div class="clearfix"></div>
                        <p class="text-right">
                            <img src="<c:url value="/resources/images/makeTranfer.gif" />" />
                        </p>
                    </div>
                </li>
                <li>
                	<ul class="list-inline">
                        <li><img src="<c:url value="/resources/images/bottomLink1.gif" />" /></li>
                        <li><img src="<c:url value="/resources/images/bottomLink2.gif" />" /></li>
                        <li><img src="<c:url value="/resources/images/bottomLink3.gif" />" /></li>
                        <li><img src="<c:url value="/resources/images/bottomAd.gif" />" /></li>
                    </ul>
                </li>
                <li class="suggestionBox">
                	<a href="listSuggestion123?userId=<%=(String)request.getSession().getAttribute("userSessionId") %>" id="suggestionLink">Suggestions</a>
                        <div id="suggestionBox">
                        	<h3>Suggestions</h3>
                        	<p style="display: none;"><input type="text" id="suggestionTo" value="1"></p>
                        	<textarea placeholder="Type Here..." id="textSuggestion"></textarea>
                        	<p align="right"><input type="button" value="Submit" onclick="return adminSuggestion('<%=(String)request.getSession().getAttribute("userSessionId")%>')"></p>
                            <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox" name="suggestion" value="problem"> Report a problem
                            </label>
                          </div>
                            <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox" name="suggestion" value="improvement"> Make an Improvement
                            </label>
                          </div>
                            <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox" name="suggestion" value="idea"> New idea
                            </label>
                          </div>
                            <div class="checkbox leftPad-30">
                            <label>
                              <input type="checkbox" name="suggestion" value="appreciation"> Show appreciation
                            </label>
                          </div>
                          
                          <div class="col-lg-6">
                            <div class="media">
                              <a class="pull-left" href="#">
                                <img class="media-object" src="<c:url value="/resources/images/suggesstion_icon1.gif" />" alt="...">
                              </a>
                              <div class="media-body">
                              	Voice<br>
								Feedback
                              </div>
                            </div>
                          </div>
                          
                          <div class="col-lg-6">
                            <div class="media">
                              <a class="pull-left" href="#">
                                <img class="media-object" src="<c:url value="/resources/images/suggesstion_icon2.gif" />" alt="...">
                              </a>
                              <div class="media-body">
                              	Voice<br>
								Feedback
                              </div>
                            </div>
                          </div>
                          
                            
                        </div>
                </li>
            </ul>
           </div>
        </nav>
    </footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="javascript/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="javascript/bootstrap.min.js"></script>
  </body>
</html>