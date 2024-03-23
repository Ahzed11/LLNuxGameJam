extends Camera2D

@export var shake_fade := 5.0

var rng = RandomNumberGenerator.new()
var shake_strength := 0.0

@onready var start_position := position

func _ready():
	SignalBus.on_player_take_damage.connect(_apply_shake)

func _process(delta):
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		
		offset = _random_offset()

func _apply_shake(amount):
	shake_strength = amount

func _random_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
