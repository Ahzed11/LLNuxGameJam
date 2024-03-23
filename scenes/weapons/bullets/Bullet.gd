extends RigidBody2D
class_name Bullet

@export var lifetime := 0.2
@export var speed := 120

@onready var bullet_timer: Timer = $BulletTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_timer.wait_time = lifetime
	bullet_timer.timeout.connect(_on_timeout)
	constant_force = speed * transform.x

func _on_timeout():
	queue_free()
