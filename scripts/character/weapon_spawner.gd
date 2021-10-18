extends Position2D

onready var weapon: Sprite = get_node("Weapon")

func attachment(weapon_position: Vector2,weapon_rotation: int, is_flipped: bool) -> void:
	position = weapon_position
	rotation_degrees = weapon_rotation
	weapon.flip_h = is_flipped
