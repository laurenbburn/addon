var max_time = 8;
var cinterval;
 
function countdown_timer(){
  // decrease timer
  max_time--;
  document.getElementById('time').innerHTML = max_time;
  if(max_time == 0){
    clearInterval(cinterval);
    document.getElementById('time').innerHTML = "0";
  }
}

// 1,000 means 1 second.
function start_timer(){
max_time = 9;
cinterval = setInterval('countdown_timer()', 1000);
}