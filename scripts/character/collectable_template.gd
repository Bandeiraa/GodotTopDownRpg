extends Area2D

const EFFECT = preload("res://scenes/effects/death_effect.tscn")

export(String) var weapon_path

func on_area_entered(area):
	var effect: Object = EFFECT.instance()
	get_tree().root.call_deferred("add_child", effect)
	effect.global_position = global_position
	area.collect_weapon(weapon_path)
	queue_free()
