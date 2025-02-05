extends Node2D

func _ready():
	fit_screen()

func fit_screen():
	var screen_size = DisplayServer.window_get_size()
	var game_ratio = 1280.0 / 720.0  # Change to your preferred aspect ratio
	var screen_ratio = float(screen_size.x) / screen_size.y

	if screen_ratio > game_ratio:
		# Screen is wider than game, scale based on height
		get_viewport().canvas_transform = Transform2D(0, Vector2((screen_size.x - (screen_size.y * game_ratio)) / 2, 0))
	else:
		# Screen is taller than game, scale based on width
		get_viewport().canvas_transform = Transform2D(0, Vector2(0, (screen_size.y - (screen_size.x / game_ratio)) / 2))
