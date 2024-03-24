extends Control

@onready var play_button := $AspectRatioContainer/Vertical/Play
@onready var settings_button := $AspectRatioContainer/Vertical/Settings
@onready var quit_button := $AspectRatioContainer/Vertical/Quit
var main_level: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	main_level = preload("res://scenes/main_level.tscn")
	
	play_button.pressed.connect(play)
	settings_button.pressed.connect(settings)
	quit_button.pressed.connect(quit)

func play():
	get_tree().change_scene_to_packed(main_level)

func settings():
	get_tree().change_scene_to_file("res://scenes/UI/AudioMenu.tscn")

func quit():
	get_tree().quit(0)
