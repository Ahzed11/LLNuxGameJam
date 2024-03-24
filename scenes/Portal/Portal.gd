extends Node2D

var first_portal : bool = true
var tp_counter = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer_Tp.start(0.1)
	
func _process(delta):
	if not $Timer_Danger.is_stopped() and $Portal_Area.has_overlapping_areas():
		_on_portal_area_area_entered(Vector2.ZERO)
		

func _on_timer_safe_timeout():
	$Timer_Danger.start()
	SignalBus.on_portail_end_of_safe.emit()

func _on_timer_danger_timeout():

	$Timer_Tp.start()
	SignalBus.on_portail_end_of_danger.emit(false)

func _on_timer_tp_timeout():
	tp_counter+=1
	var player_position = %Player.position
	position = player_position + Vector2(randf_range(-3000,3000),randf_range(-3000,3000))
	SignalBus.on_portail_tp.emit(global_position, tp_counter)
	$Timer_Safe.start()

func _on_portal_area_area_entered(_area):
	if not $Timer_Danger.is_stopped():
		$Timer_Danger.stop()
		$Timer_Tp.start()
		SignalBus.on_portail_end_of_danger.emit(true)
		if first_portal:
			first_portal= false
			SignalBus.controle_spawner.emit(true)
