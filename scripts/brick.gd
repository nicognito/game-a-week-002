class_name Brick
extends StaticBody2D

var life = 1

func _init():
	add_to_group("bricks")

func take_damage():
	life -= 1
	if not life:
		queue_free()
