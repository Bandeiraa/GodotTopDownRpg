extends Control

onready var bar_background: TextureRect = get_node("BarBackground")
onready var progress_bar: TextureProgress = bar_background.get_node("ProgressBar")
onready var progress_bar_bg: TextureProgress = bar_background.get_node("ProgressBarBackground")
onready var tween: Tween = get_node("Tween")

export(int) var max_value
export(String) var bar_type

func _ready() -> void:
	progress_bar.max_value = max_value
	progress_bar_bg.max_value = max_value
	match bar_type:
		"Health":
			progress_bar.value = max_value
			progress_bar_bg.value = max_value
			
		"Exp":
			progress_bar.value = 0
			progress_bar_bg.value = 0
			
			
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		update_bar(5, "Damage")
		
		
func update_bar(value: int, type: String) -> void:
	match type:
		"Heal":
			interpolate_tween(value, progress_bar_bg, progress_bar)
			
		"Damage":
			interpolate_tween(-value, progress_bar, progress_bar_bg)
			
		"Exp":
			interpolate_tween(value, progress_bar_bg, progress_bar)
			
			
func interpolate_tween(value: int, initial: TextureProgress, final: TextureProgress) -> void:
	var _initial = tween.interpolate_property(
		initial, 
		"value", 
		initial.value, 
		initial.value + value,
		0.3,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	
	var _final = tween.interpolate_property(
		final, 
		"value", 
		final.value, 
		final.value + value,
		0.3,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		0.3
	)
	
	var _start = tween.start()
