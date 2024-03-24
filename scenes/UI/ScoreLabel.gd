extends Label

func _ready():
	SignalBus.on_total_score_updated.connect(update_text)

func update_text(score:int):
	text = "Score %d" % [score]
