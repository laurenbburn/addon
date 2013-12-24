var i = 3;

function add_player(){
var playerList = document.getElementById("players");
	if(i<5)
	{	
		var newLi = document.createElement("li");
		newLi.classList.add("with_border");
		
		var newSpan = document.createElement("span");
		newSpan.classList.add("numbers");
		newSpan.innerHTML = i;
		newSpan.style.paddingRight = "18px";
		
		var newInput = document.createElement("input");
		newInput.type = "text";
		newInput.name = "player"+i;
		
		var newLinkSpan = document.createElement("span");
		
		var newLink = document.createElement("a");
		newLink.appendChild(newLinkSpan);
		newLink.setAttribute("class", "swatch");
		newLink.setAttribute("href","colors.html");

		
		newLi.appendChild(newSpan);
		newLi.appendChild(newInput);
		newLi.appendChild(newLink);
		
		
		playerList.appendChild(newLi);
		i+=1;
		
	}
	
	
}