extends Control

onready var bar_background: TextureRect = get_node("BarBackground")
onready var progress_bar: TextureProgress = bar_background.get_node("ProgressBar")
onready var progress_bar_bg: TextureProgress = bar_background.get_node("ProgressBarBackground")
onready var tween: Tween = get_node("Tween")

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
