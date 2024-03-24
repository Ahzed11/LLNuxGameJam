extends Node2D
const dist_from_center_of_rotation = 100
var spawn_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_tp.connect(_on_portail_tp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(spawn_position)
	position = Vector2.from_angle((spawn_position-global_position).angle()-get_parent().global_rotation)*dist_from_center_of_rotation
	if global_position.distance_to(spawn_position) < dist_from_center_of_rotation*2:
		visible = false
	else:
		visible = true

func _on_portail_tp(positionTp: Vector2):
	spawn_position = positionTp
