extends Node2D

var first_portal : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer_Tp.start(0.1)

func _on_timer_safe_timeout():
	$Timer_Danger.start()
	SignalBus.on_portail_end_of_safe.emit()

func _on_timer_danger_timeout():

	$Timer_Tp.start()
	SignalBus.on_portail_end_of_danger.emit(false)

func _on_timer_tp_timeout():
	
	var player_position = %Player.position
	position = player_position + Vector2(randf_range(-5000,5000),randf_range(-5000,5000))
	SignalBus.on_portail_tp.emit(global_position)
	$Timer_Safe.start()

func _on_portal_area_area_entered(area):
	if not $Timer_Danger.is_stopped():
		$Timer_Danger.stop()
		$Timer_Tp.start()
		SignalBus.on_portail_end_of_danger.emit(true)
		if first_portal:
			first_portal= false
			SignalBus.controle_spawner.emit(true)
