extends Node2D
class_name EnemyBullet

const SPEED = 500

func _process(delta):
	if is_out_of_window(self):
		queue_free()
		return
	position.x -= delta * SPEED


func is_out_of_window(target: Node2D) -> bool:
	var window_vector = get_tree().get_root().size
	return target.global_position.x < -window_vector.x || target.global_position.x > window_vector.x 
