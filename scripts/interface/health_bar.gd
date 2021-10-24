extends "res://scripts/interface/progress_bar.gd"

func health(max_value: int) -> void:
	progress_bar.max_value = max_value
	progress_bar_bg.max_value = max_value
	progress_bar.value = max_value
	progress_bar_bg.value = max_value
	
	
func update_health(value: int, type: String) -> void:
	update_bar(value, type)
