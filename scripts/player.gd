class_name Player
extends CharacterBody2D

@export var speed = 250

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var is_active = false:
	set(value):
		is_active = value


func _physics_process(delta):
	if not is_active:
		return
	var motion = Vector2(Input.get_axis("move_left", "move_right") * speed * delta, 0)
	move_and_collide(motion)


func get_collision_shape_width():
	return collision_shape.get_shape().get_rect().size.x
