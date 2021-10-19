extends Position2D

var can_attack: bool = true

export(float) var attack_cooldown

onready var weapon: Sprite = get_node("Weapon")
onready var timer: Timer = get_node("AttackCooldown")

func _ready() -> void:
	timer.set_wait_time(attack_cooldown)
	
	
func attachment(weapon_position: Vector2,weapon_rotation: int, is_flipped: bool) -> void:
	position = weapon_position
	rotation_degrees = weapon_rotation
	weapon.flip_h = is_flipped
	
	
func start_attack_timer() -> void:
	timer.start()
	can_attack = false
	hide()
	
	
func on_attack_cooldown() -> void:
	can_attack = true
	show()
