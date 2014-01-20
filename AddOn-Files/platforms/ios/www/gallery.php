<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="js/jquery-2.0.0.min.js"></script>
<script src="js/jquery.cooki.js"></script>
<script type="text/javascript" src="js/gallery.js"></script>
<title>AddOn</title>

</head>

<body>

<div class="app">

<div id="header">
	<a href="index.html" class="icon2 left" onclick= "delete_Players()">&#8962;</a>
    <h1 class = "with_border">Gallery</h1>
</div>

<div id="gallery">

<?php

$directory = 'gallery';

$allowed_types=array('jpg','jpeg','gif','png');
$file_parts=array();
$ext='';
$title='';
$i=0;

$dir_handle = @opendir($directory) or die("There is an error with your image directory!");

while ($file = readdir($dir_handle)) 
{
	if($file=='.' || $file == '..') continue;
	
	$file_parts = explode('.',$file);
	$ext = strtolower(array_pop($file_parts));

	$title = implode('.',$file_parts);
	$title = htmlspecialchars($title);
	
	$nomargin='';
	
	if(in_array($ext,$allowed_types))
	{
		if(($i+1)%3==0) $nomargin='nomargin';
	
		echo '
		<div class="pic '.$nomargin.'" style="background:url('.$directory.'/'.$file.') no-repeat 50% 50%; background-size:100px;">
		<a href="detail.html" title="'.$directory.'/'.$file.'" >'.$title.'</a>
		</div>';
		
		$i++;
	}
}

closedir($dir_handle);

?>
<div class="clear"></div>
</div>


</div>

</body>
</html>
