extends Control

onready var vbox: VBoxContainer = get_node("MenuContainer/VBox")

var level: String

func _ready() -> void:
	var file: File = File.new()
	if file.file_exists(DataManagement.save_path):
		vbox.get_node("Load").disabled = false
		DataManagement.load_data()
		level = DataManagement.data_dictionary.current_game_level
		
	for button in vbox.get_children():
		button.connect("pressed", self, "on_button_pressed", [button.name])
		
		
func on_button_pressed(button_type: String) -> void:
	match button_type:
		"Play":
			var _change_scene = get_tree().change_scene("res://scenes/management/dungeon_manager.tscn")
			
		"Load":
			var _change_scene = get_tree().change_scene(level)
			
		"Exit":
			get_tree().quit()
