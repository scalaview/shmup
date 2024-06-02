extends CharacterBody2D

const MAX_SPEED = 200
const ACCELERATION_SMOOTHING = 25
const PLAYER_WIDTH = 50
const PLAYER_HEIGHT = 60

func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide()
	var window_vector = get_tree().get_root().size
	global_position.x = clamp(global_position.x, PLAYER_WIDTH/2, window_vector.x - PLAYER_WIDTH/2)
	global_position.y = clamp(global_position.y, PLAYER_HEIGHT/2, window_vector.y - PLAYER_HEIGHT/2)
	

func get_movement_vector() -> Vector2:
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))
