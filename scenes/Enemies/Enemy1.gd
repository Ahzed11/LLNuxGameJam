extends Enemy

class_name Enemy1

func _ready():
	super()
	velocity = Vector2(0,0)
	max_speed = 250
	acceleration = 50
	friction = 0.05
	damage = 20
	health = 5
