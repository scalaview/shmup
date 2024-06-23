extends TileMap


func _process(delta):
	global_position.x -= 40 * delta
