extends Node2D

@onready var player = $Player
@onready var ball = $Ball

var is_start = false

func _ready():
	is_start = false
	pass

func _process(delta):
	if not is_start:
		ball.global_position.x = player.global_position.x
		if Input.is_action_just_pressed("fire"):
			is_start = true
			print("starting")
