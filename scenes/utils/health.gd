extends Node

signal health_changed(new_health)

@export var max_health := 100
@onready var health := max_health

func take_damage(damage: int):
	var new_health := health - damage
	health = clamp(new_health, 0, max_health)
	health_changed.emit(new_health)
