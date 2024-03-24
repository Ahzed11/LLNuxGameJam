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
	if collider.get("owner_bullet") != self || collider.get("owner_bullet") == null:
		if collider.get("damage") != null:
			take_damage(collider.damage)
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
	if health <= 0:
		die()

func die():
	print("%s died!" % to_string())

func in_portal(Portal_Area : Area2D):
	if not area.overlaps_area(Portal_Area):
		die()
