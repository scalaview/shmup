extends Node2D
class_name PlayerBullet

const SPEED = 400

@onready var hitbox_component: HitboxComponent = $HitboxComponent

func _ready():
	hitbox_component.hited.connect(on_hitbox_component_hited)

func _process(delta):
	position.x += delta * SPEED


func on_hitbox_component_hited():
	queue_free()

func is_out_of_window(target: Node2D) -> bool:
	var window_vector = get_tree().get_root().size
	return target.global_position.x < -window_vector.x || target.global_position.x > window_vector.x 
