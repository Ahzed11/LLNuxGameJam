extends Camera2D

@export var shake_fade := 5.0

var rng = RandomNumberGenerator.new()
var shake_strength := 0.0
var player_screen_margin_x = 800
var player_screen_margin_y = 400
var acc = 0.03

@onready var start_position := position

func _ready():
	SignalBus.on_player_take_damage.connect(_apply_shake)
	SignalBus.on_portail_end_of_safe.connect(end_of_safe)
	SignalBus.on_portail_end_of_danger.connect(end_of_danger)


func _process(delta):
	if -position.x-get_viewport().size.x/2+%Player.position.x < player_screen_margin_x:
		position.x -= player_screen_margin_x-(-position.x-get_viewport().size.x/2+%Player.position.x)
		
	if 1.5*get_viewport().size.x-(-position.x+%Player.position.x) < player_screen_margin_x:
		position.x += player_screen_margin_x-(1.5*get_viewport().size.x-(-position.x+%Player.position.x))
		
	if -position.y-get_viewport().size.y/2+%Player.position.y < player_screen_margin_y:
		position.y -= player_screen_margin_y-(-position.y-get_viewport().size.y/2+%Player.position.y)
		
	if 1.5*get_viewport().size.y-(-position.y+%Player.position.y) < player_screen_margin_y:
		position.y += player_screen_margin_y-(1.5*get_viewport().size.y-(-position.y+%Player.position.y))
	
	#zoom = Vector2(1 - 0.2*%Player.velocity.length()/%Player.max_speed,1 - 0.2*%Player.velocity.length()/%Player.max_speed)
	
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		offset = _random_offset()
	
	if $Glitch.visible:
		acc += delta/10
		$Glitch.material.set_shader_parameter("shake rate",acc)

func _apply_shake(_health, amount):
	shake_strength = amount

func _random_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))

func end_of_safe():
	acc = 0.03
	$Glitch.visible = true

func end_of_danger(a:bool):
	$Glitch.visible = false
