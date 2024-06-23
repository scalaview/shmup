extends CharacterBody2D

var player: Node2D = null

@export var speed: int = 2
@export var wait_time: float = 1.5
@export var explosion_scenes: PackedScene
@onready var weapon_left: Weapon = $WeaponLeft
@onready var weapon_right: Weapon =  $WeaponRight
@onready var shooter_speed: Timer = $ShooterSpeed
@onready var health_component: HealthComponent = $HealthComponent
func _ready():
	$Detection.area_entered.connect(on_detection_area_entered)
	health_component.died.connect(on_died)
	shooter_speed.timeout.connect(on_shooter_speed_timeout)
	shooter_speed.wait_time = wait_time
	
func _physics_process(_delta):
	if is_out_of_window(self):
		queue_free()
		return
		
	var movement = Vector2(-2, 0)
	if player != null:
		movement.y = (position.direction_to(player.global_position) * speed).y
		
	move_and_collide(movement)


func on_detection_area_entered(area: Area2D):
	player = area
	is_on_ceiling()
func shoot():
	shooter_speed.start()
	weapon_left.shoot()
	weapon_right.shoot()


func on_shooter_speed_timeout():
	if is_out_of_window(self):
		return
	shoot()


func on_died() -> void:
	if is_queued_for_deletion():
		return
	var explosion = explosion_scenes.instantiate() as Node2D
	get_parent().add_child(explosion)
	explosion.global_position = global_position
	GameStatsInstance.emit_score_changed_signal(1)


func is_out_of_window(target: Node2D) -> bool:
	var window_vector = get_tree().get_root().size
	return target.global_position.x < -window_vector.x || target.global_position.x > window_vector.x 

