extends CharacterBody2D

@export var max_speed : float = 250
@export var acceleration : float = 50
@export var friction : float = 0.05
@export var invicibility_delay: float = 1.0

var direction: Vector2 

@onready var health: Health = $Health

func _ready():
	health.health_changed.connect(_take_damage)
	health.take_damage(0)

func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	if Input.is_key_pressed(KEY_K):
		SignalBus.on_player_take_damage.emit(40)


func _physics_process(_delta):
	velocity = velocity.lerp(Vector2.ZERO, friction)
	velocity += direction*acceleration
	velocity = velocity.limit_length(max_speed)
	rotation = velocity.angle()
	move_and_slide()
	
	for i in get_slide_collision_count():
		var slide_collision = get_slide_collision(i)
		var collider = slide_collision.get_collider()
		
		if collider.damage != null:
			health.take_damage(collider.damage)
		
		if collider.health != null:
			collider.health.die()

func _take_damage(current_health, amount):
	SignalBus.on_player_take_damage.emit(current_health, amount)
	
	if current_health == 0:
		get_tree().paused = true
