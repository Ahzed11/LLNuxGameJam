extends Node2D

var total_score := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_score_gained.connect(update_score)

func update_score(score: int):
	total_score += score
	SignalBus.on_total_score_updated.emit(total_score)
