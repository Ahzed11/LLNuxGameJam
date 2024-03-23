extends Node2D
class_name Turret

var target: Vector2 = Vector2(0,0)

func _process(delta):
	look_at(target)
	#rotate(PI/-2)
