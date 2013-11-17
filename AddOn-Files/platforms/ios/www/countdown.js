var max_time = 8;
var cinterval;
 
function countdown_timer(){
  // decrease timer
  max_time--;
  document.getElementById('time').innerHTML = max_time;
  document.getElementById('countdown').style.backgroundColor = "#000000"
  if(max_time == 3)
  document.getElementById('countdown').style.backgroundColor = "#400000"
  else{if(max_time == 2){
  	document.getElementById('countdown').style.backgroundColor = "#800000"
  	};
  	if(max_time == 1){
  	document.getElementById('countdown').style.backgroundColor = "#C00000"
  	};
  	if(max_time == 0){
    clearInterval(cinterval);
    document.getElementById('time').innerHTML = "0";
    document.getElementById('countdown').style.backgroundColor = "#FF0000"
  	};
  };
}

// 1,000 means 1 second.
function start_timer(){
max_time = 9;
cinterval = setInterval('countdown_timer()', 1000);
}