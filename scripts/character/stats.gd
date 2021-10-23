extends Node

signal kill

export(int) var strength
export(int) var dextery
export(int) var vitality
export(int) var agility

var health: int = 5

onready var stats: Dictionary = {
	"str": strength,
	"dex": dextery,
	"vit": vitality,
	"agi": agility
}

func _process(_delta):
	if Input.is_action_just_pressed("Attack"):
		on_level_up()
	pass
	
	
func update_health(value: int) -> void:
	health -= value
	if health <= 0:
		emit_signal("kill")
		
		
func on_level_up() -> void:
	randomize()
	for key in stats.keys():
		stats[key] += randi() % 3 + 1
		
	print("Strength: " + str(stats.str))
	print("Dextery: " + str(stats.dex))
	print("Vitality: " + str(stats.vit))
	print("Agility: " + str(stats.agi))
	print("")
