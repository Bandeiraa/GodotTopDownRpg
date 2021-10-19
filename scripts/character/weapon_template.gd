extends Area2D

const EFFECT = preload("res://scenes/effects/hit_effect.tscn")

var direction: Vector2 = Vector2.ZERO

export(String) var weapon_texture
export(float) var lifetime
export(int) var rotation_speed
export(int) var speed
export(int) var damage

onready var timer: Timer = get_node("Timer")
onready var animation: AnimationPlayer = get_node("Animation")

func _ready() -> void:
	timer.set_wait_time(lifetime)
	timer.start()
	
	
func _physics_process(_delta: float) -> void:
	rotation_degrees += rotation_speed
	translate(direction * speed)
	
	
func on_body_entered(_body: Object) -> void:
	var effect: Object = EFFECT.instance()
	effect.global_position = global_position
	get_tree().root.call_deferred("add_child", effect)
	queue_free()
	
	
func on_timer_timeout() -> void:
	animation.play("Fade")
	set_physics_process(false)
	
