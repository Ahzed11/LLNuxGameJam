extends Node2D

@onready
var player = %Player

@export var enemy: PackedScene
@export var asteroid: PackedScene
var mob_path
var asteroid_path
# Called when the node enters the scene tree for the first time.
func _ready():
	
	mob_path = $Path2D/PathFollow2D
	SignalBus.controle_spawner.connect(controle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func controle(start:bool):
	if start :
		$Spawn_Time.start()
	else:
		$Spawn_Time.stop()

func _on_spawn_time_timeout():
	var new_enemy: Enemy = enemy.instantiate()
	position = player.position
	mob_path.progress_ratio = randf()

	new_enemy.position = mob_path.position + position
	new_enemy.player = player

	get_parent().add_child(new_enemy)


func _on_asteroid_timer_timeout():
	var new_asteroid = asteroid.instantiate()
	position = player.position
	mob_path.progress_ratio = randf()

	new_asteroid.position = mob_path.position + position

	get_parent().add_child(new_asteroid)
