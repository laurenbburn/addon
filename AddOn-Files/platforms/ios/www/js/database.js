var addOn_dB, players;

addOn_db = loadDB("addOnDB")

var i; 


//Loads the database from a string in localStorage
function loadDB(name){
	//return []


	//If the database with that name doesn't exist...
	if(!localStorage[name])
		//Make an empty one
		return []
	else
		//Otherwise parse it
		return JSON.parse(localStorage[name]);
}

//Saves the database to a string in localStorage
function saveDB(name, db){
	//Save the database as a string to localStorage
	localStorage[name] = JSON.stringify(db);
}

function create_Player(){
	// date = new Date();
	//var d = (date.getMonth() + 1) + "/"	+ date.getDate() + "/" + (date.getYear()-100);
	//var name = dgID('tripsy').value
	//var pos;      	
		var newPlayer = {
			id: i+1,
			number:"−",
			name:"",
			color:""
		}
		addOn_db.push(newPlayer)
		players.append(create_Row(newPlayer));
		saveDB("addOnDB", addOn_db)
		updatePlayers()
	}		

function delete_Players(){
	addOn_db = loadDB("addOnDB")
	localStorage.removeItem('addOnDB');
	
	updatePlayers()
}


//Run on load
$(function(){
	addOn_db = loadDB("addOnDB")
	//if (addOn_db.length > 0)
		//active_Trip = atlas_db[atlas_db.length-1]
	
	//Get a reference to the divs to edit
	players = $("#thePlayers");

	// Populate the my trips page with old trips
	updatePlayers();

});

function updatePlayers(){
	players.empty();
	for(var j=0; j<addOn_db.length; j++){
		var player = addOn_db[j];
		var row = create_Row(player);
		players.append(row);
	}
	
	i = addOn_db.length;
	var addButton = $("#add_player")
	
	if (i==4){
		addButton.css('display', 'none')
	}else{
		addButton.css('display', 'block')
	}
}

//Creates the initial 2 player forms
function initial(){

	var newPlayer1 = {
		id: 1,
		number:"1",
		name:"",
		color:""
	}
	
	var newPlayer2 = {
		id: 2,
		number:"2",
		name:"",
		color:""
	}
	
	addOn_db.push(newPlayer1)
	addOn_db.push(newPlayer2)
	players.append(create_Row(newPlayer1));
	players.append(create_Row(newPlayer2));
	saveDB("addOnDB", addOn_db)
	updatePlayers()

	
}

function create_Row(player){
	var please = player.id;
	var playerList = $("#thePlayers");
	var row = $("<li class='with_border'>");
	var numberButton = $("<button class='numbers' type='button'>");
	var nameInput = $("<input type='text'>");
	var colorSpan = $("<span class='date'>");
	var colorLink = $("<a class= 'swatch' href= 'colors.html'>");
	numberButton.text(player.number);
	nameInput.text (player.name);
	colorLink.append(colorSpan);
	row.append(numberButton);
	row.append(nameInput);
	row.append(colorLink);
	row.prop("data", player);
	
	numberButton.click(function(){
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
		for (i=0;i<json.length;i++){
            if (json[i].id == please) json.splice(i,1);
			localStorage["addOnDB"] = JSON.stringify(json);}
			addOn_db.pop(player);

			updatePlayers()
			//window.location.reload();
	});

	return row;
}


