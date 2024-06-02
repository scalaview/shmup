extends Node2D
class_name HealthComponent

signal health_changed
signal died

@export var max_health: float = 1

var current_health: float = 0

func _ready():
	current_health = max_health
	

func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0)
	health_changed.emit()
	Callable(check_death).call_deferred()


func check_death():
	if current_health == 0 :
		died.emit()
		owner.queue_free()
