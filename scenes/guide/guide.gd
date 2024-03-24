extends Node2D

var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_tp.connect(_on_portail_tp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(direction)

func _on_portail_tp(position: Vector2):
	direction = position
