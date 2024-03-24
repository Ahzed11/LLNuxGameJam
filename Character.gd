extends CharacterBody2D

class_name Character

var max_speed : float = 250
var acceleration : float = 50
var friction : float = 0.05
@export var invicibility_delay: float = 1.0
@export var damage = 5

var direction: Vector2 

@export var health = 20
@onready var area: Area2D = $Area2D


func _ready():
	area.monitoring = true
	area.body_entered.connect(process_body_interaction)
	
func process_body_interaction(collider: Node2D):
	print(self)
	print(collider.get("owner_bullet"))
	if collider.get("owner_bullet") != self || collider.get("owner_bullet") == null:
		if collider.get("damage") != null:
			take_damage(collider.damage)
		if collider.get("health") != null:
			print("%s died!" % get_class())
		if collider.get("owner_bullet"):
			collider.queue_free()

func _physics_process(_delta):
	velocity = velocity.lerp(Vector2.ZERO, friction)
	velocity += direction*acceleration
	velocity = velocity.limit_length(max_speed)
	rotation = velocity.angle()
	move_and_slide()

func take_damage(amount):
	health -= amount
