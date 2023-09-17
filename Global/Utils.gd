extends Node

# change res to users when releasing the game
const SAVE_PATH = "res://savegame.bin"


func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"Gold": Game.Gold
	}
	
	var jsonString = JSON.stringify(data)
	file.store_line(jsonString)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	
	if FileAccess.file_exists(SAVE_PATH):
		if not file.eof_reached():
			var current_Line = JSON.parse_string(file.get_line())
			if current_Line:
				Game.playerHP = current_Line["playerHP"]
				Game.Gold = current_Line["Gold"]
