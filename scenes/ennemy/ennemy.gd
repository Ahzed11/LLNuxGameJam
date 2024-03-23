extends CharacterBody2D


const run_speed = 50.0
var player

func _ready():
	player = get_node("%Player")

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position).normalized() * run_speed
	move_and_slide()
	
