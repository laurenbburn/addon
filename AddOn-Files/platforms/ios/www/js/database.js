var addOn_dB, players, name1, name2, name3, name4;


addOn_db = loadDB("addOnDB");

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
	
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
	
	if(json.length == 2){
		var num = 3;
	}
	else {
		for(i=0;i<json.length;i++){
			if (json[i].id == 3) {
			var num = 4;
			} else {
			var num = 3;
			}
		}
	}
	
     	//Create player array with elements
		var newPlayer = {
			id: num,
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
		//updatePlayers()
		check_Add()
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
	check_Add();

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
	//updatePlayers()

	
}

//Creates the html li for a player
function create_Row(player){
	var please = player.id;
	
	var playerList = $("#thePlayers");
	var row = $("<li class='with_border'>");
	var numberButton = $("<button class='numbers' type='button'>");
	var nameInput = $("<input name = '"+please +"' type='text' maxlength='10'>");
	var colorSpan = $("<span class='date'>");
	var colorLink = $("<a id = '"+please +"' class= 'swatch' href= 'colors.html'>");
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
			//Get rid of player from db
			addOn_db.pop(player);
			//remove the row
			row.remove();
			
			check_Add();
			
	});

	return row;
}

//gets rid of plus button if 4 players exist	
function check_Add(){
	i = addOn_db.length;
	var addButton = $("#add_player")
	
	if (i==4){
		addButton.css('display', 'none')
	}else{
		addButton.css('display', 'block')
	}
}

//when swatch is clicked grabs the id and runs save_Names()
$(document).on("click", ".swatch", function() {
    var ID = this.id;
	$.cookie("ID", ID);
    save_Names();
    });
    
    
//Saves input values as names in the database
function save_Names(){
    name1 = $("[name='1']").val();
	name2 = $("[name='2']").val();
	name3 = $("[name='3']").val();
	name4 = $("[name='4']").val();
	
	function setItemName(json){
		for (var i in json){
			if(json[i].id == 1){
				json[i].name = name1;
			}else if(json[i].id == 2){
				json[i].name = name2;
			}else if(json[i].id == 3){
				json[i].name = name3;
			}else{
				json[i].name = name4;
			}
		}
		return json;
	};
	
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
	for(i=0;i<json.length;i++){
	json = setItemName(json);
	console.log(json);
	localStorage["addOnDB"] = JSON.stringify(json);}
    }

//fills input forms with values from the database onload
$(document).ready(function(){
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
	for (var i in json){
			if(json[i].id == 1){
				name1 = json[i].name
				$("[name='1']").val(name1);
			}else if(json[i].id == 2){
				name2 = json[i].name
				$("[name='2']").val(name2);
			}else if(json[i].id == 3){
				name3 = json[i].name
				$("[name='3']").val(name3);
			}else{
				name4 = json[i].name
				$("[name='4']").val(name4);
			}
		}
});

//checks if color has already been chosen, and if not adds to player's array.    
$(document).on("click", "#color_btn", function(e) {
    colVal = $('input[name="selection"]:checked', '#swatches').val();
    playID = $.cookie("ID");
    
    function setItemColor(json){
		for (var i in json){
			if(json[i].color == colVal){
				alert("This color is already taken");
				e.preventDefault();
			}else{ 
				if(json[i].id == playID){
					json[i].color = colVal;
			}
		}
		}
		return json;
	};
	
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
	json = setItemColor(json);
	console.log(json);
	localStorage["addOnDB"] = JSON.stringify(json);
    
	});

//fills the swatches with their colors on page load    
$(document).ready(function(){
	addOn_db = loadDB("addOnDB")
	var json = JSON.parse(localStorage["addOnDB"]);
	for (var i in json){
			if(json[i].id == 1){
				col1 = json[i].color
				if(col1 != ''){
				$("#1").css({"border":"none", "height":"36px", "width":"36px", "background": col1})}
			}else if(json[i].id == 2){
				col2 = json[i].color
				if(col2 != ''){
				$("#2").css({"border":"none", "height":"36px", "width":"36px", "background": col2})}
			}else if(json[i].id == 3){
				col3 = json[i].color
				if(col3 != ''){
				$("#3").css({"border":"none", "height":"36px", "width":"36px", "background": col3})}
			}else if(json[i].id == 4){
				col4 = json[i].color
				if(col4 != ''){
				$("#4").css({"border":"none", "height":"36px", "width":"36px", "background": col4})}	
			}

		}
		
		
});

