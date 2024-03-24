extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_tp.connect(_change_color)

func _change_color(_discard):
	var random_colour = Color(randf(), randf(), randf(), 1)
	modulate = random_colour
