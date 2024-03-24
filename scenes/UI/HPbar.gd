extends HBoxContainer

@onready var life_icon := preload("res://scenes/UI/life_icon.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_player_take_damage.connect(update_ui)


func update_ui(current_health, _discard):
	var children = get_children()
	for child in children:
		child.queue_free()
	
	for e in range(current_health):
		var icon = life_icon.instantiate()
		add_child(icon)
