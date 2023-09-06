class_name Player
extends CharacterBody2D

@export var speed = 250

func _physics_process(delta):
	var motion = Vector2(Input.get_axis("move_left", "move_right") * speed * delta, 0)
	move_and_collide(motion)
