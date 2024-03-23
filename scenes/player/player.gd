extends CharacterBody2D

@export var max_speed : float = 250
@export var acceleration : float = 50
@export var friction : float = 0.05

var direction: Vector2 

@onready var MIN_SPEED_VECTOR := Vector2(-max_speed, -max_speed)
@onready var MAX_SPEED_VECTOR := Vector2(max_speed, max_speed)
@onready var health : Health = $Health

func _ready():
	health.health_changed.connect(_take_damage)

func _process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

func _physics_process(delta):
	velocity = velocity.lerp(Vector2.ZERO, friction)
	velocity += direction*acceleration
	velocity = velocity.clamp(MIN_SPEED_VECTOR, MAX_SPEED_VECTOR)
	rotation = velocity.angle()
	move_and_slide()

func _take_damage(_a, amount):
	SignalBus.on_player_take_damage.emit(amount)
