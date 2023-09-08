extends Node2D

@onready var player = $Player
@onready var ball = $Ball
@onready var player_respawn = $PlayerRespawnLocation
@onready var ball_respawn = $BallRespawnLocation
@onready var layout_container = $LayoutContainer

var is_start = true
var default_ball_motion = Vector2(10, -50)
var layout = null
var layout_index = 0
var must_move_to_next_level = false
var layouts = [
	"res://scenes/layout_1.tscn",
	"res://scenes/layout_2.tscn",
]

func _ready():
	is_start = true
	reset_player_and_ball()
	must_move_to_next_level = false
	layout_index = 0
	var layout_scene = load(layouts[layout_index])
	layout = layout_scene.instantiate()
	layout_container.add_child(layout)


func _process(delta):
	if is_start:
		ball.is_active = true
		ball.global_position.x = player.global_position.x
		if Input.is_action_just_pressed("fire"):
			is_start = false
			ball.set_motion(default_ball_motion)
	if not must_move_to_next_level and get_tree().get_nodes_in_group("bricks").size() == 0:
		ball.is_active = false
		player.is_active = false
		must_move_to_next_level = true
		get_tree().create_timer(1.5).timeout.connect(_on_move_to_next_level)


func _on_ball_lost():
	AudioPlayer.play_sound("dead")
	player.is_active = false
	await get_tree().create_timer(2).timeout
	reset_player_and_ball()


func reset_player_and_ball():
	AudioPlayer.play_sound("start")
	is_start = true
	ball.is_active = false
	player.is_active = true
	ball.set_motion(Vector2.ZERO)
	player.global_position = player_respawn.global_position
	ball.global_position = ball_respawn.global_position


func _on_move_to_next_level():
	layout_container.remove_child(layout)
	layout_index += 1
	if layout_index < layouts.size():
		var layout_scene = load(layouts[layout_index])
		layout = layout_scene.instantiate()
		layout_container.add_child(layout)
		reset_player_and_ball()
	else:
		print("You won")
