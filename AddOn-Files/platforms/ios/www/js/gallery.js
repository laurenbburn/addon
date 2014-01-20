$(document).on("click", "a", function() {
	 var path = this.title
	 $.cookie("path", path);
    });
    
$(document).ready(function(){
	imgPath = $.cookie("path");
	$('img').attr('src', imgPath);
});