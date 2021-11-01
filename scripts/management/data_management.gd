extends Node

var save_path: String = "user://save.dat"

var current_exp: int = 0
var current_level: int = 1

var strength: int = 0
var dextery: int = 0
var vitality: int = 0
var agility: int = 0

var current_game_level: String = "res://scenes/management/dungeon_manager.tscn"

var stats_dictionary: Dictionary = {
	"Str": strength,
	"Dex": dextery,
	"Vit": vitality,
	"Agi": agility
}

var data_dictionary: Dictionary = {
	"current_exp": current_exp,
	"current_level": current_level,
	"current_game_level": current_game_level,
	"stats_dict": stats_dictionary
}

func save_data() -> void:
	var file: File = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data_dictionary)
		file.close()
		
		
func load_data() -> void:
	var file: File = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			data_dictionary = file.get_var()
			file.close()
