extends Node2D

@export var ennemy1: PackedScene

var time = 0;
var loc
# Called when the node enters the scene tree for the first time.
func _ready():
	loc = $mobPaths/mobPathsloc

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	print(time)
	if time > 1:
		
		var new_ennemy1: Ennemy1 = ennemy1.instantiate()
		new_ennemy1.player = get_node("%Player")
		new_ennemy1.position = loc.position
		
		time = 0
		loc.progress_ratio = randf()
		


		add_child(new_ennemy1)
