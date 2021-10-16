extends TileMap

signal spawn_portal(x, y)

func _ready() -> void:
	randomize()
	yield(get_parent(), "ready")
	var random_cell: int = randi() % get_used_cells().size()
	var selected_tile: Vector2 = get_used_cells()[random_cell]
	set_cell(int(selected_tile.x), int(selected_tile.y), 6)
	emit_signal("spawn_portal", selected_tile)
