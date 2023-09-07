class_name Brick
extends StaticBody2D

var life = 1

func take_damage():
	life -= 1
	if not life:
		queue_free()
