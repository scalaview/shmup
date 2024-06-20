extends Node2D
class_name EnemyBullet

const SPEED = 500

func _process(delta):
	position.x -= delta * SPEED
