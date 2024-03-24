extends Sprite2D

var color = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_tp.connect(_change_color)

func _change_color(_discard, _discard2):
	set_modulate(Color.from_hsv(color, 1, 3))
	color = (color+0.6)
	color =  color-1 if color > 1 else color
