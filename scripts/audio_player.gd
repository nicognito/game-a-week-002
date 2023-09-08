extends Node

var brick_sound = preload("res://assets/sounds/impactGlass_medium_004.ogg")
var player_sound = preload("res://assets/sounds/impactMetal_medium_001.ogg")
var wall_sound = preload("res://assets/sounds/footstep_concrete_001.ogg")
var dead_sound = preload("res://assets/sounds/jingles_NES11.ogg")
var start_sound = preload("res://assets/sounds/jingles_NES03.ogg")

func play_sound(sound):
	print(sound)
	var stream = null
	if sound == "brick":
		stream = brick_sound
	elif sound == "player":
		stream = player_sound
	elif sound == "wall":
		stream = wall_sound
	elif sound == "dead":
		stream = dead_sound
	elif sound == "start":
		stream = start_sound
	else:
		return
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = stream
	player.play()
	await player.finished
	player.queue_free()
