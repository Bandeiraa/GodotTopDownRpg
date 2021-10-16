extends Node2D

const PORTAL = preload("res://scenes/management/portal.tscn")

onready var floor_tile: TileMap = get_node("Floor")

func _ready() -> void:
	connect_signals()
	
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		var _reload = get_tree().reload_current_scene()
		
		
func connect_signals() -> void:
	var _floor = floor_tile.connect("spawn_portal", self, "spawn_portal")
	
	
func spawn_portal(spawn_position: Vector2) -> void:
	var portal: Object = PORTAL.instance()
	add_child(portal)
	portal.global_position = Vector2(spawn_position.x, spawn_position.y) * floor_tile.cell_size
