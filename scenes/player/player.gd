extends Character

func _ready():
	super()
	max_speed = 350
	friction = 0.01
	damage = 15
	SignalBus.on_portail_end_of_danger.connect(is_inside)
	SignalBus.on_player_take_damage.emit(health, 0)

func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

func take_damage(amount):
	print("Took %d damage" % amount)
	super(amount)
	SignalBus.on_player_take_damage.emit(health, amount)

func die():
	super()
	SignalBus.on_player_death.emit()
	process_mode = Node.PROCESS_MODE_DISABLED
	
func is_inside(inside: bool):
	if not inside:
		die()
