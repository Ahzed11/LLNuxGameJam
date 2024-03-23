extends CharacterBody2D

class_name Ennemy1
const run_speed = 50.0

@export var max_speed : float = 250
@export var acceleration : float = 50
@export var friction : float = 0.05
@export var damage := 20

var direction: Vector2

@onready var MIN_SPEED_VECTOR := Vector2(-max_speed, -max_speed)
@onready var MAX_SPEED_VECTOR := Vector2(max_speed, max_speed)
@onready var health := $Health

var player

func _ready():
	velocity = Vector2(run_speed,run_speed)
	health.health_changed.connect(_take_damage)

func _physics_process(delta):
	velocity = velocity.lerp(Vector2.ZERO, friction)
	direction = position.direction_to(player.position)
	rotation =  rotate_toward(rotation,direction.angle(),delta*4)
	velocity += Vector2(cos(rotation),sin(rotation))*acceleration
	velocity = velocity.clamp(MIN_SPEED_VECTOR, MAX_SPEED_VECTOR)
	
	move_and_slide()

func _take_damage(current_health, amount):
	if current_health == 0:
		queue_free()
