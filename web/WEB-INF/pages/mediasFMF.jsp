<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="<c:url value="/resources/javascript/jquery.js"/>"></script>

<link href="resources/css/medialounge.css" rel="stylesheet" />
<!-- <script type="text/javascript" src="resources/javascript/medialounge.js"></script>  -->

<script type="text/javascript">
(function($) {
    $.timer = function(func, time, autostart) {
        this.set = function(func, time, autostart) {
            this.init = true;
            if(typeof func == 'object') {
                var paramList = ['autostart', 'time'];
                for(var arg in paramList) {if(func[paramList[arg]] != undefined) {eval(paramList[arg] + " = func[paramList[arg]]");}};
                func = func.action;
            }
            if(typeof func == 'function') {this.action = func;}
            if(!isNaN(time)) {this.intervalTime = time;}
            if(autostart && !this.isActive) {
                this.isActive = true;
                this.setTimer();
            }
            return this;
        };
        this.once = function(time) {
            var timer = this;
            if(isNaN(time)) {time = 0;}
            window.setTimeout(function() {timer.action();}, time);
            return this;
        };
        this.play = function(reset) {
            if(!this.isActive) {
                if(reset) {this.setTimer();}
                else {this.setTimer(this.remaining);}
                this.isActive = true;
            }
            return this;
        };
        this.pause = function() {
            if(this.isActive) {
                this.isActive = false;
                this.remaining -= new Date() - this.last;
                this.clearTimer();
            }
            return this;
        };
        this.stop = function() {
            this.isActive = false;
            this.remaining = this.intervalTime;
            this.clearTimer();
            return this;
        };
        this.toggle = function(reset) {
            if(this.isActive) {this.pause();}
            else if(reset) {this.play(true);}
            else {this.play();}
            return this;
        };
        this.reset = function() {
            this.isActive = false;
            this.play(true);
            return this;
        };
        this.clearTimer = function() {
            window.clearTimeout(this.timeoutObject);
        };
        this.setTimer = function(time) {
            var timer = this;
            if(typeof this.action != 'function') {return;}
            if(isNaN(time)) {time = this.intervalTime;}
            this.remaining = time;
            this.last = new Date();
            this.clearTimer();
            this.timeoutObject = window.setTimeout(function() {timer.go();}, time);
        };
        this.go = function() {
            if(this.isActive) {
                this.action();
                this.setTimer();
            }
        };

        if(this.init) {
            return new $.timer(func, time, autostart);
        } else {
            this.set(func, time, autostart);
            return this;
        }
    };
})(jQuery);


var fmfSlider = new (function() {
    var $galleryImages, // An array of image elements
            $timeRemaining, // Usually hidden element to display time when paused
            imageId = 0, // Which image is being shown
            incrementTime = 300000,
            updateTimer = function() {
                $galleryImages.eq(imageId).stop(true,true).fadeOut(0);
                imageId++;
                if (imageId > $galleryImages.length -1) {
                    imageId = 0;
                }
                $galleryImages.eq(imageId).stop(true,false).fadeIn(0);
            },
            init = function() {
            	//alert("init function");
                $galleryImages = $('.galleryImages div.div-object');
                $timeRemaining = $('#timeRemaining');
                fmfSlider.Timer = $.timer(updateTimer, incrementTime, true).once();
            };
    	this.toggleGallery = function() {
        if (this.Timer.isActive) {
            this.Timer.pause();
            var remaining = this.Timer.remaining / 1000;
            $timeRemaining.html(remaining + " seconds remaining.");
        }
        else {
            this.Timer.play();
            $timeRemaining.html("<br/>");
        }
    };
    this.setInit = function(){
    	//fmfSlider.init();
    	//alert("O I am here");
    	$(init);
    };
   // $(init);
});
</script>



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
