extends TextureRect

onready var vbox: VBoxContainer = get_node("VBox/VBox")
onready var status_list: Array = vbox.get_children()

func update_interface(stat: String, value: int, index: int) -> void:
	vbox.get_child(index).get_children().min().text = stat + " " + str(value)
