extends Node2D

@onready
var player = %Player
var difficulty = 1
const enemy1 = preload("res://scenes/Enemies/Enemy1.tscn")
const enemy2 = preload("res://scenes/Enemies/Enemy2.tscn")

@export var enemy: PackedScene
@export var asteroid: PackedScene
var mob_path
var asteroid_path
# Called when the node enters the scene tree for the first time.
func _ready():
	mob_path = $Path2D/PathFollow2D
	SignalBus.controle_spawner.connect(controle)
	SignalBus.on_portail_tp.connect(difficulty_incr)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func controle(start:bool):
	if start :
		$Spawn_Time.start()
	else:
		$Spawn_Time.stop()
		
func difficulty_incr(_discard, counter):
	difficulty+=1

func _on_spawn_time_timeout():
	var new_enemy: Enemy 
	if difficulty%3==0 || (difficulty > 5 && difficulty%2==0):
		new_enemy = enemy2.instantiate()
		new_enemy.max_speed = 200 + 10*difficulty
		new_enemy.shoot_delay = 3.0/difficulty
		new_enemy.reload_delay= 2+1.0/difficulty
		new_enemy.max_round_amount = 4*difficulty
		new_enemy.amount_out = 1
	else:
		new_enemy = enemy1.instantiate()
		new_enemy.max_speed = 200 + 15*difficulty
	position = player.position
	mob_path.progress_ratio = randf()

	new_enemy.position = mob_path.position + position
	new_enemy.player = player

	get_parent().add_child(new_enemy)
	new_enemy.health = 1+difficulty*2
	new_enemy.damage = 1+difficulty


func _on_asteroid_timer_timeout():
	var new_asteroid = asteroid.instantiate()
	position = player.position
	mob_path.progress_ratio = randf()

	new_asteroid.position = mob_path.position + position

	get_parent().add_child(new_asteroid)
