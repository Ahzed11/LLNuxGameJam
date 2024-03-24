extends AudioStreamPlayer2D

func _ready():
	var my_stream = preload("res://scenes/audio/MusicPlayerStream.tres")
	stream = my_stream
	bus = "Music"
	play()
