extends "res://scripts/interface/progress_bar.gd"

func level_exp(exp_level: int, current_value: int) -> void:
	progress_bar.value = current_value
	progress_bar_bg.value = current_value
	progress_bar.max_value = exp_level
	progress_bar_bg.max_value = exp_level
	
	
func update_exp(value: int, type: String) -> void:
	update_bar(value, type)
