extends CharacterBody2D

var player: Node2D = null

@export var speed: int = 2
@onready var weapon_left: Weapon = $WeaponLeft
@onready var weapon_right: Weapon =  $WeaponRight
@onready var shooter_speed: Timer = $ShooterSpeed

func _ready():
	$Detection.area_entered.connect(on_area_entered)
	shooter_speed.timeout.connect(on_shooter_speed_timeout)
	
func _physics_process(_delta):
	var movement = Vector2(-2, 0)
	
	if player:
		movement = position.direction_to(player.global_position) * speed
		
	move_and_collide(movement)


func on_area_entered(area: Area2D):
	player = area

func shoot():
	shooter_speed.start()
	weapon_left.shoot()
	weapon_right.shoot()


func on_shooter_speed_timeout():
	shoot()