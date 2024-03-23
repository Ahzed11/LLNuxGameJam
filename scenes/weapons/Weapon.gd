extends Node2D

@export var shoot_delay: float = 0.2
@export var reload_delay: float = 2
@export var max_round_amount: int = 12
@export var amount_out: int = 1
@export var bullet: PackedScene

var target: Vector2 = Vector2.ZERO
var is_reloading := false

@onready var round_amount := max_round_amount
@onready var shoot_timer : Timer = $ShootTimer
@onready var reload_timer : Timer = $ReloadTimer

func _ready():
	shoot_timer.wait_time = shoot_delay
	reload_timer.wait_time = reload_delay
	
	shoot_timer.timeout.connect(_on_shoot_timer)
	reload_timer.timeout.connect(_on_reload_timer)

func _process(delta):
	if target == null:
		shoot_timer.stop()
	
	if is_reloading:
		shoot_timer.stop()
	
	if not is_reloading and round_amount > 0 and target != null and shoot_timer.is_stopped():
		shoot_timer.start()
	
func _shoot():
	var new_bullet: Bullet = bullet.instantiate()
	new_bullet.position = position
	get_tree().root.add_child(new_bullet)
	
	round_amount -= 1

func _on_shoot_timer():
	_shoot()
	print(round_amount)
	if round_amount == 0:
		shoot_timer.stop()
		reload_timer.start()
	
func _on_reload_timer():
	is_reloading = false
	round_amount = max_round_amount
	reload_timer.stop()