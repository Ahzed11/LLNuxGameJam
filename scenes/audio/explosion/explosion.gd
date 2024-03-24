extends Sprite2D

@export var timer_delay := 1.0

@onready var timer := $ExplosionTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = timer_delay
	timer.timeout.connect(queue_free)
	$'GPUParticles2D'.emitting = true
