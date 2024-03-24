extends Node2D
const dist_from_center_of_rotation = 100
var spawn_position = Vector2.ZERO

var go_fast = false
var time : float = 1.0
var acc : float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_tp.connect(_on_portail_tp)
	SignalBus.on_portail_end_of_safe.connect(need_to_go_fast)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(spawn_position)
	position = Vector2.from_angle((spawn_position-global_position).angle()-get_parent().global_rotation)*dist_from_center_of_rotation
	if global_position.distance_to(spawn_position) < dist_from_center_of_rotation*2:
		visible = false
	else:
		visible = true
	
	if go_fast:
		$Sprite2D.scale = Vector2(1,1)
		acc += _delta
		if acc > time:
			time -= _delta*2
			acc = 0
		elif acc > time/2 :
			$Sprite2D.modulate = Color(255, 255, 255, 1)

		else:
			$Sprite2D.modulate = Color(255, 0, 0, 1)


func _on_portail_tp(positionTp: Vector2, _discard):
	spawn_position = positionTp
	$Sprite2D.modulate = Color(255, 255, 255, 1)
	$Sprite2D.scale = Vector2(0.5,0.5)
	go_fast = false

func need_to_go_fast():
	time = 1.0
	go_fast = true
	$Sprite2D.modulate = Color(255, 0, 0, 1)
