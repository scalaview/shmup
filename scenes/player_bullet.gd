extends Area2D
class_name PlayerBullet

const SPEED = 400

func _process(delta):
	position.x += delta * SPEED
