extends Control

@export var master_slider: Slider
@export var sfx_slider: Slider
@export var music_slider: Slider
@export var quit_button: Button

@onready var master_bus := AudioServer.get_bus_index("Master")
@onready var music_bus := AudioServer.get_bus_index("Music")
@onready var sfx_bus := AudioServer.get_bus_index("SFX")

func _ready():
	master_slider.value = AudioServer.get_bus_volume_db(master_bus)
	music_slider.value = AudioServer.get_bus_volume_db(music_bus)
	sfx_slider.value = AudioServer.get_bus_volume_db(sfx_bus)
	
	master_slider.value_changed.connect(
		func(value: float): AudioServer.set_bus_volume_db(master_bus, value)
	)
	
	music_slider.value_changed.connect(
		func(value: float): AudioServer.set_bus_volume_db(music_bus, value)
	)
	
	sfx_slider.value_changed.connect(
		func(value: float): AudioServer.set_bus_volume_db(sfx_bus, value)
	)
	
	quit_button.pressed.connect(
		func(): get_tree().change_scene_to_file("res://scenes/UI/MainMenu.tscn")
	)
