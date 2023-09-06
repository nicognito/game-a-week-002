extends Node2D

@onready var player = $Player
@onready var ball = $Ball

var is_start = false
var default_ball_motion = Vector2(0, -40)

func _ready():
	is_start = false
	pass

func _process(delta):
	if not is_start:
		ball.global_position.x = player.global_position.x
		if Input.is_action_just_pressed("fire"):
			is_start = true
			ball.set_motion(default_ball_motion)
