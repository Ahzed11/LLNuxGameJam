extends CharacterBody2D

@export var max_speed : float
@export var acceleration : float
@export var friction : float = 0.05

var direction: Vector2

@onready
var MIN_SPEED_VECTOR := Vector2(-max_speed, -max_speed)
@onready
var MAX_SPEED_VECTOR := Vector2(max_speed, max_speed)

func _process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

func _physics_process(delta):
	velocity = velocity.lerp(Vector2.ZERO, friction)
	velocity += direction*acceleration
	velocity = velocity.clamp(MIN_SPEED_VECTOR, MAX_SPEED_VECTOR)
	move_and_slide()
