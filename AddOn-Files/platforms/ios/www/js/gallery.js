window.onload = function(){
	img_db=loadDB("imgDB")
	var json = JSON.parse(localStorage["imgDB"]);
	var images = $('#images');
	
	var image_total = document.images;

	if(image_total.length<json.length){
	for(var i = 0; i<(json.length); i++){
		var img = new Image();
		img.src = json[i];
		images.append(img);
	}
	}
}

/*$(document).on("click", "a", function() {
	 var path = this.title
	 $.cookie("path", path);
    });
    
$(document).ready(function(){
	imgPath = $.cookie("path");
	$('img').attr('src', imgPath);
});

$(document).ready(function(){
var dir = "gallery/";
var fileextension = ".jpg";
$.ajax({
    //This will retrieve the contents of the folder if the folder is configured as 'browsable'
    url: dir,
    success: function (data) {
        //Lsit all png file names in the page
        $(data).find("a:contains(" + fileextension + ")").each(function () {
            var filename = this.href.replace(window.location.host, "").replace("http:///", "");
            $("body").append($("<img src=" + Dir + filename + "></img>"));
        });
    }
});
});*/