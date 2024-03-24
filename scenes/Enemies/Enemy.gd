extends Character

class_name Enemy
const run_speed = 50.0
@onready var explosion := preload("res://scenes/audio/explosion/explosion.tscn")
var player
var score_points_on_death = 50

func _ready():
	super()
	velocity = Vector2(0,0)
	max_speed = 250
	acceleration = 50
	friction = 0.05
	damage = 20
	health = 5
	SignalBus.on_portail_end_of_danger.connect(go_die)

func _physics_process(delta):
	direction = position.direction_to(player.position)
	super(delta)

func die():
	super()
	var explosion_instance = explosion.instantiate()
	explosion_instance.position = global_position
	get_tree().root.add_child(explosion_instance)
	SignalBus.on_score_gained.emit(score_points_on_death)
	queue_free()

func go_die(a:bool):
	die()
