extends Node2D

@onready var death_ui = $DeathUI

var total_score := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	death_ui.visible = false
	SignalBus.on_score_gained.connect(update_score)
	SignalBus.on_player_death.connect(game_over)

func update_score(score: int):
	total_score += score
	SignalBus.on_total_score_updated.emit(total_score)
	
func game_over():
	death_ui.visible = true
	SignalBus.on_score_gained.disconnect(update_score)
