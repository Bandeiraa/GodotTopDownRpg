extends ParallaxBackground

onready var parallax_layer: ParallaxLayer = get_node("BgLayer")

export(int) var layer_speed: int = 0


func _process(delta: float) -> void:
	parallax_layer.motion_offset.x -= layer_speed * delta
