extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_portail_end_of_danger.connect(go_die)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func go_die(_trash):
	queue_free()
