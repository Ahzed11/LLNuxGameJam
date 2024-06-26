extends Node2D

class_name Weapon

@export var shoot_delay: float = 0.2
@export var reload_delay: float = 2
@export var max_round_amount: int = 12
@export var amount_out: int = 1
@export var bullet: PackedScene
var owner_: Character

var target: Vector2 = Vector2.ZERO
var can_shoot := false
var is_reloading := false

@onready var round_amount := max_round_amount
@onready var shoot_timer: Timer = $ShootTimer
@onready var reload_timer: Timer = $ReloadTimer
@onready var weapon_audio := $WeaponShootAudio
@onready var reload_audio := $WeaponReloadAudio
@onready var weapon_visible := $WeaponVisible

func _ready():
	
	shoot_timer.timeout.connect(_on_shoot_timer)
	reload_timer.timeout.connect(_on_reload_timer)
	weapon_visible.screen_exited.connect(func(): can_shoot = false; print(self))
	weapon_visible.screen_entered.connect(func(): can_shoot = true; print(self))

func _process(delta):
	shoot_timer.wait_time = shoot_delay
	reload_timer.wait_time = reload_delay
	if target == null:
		shoot_timer.stop()
	
	if is_reloading or not can_shoot:
		shoot_timer.stop()
	
	if not is_reloading and round_amount > 0 and target != null and shoot_timer.is_stopped():
		shoot_timer.start()
	
func _shoot():
	weapon_audio.play()
	
	var new_bullet: Bullet = bullet.instantiate()
	new_bullet.owner_bullet = owner_
	new_bullet.linear_velocity = owner_.velocity
	new_bullet.position = global_position
	new_bullet.rotation = global_rotation
	get_tree().root.add_child(new_bullet)
	
	round_amount -= 1

func _on_shoot_timer():
	_shoot()
	if round_amount == 0:
		_reload()

func _reload():
	shoot_timer.stop()
	reload_timer.start()
	reload_audio.play()

func _on_reload_timer():
	is_reloading = false
	round_amount = max_round_amount
	reload_timer.stop()
