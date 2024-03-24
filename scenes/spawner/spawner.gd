extends Node2D

@onready
var player = %Player

@export var ennemy: PackedScene
var mob_path
# Called when the node enters the scene tree for the first time.
func _ready():
	$Spawn_Time.start()
	mob_path = $Path2D/PathFollow2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_time_timeout():
	var new_ennemy: Enemy = ennemy.instantiate()
	position = player.position
	mob_path.progress_ratio = randf()

	new_ennemy.position = mob_path.position + position
	new_ennemy.player = player

	get_parent().add_child(new_ennemy)
