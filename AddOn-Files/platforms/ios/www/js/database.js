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

//Creates a new player when the "+" button is pushed
function create_Player(){
     	//Create player array with elements
		var newPlayer = {
			id: i+1,
			number:"−",
			name:"",
			color:""
		}
		//add array to database
		addOn_db.push(newPlayer)
		//add player row in html
		players.append(create_Row(newPlayer));
		//save database
		saveDB("addOnDB", addOn_db)
		//update the players
		updatePlayers()
	}		

//Deletes all players from the database when the back button is pressed.
function delete_Players(){

	addOn_db = loadDB("addOnDB")
	//remove database from local storage
	localStorage.removeItem('addOnDB');
	//update players
	updatePlayers()
}


//Run on load
$(function(){
	addOn_db = loadDB("addOnDB")
	
	//Get a reference to the divs to edit
	players = $("#thePlayers");

	// Populate the players 
	updatePlayers();

});

//Updates the player list after adding or deleting a player
function updatePlayers(){
	//empty div
	players.empty();
	//repopulate div with new list from database
	for(var j=0; j<addOn_db.length; j++){
		var player = addOn_db[j];
		var row = create_Row(player);
		players.append(row);
	}
	
	//gets rid of plus button if 4 players exist
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

//Creates the html li for a player
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
	
	//Deletes a player from the database and html list if the minus button is clicked
	numberButton.click(function(){
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
		for (i=0;i<json.length;i++){
            if (json[i].id == please) json.splice(i,1);
			localStorage["addOnDB"] = JSON.stringify(json);}
			addOn_db.pop(player);

			updatePlayers()
	});

	return row;
}


