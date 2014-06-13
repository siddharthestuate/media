$(document).ready(function() {
	
	$('.showHide_open').click(function(){
		jQuery(this).hide();
		jQuery(this).parent().find('.showSection').show();
		jQuery(this).parent().find('.showHide_close').show();
		
		if(jQuery(this).parent().attr('id') == "footerLinks"){
			$("#footerLinks").addClass('footerDisplay');
			$("html, body").animate({ scrollTop: $(document).height()-$(window).height() });
		}
		
	});
	
	
	$('.media-list .media .col-md-1').css("min-height", $('.media-list .col-md-11 .col-md-4:first').height() - 10);
	
	$('.showHide_close').click(function(){
		jQuery(this).hide();
		jQuery(this).parent().find('.showSection').hide();
		jQuery(this).parent().find('.showHide_open').show();
		
		if(jQuery(this).parent().attr('id') == "footerLinks"){
			$("#footerLinks").removeClass('footerDisplay');
		}
		
	});
	
	$('body').not($('#searchOptions *, input.search-field-header')).click(function(element){
		if($('#searchOptions').css('display') == "block"){
				$('#searchOptions').hide();
		}
	});

	$('#primaryNav .dropdown').click(function(){
		$('#primaryNav .dropdown').removeClass('open');
		$(this).addClass('open');
	});
	
	$('.search-field-header').keyup(function(){
		if($(this).val() !=""){
			$('#searchOptions').show();
		}else{
			$('#searchOptions').hide();
		}
	});
	
	$('.toggleRightAds h3').click(function(){
		$(this).next().toggle();
	});
	
	$('.adContent').each(function(index, element) {
        $(this).find('img:first').addClass('rightImgFirstAd');
    });
	
  $('.nano').nanoScroller({
    preventPageScrolling: true
  });
  
  
  $('.newSpotLightImages a').click(function(event){
	  event.preventDefault();
	 $('.spotLightImg').removeAttr('src').attr('src',$(this).find('img').attr('src')); 
  });
  
  
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {	  
	  try{
		  $('#connectionFeeds').nanoScroller({
			preventPageScrolling: true
		  });
	  }catch(error){
		  
	  }
  });

jQuery('#mainContainer').css('min-height', jQuery('.rightPanel').height() + 30);


	jQuery("#newPost").click(function(){
		if(jQuery(this).val() == "New Post..."){
				jQuery(this).val('');
		}
	}).blur(function(){
		if(jQuery(this).val() == ""){
				jQuery(this).val('');
		}
	});
	
	jQuery("#suggestionsContent textarea").click(function(){
		if(jQuery(this).val() == "Type Here..."){
				jQuery(this).val('');
		}
	}).blur(function(){
		if(jQuery(this).val() == ""){
				jQuery(this).val('');
		}
	});

});

var tempScrollTop, currentScrollTop = 0; 

// This function will be executed when the user scrolls the page.
$(window).scroll(function(e) {
	
	
	$('#primary_recommonded').addClass('shadow');
	
    if ($(this).scrollTop()  == 0)
    {
       $('#primary_recommonded').removeClass('shadow');
    }

	var scroller_anchor = $(".scroller_anchor").offset().top - $(window).height();
	
	if ($(this).scrollTop() >= scroller_anchor && $('#rightAds').css('position') != 'fixed')
    { 
		$('#rightAds').addClass('fixRightAds');
		$('.feedsFixed').addClass('fixFeeds');

		var windowHeight = $( window ).height() - 450;		
		$('#feedsScroller').removeAttr('style').css('height', windowHeight+'px');
		$('#feedsScroller').nanoScroller();	
	}
	
   currentScrollTop = $(this).scrollTop();

   //if (tempScrollTop > currentScrollTop ) {
	if (tempScrollTop > currentScrollTop){
		if(tempScrollTop < ($(window).height())){
		   $('#rightAds').removeClass('fixRightAds');
		   $('.feedsFixed').removeClass('fixFeeds');
		  // $('#feedsScroller').nanoScroller();
		}
   }
   
  tempScrollTop = currentScrollTop; 

     
/*	// Get the position of the location where the scroller starts. 
	var scroller_anchor = $(".scroller_anchor").offset().top -310;
	 
    // Check if the user has scrolled and the current position is after the scroller start location and if its not already fixed at the top
    if ($(this).scrollTop() >= scroller_anchor && $('.scroller').css('position') != 'fixed')
    {    // Change the CSS of the scroller to hilight it and fix it at the top of the screen.
        $('.scroller').css({
            'position': 'fixed',
            'top': '0px'
        }).addClass('positionWhatsHappening');
        // Changing the height of the scroller anchor to that of scroller so that there is no change in the overall height of the page.
        $('.scroller_anchor').css('height', '50px');
    }
    else if ($(this).scrollTop() < scroller_anchor && $('.scroller').css('position') != 'relative')
    {    // If the user has scrolled back to the location above the scroller anchor place it back into the content.
         
        // Change the height of the scroller anchor to 0 and now we will be adding the scroller back to the content.
        $('.scroller_anchor').css('height', '0px');
         
        // Change the CSS and put it back to its original position.
        $('.scroller').css({
            'position': 'relative'
        }).removeClass('positionWhatsHappening');
    }*/
	
$('#userOptions li, a').click(function(){
	 $("html, document").scrollTop( 0 );
});

$('#dropdownMenu1').click(function(){
	 $("html, document").scrollTop( 0 );
});
	
});

function Background(){
    var imgs = [
            "resources/images/pageBg2.png",
            "resources/images/pageBg3.png",
            "resources/images/pageBg4.png"
        ],
        len = imgs.length,
        idx = -1;

    setInterval(function(){
        idx = (idx+1)%len;
        $("body").css("background", "url("+imgs[idx]+") no-repeat fixed center 0px #000");
    }, 20000);
}

Background();

/*
var middleContentHeight = $(".contentSection").height() - $("#showcase").height() + $('.showcase-content-container:first').height() - 130;

if(middleContentHeight < $(window).height()){
            $(".contentSection").append('&nbsp;').css({'min-height': $('body').height() +'px'});
            $(".contentSection .contentWrapper").css({'min-height': $(window).height()+'px', 'position':'fixed', 'background':'#fff'});
}else{
            $(".contentSection").append('&nbsp;').css({'min-height': $('body').height() +'px'});
            $(".contentSection .contentWrapper").removeAttr('style');
}
*/

function detectIE() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE ');
    var trident = ua.indexOf('Trident/');

    if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    if (trident > 0) {
        // IE 11 (or newer) => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    // other browser
    return false;
}

if(detectIE() !=false){
	jQuery('body').addClass('ie');	
}