extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_end_of_danger.connect(go_die)

func go_die(_trash):
	queue_free()
