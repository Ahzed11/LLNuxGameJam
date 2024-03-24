extends Character

func _ready():
	super()
	max_speed = 350
	friction = 0.01

func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	if Input.is_key_pressed(KEY_K):
		SignalBus.on_player_take_damage.emit(40)
	
func take_damage(amount):
	super(amount)
	SignalBus.on_player_take_damage.emit(amount)

func die():
	super()
	get_tree().paused = true
