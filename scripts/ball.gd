extends CharacterBody2D

@export var speed = 200

var motion = Vector2.ZERO

func _physics_process(delta):
	if motion == Vector2.ZERO:
		return
	var collision_info = move_and_collide(motion * speed * delta)
	if collision_info:
		if collision_info.get_collider() is Player:
			print("hit player!")
		motion = motion.bounce(collision_info.get_normal()).normalized()

func set_motion(new_motion):
	motion = new_motion.normalized()
