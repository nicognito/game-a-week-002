extends CharacterBody2D

signal lost

@export var speed = 250

var motion = Vector2.ZERO
var player_max_bouncing_angle = 7 * PI / 16
var is_active = false :
	set(value):
		is_active = value

func _physics_process(delta):
	if not is_active:
		return
	if motion == Vector2.ZERO:
		return
	var collision_info = move_and_collide(motion * speed * delta)
	if collision_info:
		var normal = collision_info.get_normal()
		var collider = collision_info.get_collider()
		if collider is Player and normal == Vector2(0, -1):
			var angle_ratio = (collision_info.get_position().x - collider.global_position.x) * 2 / collider.get_collision_shape_width()
			motion = normal.rotated(player_max_bouncing_angle * angle_ratio)
		else:
			if collider is Brick:
				collider.take_damage()
			motion = motion.bounce(normal)

func set_motion(new_motion):
	motion = new_motion.normalized()


func _on_visible_on_screen_notifier_2d_screen_exited():
	lost.emit()
