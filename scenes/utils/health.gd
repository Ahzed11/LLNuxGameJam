extends Node
class_name Health

signal health_changed(new_health, delta)

@export var max_health := 100
@onready var health := max_health

func take_damage(damage: int):
	var new_health := health - damage
	health = clamp(new_health, 0, max_health)
	health_changed.emit(new_health, damage)

func die():
	var previous_health := health
	health = 0
	health_changed.emit(health, previous_health) 
