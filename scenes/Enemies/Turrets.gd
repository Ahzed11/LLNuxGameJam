extends Node2D

var children: Array[Node]
# Called when the node enters the scene tree for the first time.
func _ready():
	children = find_children("*", "Turret", false)

	var weapon_children = find_children("*", "Weapon", true)
	for child in weapon_children:
		child.owner_ = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var positionPlayer: Vector2 = get_parent().player.position
	for child in children:
		child.target = positionPlayer
	var weapon_children = find_children("*", "Weapon", true)
	for child in weapon_children:
		child.shoot_delay = get_parent().shoot_delay
		child.reload_delay = get_parent().reload_delay
		child.max_round_amount = get_parent().max_round_amount
		child.amount_out = get_parent().amount_out
