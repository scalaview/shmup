extends Node
class_name EnemyManager

@export var enemy_scene: PackedScene
@export_range(0.3, 2.0) var wait_time: float = 1
@onready var timer: Timer = $Timer
var rng = RandomNumberGenerator.new()

func _ready():
	timer.timeout.connect(on_timer_timeout)
	timer.wait_time = wait_time

func get_spawn_position(_player: Node2D) -> Vector2:
	var window_vector = get_tree().get_root().size
	var y_point = rng.randi_range(50, window_vector.y)
	return Vector2(window_vector.x + 5, y_point)


func on_timer_timeout():
	timer.start()
	var player = get_tree().get_first_node_in_group("player_layer") as Node2D
	if player == null:
		return
		
	var enemy = enemy_scene.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	entities_layer.add_child(enemy)
	enemy.global_position = get_spawn_position(player)
	
