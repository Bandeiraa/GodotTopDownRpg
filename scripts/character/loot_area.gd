extends Area2D

onready var parent: KinematicBody2D = get_parent()

func collect_weapon(collected_weapon: String) -> void:
	var instanced_weapon: Object = load(collected_weapon).instance()
	parent.weapon_spawner.weapon.texture = load(instanced_weapon.weapon_texture)
	parent.current_weapon = collected_weapon
