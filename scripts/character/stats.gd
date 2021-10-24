extends Node

signal kill

export(int) var strength
export(int) var dextery
export(int) var vitality
export(int) var agility

var health: int = 5
var max_health: int = health

var current_exp: int = 0
var current_level: int = 1
var exp_bar: Dictionary = {
	1:  10,
	2:  21,
	3:  35,
	4:  57,
	5:  83,
	6:  117,
	7:  158,
	8:  201,
	9:  263,
	10: 350,
}

onready var stats: Dictionary = {
	"str": strength,
	"dex": dextery,
	"vit": vitality,
	"agi": agility
}

func _ready() -> void:
	get_tree().call_group("Exp", "level_exp", exp_bar[current_level], 0)
	get_tree().call_group("Health", "health", health)
		
		
func update_health(value: int) -> void:
	health -= value
	get_tree().call_group("Health", "update_health", value, "Damage")
	if health <= 0:
		emit_signal("kill")
		
		
func update_exp(value: int) -> void:
	current_exp += value
	get_tree().call_group("Exp", "update_exp", value, "Exp")
	if current_exp >= exp_bar[current_level]: #level up
		var bonus_exp: int = current_exp - exp_bar[current_level]
		current_level += 1
		current_exp = 0
		current_exp = bonus_exp
		get_tree().call_group("Exp", "level_exp", exp_bar[current_level], 0)
		get_tree().call_group("Exp", "update_exp", bonus_exp, "Exp")
		on_level_up()
	
	
func on_level_up() -> void:
	randomize()
	max_health += 5
	get_tree().call_group("Health", "health", max_health)
	for key in stats.keys():
		stats[key] += randi() % 3 + 1
		
	print("Strength: " + str(stats.str))
	print("Dextery: " + str(stats.dex))
	print("Vitality: " + str(stats.vit))
	print("Agility: " + str(stats.agi))
	print("")
