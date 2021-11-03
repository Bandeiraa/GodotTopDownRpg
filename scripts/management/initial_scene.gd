extends Control

onready var container: TextureRect = get_node("MenuContainer")
onready var char_container: Control = get_node("CharSelectContainer")

var level: String

func _ready() -> void:
	var file: File = File.new()
	if file.file_exists(DataManagement.save_path):
		container.get_node("VBox/Load").disabled = false
		DataManagement.load_data()
		level = DataManagement.data_dictionary.current_game_level
		
	for button in container.get_node("VBox").get_children():
		button.connect("pressed", self, "on_button_pressed", [button.name])
		
		
func on_button_pressed(button_type: String) -> void:
	match button_type:
		"Play":
			container.hide()
			char_container.show()
			#var _change_scene = get_tree().change_scene("res://scenes/management/dungeon_manager.tscn")
			
		"Load":
			var _change_scene = get_tree().change_scene(level)
			
		"Exit":
			get_tree().quit()
