extends Character

class_name Enemy
const run_speed = 50.0
@onready var explosion := preload("res://scenes/audio/explosion/explosion.tscn")

func _ready():
	super()
	velocity = Vector2(0,0)
	max_speed = 250
	acceleration = 50
	friction = 0.05
	damage = 20
	health = 5

func _physics_process(delta):
	direction = position.direction_to(get_parent().get_node('Player').position)
	super(delta)

func take_damage(amount):
	super(amount)
	if health <= 0:
		var explosion_instance = explosion.instantiate()
		explosion_instance.position = global_position
		get_tree().root.add_child(explosion_instance)
		queue_free()
