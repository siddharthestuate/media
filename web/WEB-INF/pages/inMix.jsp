<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/css/DT_bootstrap.css"/>"
	rel="stylesheet" /> --%>
<%-- <!-- Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" />
    <link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet" />
    <link href="<c:url value="/resources/css/photo_gallery.css"/>" rel="stylesheet" /> --%>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--     <script src="<c:url value="/resources/javascript/jquery.js"/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/javascript/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/javascript/jquery.dataTables.js"/>"></script>
    <script src="<c:url value="/resources/javascript/DT_bootstrap.js"/>"></script>--%>
    
  <!--   <script type="text/javascript">
		$(document).ready(function() {
            $('.photoBox').each(function(){
				if($(this).hasClass('photoBoxVertical')){
						$(this).find('.captionBG').css("height", $(this).height());
				}else if($(this).hasClass('photoBoxHorizontal')){
						$(this).find('.captionBG').css("height", $(this).find('.caption').height() + 10);
				}
			})
        });
	</script>  -->
<body onload="moveImage();">
<fieldset>


	<div class="row colPad5">

		<div class="col-md-4">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/sound_editor.png"/>" alt="...">
				<h3>Bookmarks</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/sound_editor.png"/>" alt="...">
				<h3>Sales</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<h3>The Panel</h3>
				<img src="<c:url value="/resources/images/sound_editor.png"/>" alt="...">
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
		</div>

	</div>


	<div class="row colPad5">
		<div class="col-md-6">

			<div class="slider-wrap">
				<div id="main-photo-slider" class="csw">
					<div class="panelContainer">

						<div class="panel" title="Panel 1" id="panel1" style="display: none;">
							<div class="wrapper">
								<img src="<c:url value="/resources/images/tempphoto-1.jpg"/>" alt="temp"
									class="img-responsive" />
								<div class="photo-meta-data">
									Photo Credit: <a
										href="http://flickr.com/photos/astrolondon/2396265240/">Kaustav
										Bhattacharya</a><br /> <span>"Free Tibet" Protest at the
										Olympic Torch Rally</span>
								</div>
							</div>
						</div>
						<div class="panel" title="Panel 2" id="panel2" style="display: none;">
							<div class="wrapper">
								<img src="<c:url value="/resources/images/tempphoto-2.jpg"/>" alt="temp"
									class="img-responsive" />
								<div class="photo-meta-data">
									Chicago Bears at Seattle Seahawks<br /> <span>Fifth
										field goal, overtime win for the Seahawks</span>
								</div>
							</div>
						</div>
						<div class="panel" title="Panel 3" id="panel3" style="display: none;">
							<div class="wrapper">
								<img src="<c:url value="/resources/images/tempphoto-1.jpg"/>" alt="scotch egg"
									class="floatLeft img-responsive" />
								<div class="photo-meta-data">
									Chicago Bears at Seattle Seahawks<br /> <span>Fifth
										field goal, overtime win for the Seahawks</span>
								</div>
							</div>
						</div>
						<div class="panel" title="Panel 4" id="panel4" style="display: none;">
							<div class="wrapper">
								<img src="<c:url value="/resources/images/tempphoto-2.jpg"/>" alt="temp"
									class="img-responsive" />
								<div class="photo-meta-data">
									A Poem by Shel Silverstein<br /> <span>Falling Up</span>
								</div>
							</div>
						</div>
						<div class="panel" title="Panel 5" id="panel5" style="display: none;">
							<div class="wrapper">
								<img src="<c:url value="/resources/images/tempphoto-5.jpg"/>" alt="temp"
									class="img-responsive" />
								<div class="photo-meta-data">
									New Video on CSS-Tricks<br /> <span>Using Wufoo for Web
										Forms</span>
								</div>
							</div>
						</div>

					</div>
				</div>

				<%-- <a href="#1" class="cross-link active-thumb"><img
					src="<c:url value="/resources/images/tempphoto-1thumb.jpg"/>" class="nav-thumb"
					alt="temp-thumb" /></a>
				<div id="movers-row">
					<div>
						<a href="#2" class="cross-link"><img
							src="<c:url value="/resources/images/tempphoto-2thumb.jpg"/>" class="nav-thumb"
							alt="temp-thumb" /></a>
					</div>
					<div>
						<a href="#3" class="cross-link"><img
							src="<c:url value="/resources/images/tempphoto-3thumb.jpg"/>" class="nav-thumb"
							alt="temp-thumb" /></a>
					</div>
					<div>
						<a href="#4" class="cross-link"><img
							src="<c:url value="/resources/images/tempphoto-4thumb.jpg"/>" class="nav-thumb"
							alt="temp-thumb" /></a>
					</div>
					<div>
						<a href="#5" class="cross-link"><img
							src="<c:url value="/resources/images/tempphoto-5thumb.jpg"/>" class="nav-thumb"
							alt="temp-thumb" /></a>
					</div>
				</div> --%>

			</div>


		</div>

		<div class="col-md-6">
			<div class="thumbnail photoBox photoBoxVertical">
				<img src="<c:url value="/resources/images/stage-show.jpg"/>" alt="...">
				<div class="caption">
					<h3>P2P</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
		</div>

	</div>


	<div class="clearfix"></div>


	<div class="row colPad5 snapBack">
		<div class="col-md-5">

			<div class="verticalTabs">

				<!-- Navigation Buttons -->
				<div class="col-md-6 imgSpc">
					<div class="tab-content">
						<div class="tab-pane active" id="home">
							<img src="<c:url value="/resources/images/leftAd1.gif"/>" class="img-responsive" />
						</div>
						<div class="tab-pane" id="profile">
							<img src="<c:url value="/resources/images/leftAd1.gif"/>" class="img-responsive" />
						</div>
						<div class="tab-pane" id="messages">
							<img src="<c:url value="/resources/images/leftAd1.gif"/>" class="img-responsive" />
						</div>
					</div>
				</div>

				<!-- Content -->
				<div class="col-md-6 imgDesc">
					<ul class="nav nav-pills nav-stacked" id="myTabs">
						<li class="active">
							<div class="list-group">
								<a href="#home" class="list-group-item active">
									<h4 class="list-group-item-heading">List group item
										heading</h4>
									<p class="list-group-item-text">Donec id elit non mi porta
										gravida at eget metus.</p>
								</a>
							</div>
						</li>
						<li>
							<div class="list-group">
								<a href="#profile" class="list-group-item">
									<h4 class="list-group-item-heading">List group item
										heading</h4>
									<p class="list-group-item-text">Donec id elit non mi porta
										gravida at eget metus.</p>
								</a>
							</div>
						</li>
						<li>
							<div class="list-group">
								<a href="#messages" class="list-group-item">
									<h4 class="list-group-item-heading">List group item
										heading</h4>
									<p class="list-group-item-text">Donec id elit non mi porta
										gravida at eget metus.</p>
								</a>
							</div>
						</li>
					</ul>
				</div>

			</div>

			<!-- Enable the tabs -->

		</div>

		<div class="col-md-7">

			<div class="yearBook">
				<img src="<c:url value="/resources/images/logo.png"/>" />
				<hr />
				<h3>Yearbook</h3>
				<hr />
				<ul class="list-inline">
					<li><a href="#">Link 1</a></li>
					<li><a href="#">Link 2</a></li>
					<li><a href="#">Link 3</a></li>
					<li><a href="#">Link 4</a></li>
					<li><a href="#">Link 5</a></li>
					<li><a href="#">Link 6</a></li>
					<li><a href="#">Link 7</a></li>
				</ul>
			</div>
		</div>

	</div>



	<div class="row colPad5 reviewsSection">

		<div class="col-md-5">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/reviews.jpg"/>" alt="...">
				<h3>My Studio</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
	<%-- <script src="<c:url value="/resources/javascript/jquery.js"/>"></script> 
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/javascript/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/jquery-easing-1.3.pack.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/jquery-easing-compatibility.1.2.pack.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/coda-slider.1.1.1.pack.js"/>"></script>
    
    <script type="text/javascript">
		$(document).ready(function() {
            $('.photoBox').each(function(){
				if($(this).hasClass('photoBoxVertical')){
						$(this).find('.captionBG').css("height", $(this).height());
				}else if($(this).hasClass('photoBoxHorizontal')){
						$(this).find('.captionBG').css("height", $(this).find('.caption').height() + 10);
				}
			})
			
			
            $('#suggestionLink').click(function(event){
				event.preventDefault();
				if($('#suggestionBox').css('display')=="block"){
						$('#suggestionBox').hide();
				}else{
						$('#suggestionBox').show();
				}
			})
			
			  $('#myTabs a').click(function (e) {
				e.preventDefault();
				$('#myTabs a').removeClass('active');
				$(this).tab('show').addClass('active');
			  });
			
        });
		
		var theInt = null;
		var $crosslink, $navthumb;
		var curclicked = 0;
		
		theInterval = function(cur){
			clearInterval(theInt);
			
			if( typeof cur != 'undefined' )
				curclicked = cur;
			
			$crosslink.removeClass("active-thumb");
			$navthumb.eq(curclicked).parent().addClass("active-thumb");
				$(".stripNav ul li a").eq(curclicked).trigger('click');
			
			theInt = setInterval(function(){
				$crosslink.removeClass("active-thumb");
				$navthumb.eq(curclicked).parent().addClass("active-thumb");
				$(".stripNav ul li a").eq(curclicked).trigger('click');
				curclicked++;
				if( 6 == curclicked )
					curclicked = 0;
				
			}, 3000);
		};
		
		$(function(){
			
			$("#main-photo-slider").codaSlider();
			
			$navthumb = $(".nav-thumb");
			$crosslink = $(".cross-link");
			
			$navthumb
			.click(function() {
				var $this = $(this);
				theInterval($this.parent().attr('href').slice(1) - 1);
				return false;
			});
			
			theInterval();
		});
		
	</script> --%>

			<div class="thumbnail photoBox photoBoxHorizontal unreleased">
				<h3>My Studio</h3>

				<div class="clearfix"></div>

				<dl class="dl-horizontal firstUnreleased">
					<dt>
						<img src="<c:url value="/resources/images/myfeeds2.gif"/>" /><br /> <a href="#">13
							Tracks</a>
					</dt>
					<dd>
						<h3>Lorem ipsum dolor</h3>
						<p>Lorem ipsum dolor sit amet</p>
						<p>Lorem ipsum dolor sit amet</p>
						<p>Lorem ipsum dolor sit amet</p>
						<a href="#">View All</a>
					</dd>
				</dl>

				<dl class="dl-horizontal">
					<dt>
						<img src="<c:url value="/resources/images/myfeeds2.gif"/>" /><br /> <a href="#">13
							Tracks</a>
					</dt>
					<dd>
						<h3>Lorem ipsum dolor</h3>
						<p>Lorem ipsum dolor sit amet</p>
						<p>Lorem ipsum dolor sit amet</p>
						<p>Lorem ipsum dolor sit amet</p>
						<a href="#">View All</a>
					</dd>
				</dl>

				<dl class="dl-horizontal lastUnreleased">
					<dt>
						<img src="<c:url value="/resources/images/myfeeds2.gif"/>" /><br /> <a href="#">13
							Tracks</a>
					</dt>
					<dd>
						<h3>Lorem ipsum dolor</h3>
						<p>Lorem ipsum dolor sit amet</p>
						<p>Lorem ipsum dolor sit amet</p>
						<p>Lorem ipsum dolor sit amet</p>
						<a href="#">View All</a>
					</dd>
				</dl>

			</div>


		</div>

		<div class="col-md-7">

			<div class="thumbnail photoBox photoBoxVertical">
				<img src="<c:url value="/resources/images/img1.jpg"/>" alt="...">
				<div class="caption">
					<h3>My Studio</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>

			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/naughty_boy.jpg"/>" alt="...">
				<h3>My Studio</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
		</div>


	</div>


	<div class="row colPad5">

		<div class="col-md-7">
			<div id="rookies_Mix">
				<img src="<c:url value="/resources/images/artist_1.png"/>"> <img src="<c:url value="/resources/images/artist_2.png"/>">
				<img src="<c:url value="/resources/images/artist_3.png"/>"> <img src="<c:url value="/resources/images/artist_1.png"/>">
				<img src="<c:url value="/resources/images/artist_2.png"/>"> <img src="<c:url value="/resources/images/artist_3.png"/>">
				<img src="<c:url value="/resources/images/artist_2.png"/>">
			</div>
		</div>

		<div class="col-md-5">
			<div class="thumbnail photoBox photoBoxVertical">
				<img src="<c:url value="/resources/images/finest-for-my-dawgs.jpg"/>" alt="...">
				<div class="caption">
					<h3>My Cities Finest</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
						Lorem ipsum dolor sit amet, labore et dolore magna aliqua. Ut enim
						ad minim veniam</p>
					<div class="captionBG"></div>
				</div>
			</div>
		</div>
	</div>

</fieldset>
</body>