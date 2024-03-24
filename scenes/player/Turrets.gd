extends Node2D

var children: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	children = find_children("*", "Turret", false)

	var weapon_children = find_children("*", "Weapon", true)
	for child in weapon_children:
		print(child)
		child.owner_ = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var position := get_global_mouse_position()
	for child in children:
		child.target = position
