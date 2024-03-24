extends Enemy

class_name Enemy2

@export var shoot_delay: float
@export var reload_delay: float
@export var max_round_amount: int
@export var amount_out: int

func _ready():
	super()
	velocity = Vector2(0,0)
	max_speed = 250
	acceleration = 50
	friction = 0.05
	score_points_on_death = 100
