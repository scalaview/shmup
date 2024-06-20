extends Node2D

class_name Weapon

@export var bullet_scene: PackedScene

@onready var spawn: Marker2D = $Spawn
@onready var muzzle_flash: AnimationPlayer = $MuzzleFlash

func shoot():
	var bullet = bullet_scene.instantiate() as Node2D
	bullet.position = spawn.global_position
	muzzle_flash.play("muzzle_flash")
	get_tree().get_first_node_in_group("foreground_layer").add_child(bullet)
	
