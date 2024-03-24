extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(position)
	print(global_position)
	$Timer_Safe.start(0.1)
	SignalBus.on_portail_tp.emit(global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_safe_timeout():
	var player_position = %Player.position
	position = player_position + Vector2(randf_range(-500,500),randf_range(-500,500))
	SignalBus.on_portail_tp.emit(global_position)
	$Timer_dead.start()

func _on_timer_dead_timeout():
	get_tree().call_group("Character","in_portal",$Portal_Area)
	$Timer_Safe.start()
