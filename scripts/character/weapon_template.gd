extends Area2D

const EFFECT = preload("res://scenes/effects/hit_effect.tscn")

var direction: Vector2 = Vector2.ZERO
var base_damage: int

export(String) var weapon_texture
export(float) var lifetime
export(int) var rotation_speed
export(int) var speed
export(int) var damage

onready var timer: Timer = get_node("Timer")
onready var animation: AnimationPlayer = get_node("Animation")

func _ready() -> void:
	base_damage = damage
	timer.set_wait_time(lifetime)
	timer.start()
	
	
func _physics_process(_delta: float) -> void:
	rotation_degrees += rotation_speed
	translate(direction * speed)
	
	
func update_damage(strength: int) -> void:
	yield(self, "ready")
	print("")
	print("Base Damage: " + str(base_damage))
	print("Strength: " + str(strength))
	damage = base_damage + strength
	print("Weapon Total Damage: " + str(damage))
	
	
func on_body_entered(_body: Object) -> void:
	var effect: Object = EFFECT.instance()
	effect.global_position = global_position
	get_tree().root.call_deferred("add_child", effect)
	queue_free()
	
	
func on_timer_timeout() -> void:
	animation.play("Fade")
	set_physics_process(false)
	
