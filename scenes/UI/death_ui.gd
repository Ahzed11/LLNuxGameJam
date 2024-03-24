extends CanvasLayer

@export var replay_btn: Button
@export var main_menu_btn: Button
@export var quit_btn: Button

@onready var main_menu = "res://scenes/UI/MainMenu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	replay_btn.pressed.connect(func(): get_tree().reload_current_scene() )
	main_menu_btn.pressed.connect(func(): get_tree().change_scene_to_file(main_menu))
	quit_btn.pressed.connect(func(): get_tree().quit(0))
