extends Character

class_name Enemy

var player

func _ready():
	super()
	velocity = Vector2(0,0)
	max_speed = 250
	acceleration = 50
	friction = 0.05
	damage = 20
	health = 5

func _physics_process(delta):
	direction = position.direction_to(player.position)
	super(delta)

func take_damage(amount):
	super(amount)
	if health <= 0:
		queue_free()
