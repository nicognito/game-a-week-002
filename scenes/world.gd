extends Node2D

@onready var player = $Player
@onready var ball = $Ball
@onready var player_respawn = $PlayerRespawnLocation
@onready var ball_respawn = $BallRespawnLocation

var is_start = true
var default_ball_motion = Vector2(10, -50)

func _ready():
	is_start = true
	pass


func _process(delta):
	if is_start:
		ball.global_position.x = player.global_position.x
		if Input.is_action_just_pressed("fire"):
			is_start = false
			ball.set_motion(default_ball_motion)


func _on_ball_lost():
	await get_tree().create_timer(1.5).timeout
	is_start = true
	ball.set_motion(Vector2.ZERO)
	player.global_position = player_respawn.global_position
	ball.global_position = ball_respawn.global_position
