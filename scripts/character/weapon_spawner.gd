extends Position2D

var can_attack: bool = true
var base_attack_cooldown: float 

export(float) var attack_cooldown

onready var weapon: Sprite = get_node("Weapon")
onready var timer: Timer = get_node("AttackCooldown")

func _ready() -> void:
	base_attack_cooldown = attack_cooldown
	timer.set_wait_time(attack_cooldown)
	
	
func update_attack_cooldown(value: int) -> void:
	attack_cooldown = base_attack_cooldown - (value * .01)
	timer.set_wait_time(attack_cooldown)
	
	  
func attachment(weapon_position: Vector2,weapon_rotation: int, is_flipped: bool) -> void:
	position = weapon_position
	rotation_degrees = weapon_rotation
	if weapon != null:
		weapon.flip_h = is_flipped
		
		
func start_attack_timer() -> void:
	timer.start()
	can_attack = false
	hide()
	
	
func on_attack_cooldown() -> void:
	can_attack = true
	show()
