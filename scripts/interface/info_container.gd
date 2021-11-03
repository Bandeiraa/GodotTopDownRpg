extends TextureRect

onready var vbox: VBoxContainer = get_node("VBox/VBox")
onready var player_name: Label = get_node("VBox/PlayerName")
onready var player_class: Label = vbox.get_node("ClassName")
onready var player_level: Label = vbox.get_node("HBox/Level")

func update_class_name(player_class_name: String) -> void:
	player_class.text = player_class_name
	
	
func update_level(level: int) -> void:
	player_level.text = "Level: " + str(level)
