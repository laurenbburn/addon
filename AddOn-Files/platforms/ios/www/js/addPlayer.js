var i = 3;

function add_player(){
var playerList = document.getElementById("players");
var addButton = document.getElementById("add_player");
	if(i<5)
	{	
		var newLi = document.createElement("li");
		newLi.classList.add("with_border");
		
		var newButton = document.createElement("button");
		newButton.classList.add("numbers");
		newButton.innerHTML = "−";
		newButton.type = "button";
		newButton.style.paddingRight = "17px";
		newButton.onclick = function(){
			playerList.removeChild(newLi);
			i-=1;

			if(i<5){
			addButton.style.display="block";
			}
		};
		
		var newInput = document.createElement("input");
		newInput.type = "text";
		newInput.name = "player"+i;
		
		var newLinkSpan = document.createElement("span");
		
		var newLink = document.createElement("a");
		newLink.appendChild(newLinkSpan);
		newLink.setAttribute("class", "swatch");
		newLink.setAttribute("href","colors.html");

		
		newLi.appendChild(newButton);
		newLi.appendChild(newInput);
		newLi.appendChild(newLink);
		
		
		playerList.appendChild(newLi);
		i+=1;
		
		if(i==5){
		addButton.style.display="none";
		} 
		
	}
	
	
	
}

