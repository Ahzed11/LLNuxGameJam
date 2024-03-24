extends Enemy

class_name Enemy2

@export var shoot_delay: float = 1.0
@export var reload_delay: float = 2.0
@export var max_round_amount: int = 6
@export var amount_out: int = 1

func _ready():
	super()
	velocity = Vector2(0,0)
	max_speed = 250
	acceleration = 50
	friction = 0.05
	damage = 5
	health = 5
	score_points_on_death = 100
