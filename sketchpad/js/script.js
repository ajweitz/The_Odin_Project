
const padSize = 830;
const defaultPixelAmount = 16;
const maxPixels=30; 
const defaultPenColor="black";

var penColor = defaultPenColor;
var leftButtonDown = false;

$(document).ready(function(){

	var pixels = defaultPixelAmount;
	populatePad(pixels);

	$("#new").on('click',function(){
		pixels = prompt("Hi, choose how many pixels you want on the board, maximum 30, (AxA) A:");
		// $(".sketchpad ul").empty();

		if (isNaN(pixels) || pixels<=0)
			pixels=defaultPixelAmount;
		else if(pixels>maxPixels)
			pixels=maxPixels;

		populatePad(pixels);

	});

	$("#reset").on('click',function(){
		// alert("baaa");
		populatePad(pixels);

	});

	$(".colorPicker > div").css({"background-color": $(this).data("color")});

	for (var i=0; i<= $(".colorPicker > div").length; i++){
		var currentDiv = $(".colorPicker > div:nth-child("+i+")");
		var currentColor= currentDiv.data("color");
		currentDiv.css({"background-color":currentColor});
	}

	$(".colorPicker > div").on('click',function(){
		penColor = $(this).data("color");
		// alert(penColor);
	});


    
    $(document).mousedown(function(e){
        // Left mouse button was pressed, set flag
        if(e.which === 1) leftButtonDown = true;
    });
    $(document).mouseup(function(e){
        // Left mouse button was released, clear flag
        if(e.which === 1) leftButtonDown = false;
    });
    
    function tweakMouseMoveEvent(e){
        // Check from jQuery UI for IE versions < 9
        if ($.browser.msie && !(document.documentMode >= 9) && !event.button) {
            leftButtonDown = false;
        }
        
        // If left button is not set, set which to 0
        // This indicates no buttons pressed
        if(e.which === 1 && !leftButtonDown) e.which = 0;
    }

    $(document).mousemove(function(e) {
        tweakMouseMoveEvent(e);
        // $('body').text('which: ' + e.which);
    });


});



function populatePad(pixels){
	$(".sketchpad ul").empty();
	var pixelSize = padSize/pixels;
	var pixelSizeCSS = pixelSize+"px";
	// var $sketchpad = $(".sketchpad");

	for(var i=0; i<pixels; i++){
		$(".sketchpad ul").append("<li></li>");
		for(var j=0; j<pixels; j++){
			var div = '<div class="pixel" data-color="white"></div';
			$(".sketchpad ul li").last().append(div);
			$(".pixel").css({"height":pixelSizeCSS,"width":pixelSizeCSS});
		}
	}

	$(".pixel").on('mouseover',function(){
		// $(this).addClass("mouseOverPixel");
		// if(!$(this).hasClass("drawn")){
			$(this).css("background-color", penColor);
			if(leftButtonDown)
				$(this).data("color",penColor);
		// }


	});

	$(".pixel").on('mouseleave',function(){
		var pix = $(this);
		var prevColor = pix.data("color");

		if(pix.data("color")==="white"){
		
			pix.fadeOut(200, function() {
				
		        pix.css("background-color", prevColor).fadeIn(200);
			});	
		}else{
			pix.css("background-color", prevColor);
		}
	});
	
	$(".pixel").mousedown(function(){
		$(this).css("background-color", penColor);
		$(this).data("color",penColor);
		// $(this).addClass("drawn");

	});
}