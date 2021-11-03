extends Control

export(Dictionary) var char_stats
export(Array, Array, String) var char_list
export(Array, String) var char_name

onready var bg: TextureRect = get_node("Background")
onready var male_sprite: Sprite = get_node("MaleCharacter")
onready var female_sprite: Sprite = get_node("FemaleCharacter")
onready var char_label: Label = bg.get_node("ClassName")

var index: int = 0
var dictionary: Dictionary

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("Button"):
		button.connect("pressed", self, "on_button_pressed", [button])
		
	update_visible_char()
	
	
func _process(_delta: float) -> void:
	if index == 0:
		bg.get_node("Left").disabled = true
	elif index == char_name.size() - 1:
		bg.get_node("Right").disabled = true
	else:
		bg.get_node("Left").disabled = false
		bg.get_node("Right").disabled = false
		
		
func on_button_pressed(button_type: Object) -> void:
	match button_type.name:
		"Left":
			if index > 0:
				index -= 1
				
		"Right":
			if index < char_name.size() - 1:
				index += 1
				
		"Male":
			
			send_data(char_list[index].max())
			
		"Female":
			send_data(char_list[index].min())
			
	update_visible_char()
				
				
func update_visible_char() -> void:
	var stats_index: int = 0
	var current_character: String = char_stats.keys()[index]
	female_sprite.texture = load(char_list[index].min())
	male_sprite.texture = load(char_list[index].max())
	char_label.text = char_name[index]
	
	for key in char_stats[current_character].keys():
		stats_index += 1
		bg.get_node("HBox/Stat" + str(stats_index)).text = key + "\n" + str(char_stats[current_character][key])
		
		
func send_data(image_path: String) -> void:
	remove_previous_data()
	var current_character: String = char_stats.keys()[index]
	for key in char_stats[current_character].keys():
		DataManagement.data_dictionary.stats_dict[key] = char_stats[current_character][key]
		
	DataManagement.data_dictionary.player_class = char_name[index]
	DataManagement.data_dictionary.player_image_path = image_path
	DataManagement.save_data()
	
	var _change_scene = get_tree().change_scene("res://scenes/management/dungeon_manager.tscn")
	
	
func remove_previous_data() -> void:
	DataManagement.data_dictionary.current_exp = 0
	DataManagement.data_dictionary.current_level = 1
	DataManagement.data_dictionary.current_game_level = "res://scenes/management/dungeon_manager.tscn"
	DataManagement.save_data()
