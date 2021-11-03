extends CanvasLayer

onready var container: TextureRect = get_node("Container")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("show_interface"):
		container.visible = !container.visible
