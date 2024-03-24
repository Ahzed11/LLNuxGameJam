extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer_dead.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_safe_timeout():
	var player_position = %Player.position
	position = player_position + Vector2(randf_range(-5000,5000),randf_range(-5000,5000))
	SignalBus.on_portail_tp.emit(position)

func _on_timer_dead_timeout():
	$Timer_Safe.start()
