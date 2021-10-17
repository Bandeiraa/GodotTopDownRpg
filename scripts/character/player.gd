extends KinematicBody2D

var velocity: Vector2

onready var texture: Sprite = get_node("Texture")
onready var animation: AnimationPlayer = get_node("Animation")

export(String) var character
export(int) var walk_speed

func _ready() -> void:
	texture.texture = load(character)
	
	
func _physics_process(_delta: float) -> void:
	animate()
	get_mouse_position()
	velocity = move() * walk_speed
	velocity = move_and_slide(velocity)
	
	
func animate() -> void:
	if velocity != Vector2.ZERO:
		animation.play("Run")
	else:
		animation.play("Idle")
		
		
func get_mouse_position() -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	var player_position: Vector2 = global_position
	var cursor: Vector2 = mouse_position - player_position
	if cursor.x > 0:
		texture.flip_h = false
	elif cursor.x < 0:
		texture.flip_h = true
	
	
func move() -> Vector2:
	var input_vector: Vector2 = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	return input_vector
