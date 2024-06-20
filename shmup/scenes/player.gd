extends CharacterBody2D

const MAX_SPEED = 200
const ACCELERATION_SMOOTHING = 25
const PLAYER_WIDTH = 50
const PLAYER_HEIGHT = 60

@export var bullet_scene: PackedScene
@export var wait_time: float = 0.5

@onready var weapon_left: Weapon = $WeaponLeft
@onready var weapon_right: Weapon =  $WeaponRight
@onready var shooter_speed: Timer = $ShooterSpeed

var can_shoot = false

func _ready():
	shooter_speed.timeout.connect(on_shooter_speed_timeout)
	shooter_speed.wait_time = wait_time

func _physics_process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide()
	var window_vector = get_tree().get_root().size
	global_position.x = clamp(global_position.x, PLAYER_WIDTH/2, window_vector.x - PLAYER_WIDTH/2)
	global_position.y = clamp(global_position.y, PLAYER_HEIGHT/2, window_vector.y - PLAYER_HEIGHT/2)
	
func _process(_delta):
	if Input.get_action_strength("shoot") && can_shoot:
		shoot()

func get_movement_vector() -> Vector2:
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))

func shoot():
	can_shoot = false
	shooter_speed.start()
	weapon_left.shoot()
	weapon_right.shoot()


func on_shooter_speed_timeout():
	can_shoot = true
