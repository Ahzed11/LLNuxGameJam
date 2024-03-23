extends CharacterBody2D


const run_speed = 50.0

@export var max_speed : float = 300
@export var acceleration : float = 100
@export var friction : float = 0.005

var direction: Vector2

@onready
var MIN_SPEED_VECTOR := Vector2(-max_speed, -max_speed)
@onready
var MAX_SPEED_VECTOR := Vector2(max_speed, max_speed)
@onready
var player = get_node("%Player")

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	direction = position.direction_to(player.position)
	print(direction)
	if direction == Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	else:
		velocity += direction * acceleration
	
	velocity = velocity.clamp(MIN_SPEED_VECTOR, MAX_SPEED_VECTOR)
	move_and_slide()
