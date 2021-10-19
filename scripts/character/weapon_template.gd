extends Area2D

var direction: Vector2 = Vector2.ZERO

export(float) var lifetime
export(int) var rotation_speed
export(int) var speed

onready var timer: Timer = get_node("Timer")
onready var animation: AnimationPlayer = get_node("Animation")

func _ready() -> void:
	timer.set_wait_time(lifetime)
	timer.start()
	
	
func _physics_process(_delta: float) -> void:
	rotation_degrees += rotation_speed
	translate(direction * speed)
	
	
func on_body_entered(_body: Object) -> void:
	queue_free()
	
	
func on_timer_timeout() -> void:
	animation.play("Fade")
	set_physics_process(false)
