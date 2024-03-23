extends CharacterBody2D


const run_speed = 50.0

@export var max_speed : float = 250
@export var acceleration : float = 50
@export var friction : float = 0.005

var direction: Vector2

@onready
var MIN_SPEED_VECTOR := Vector2(-max_speed, -max_speed)
@onready
var MAX_SPEED_VECTOR := Vector2(max_speed, max_speed)
@onready
var player = get_node("%Player")

func _ready():
	velocity = Vector2(run_speed,run_speed)

func _physics_process(delta):

	direction = position.direction_to(player.position)
	rotation =  rotate_toward(rotation,direction.angle(),delta*4)
	velocity += Vector2(cos(rotation),sin(rotation))*acceleration
	velocity = velocity.clamp(MIN_SPEED_VECTOR, MAX_SPEED_VECTOR)
	
	move_and_slide()
