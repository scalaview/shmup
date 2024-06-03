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
