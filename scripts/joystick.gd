extends Control

@export var player: CharacterBody2D 

var drag_position = Vector2.ZERO
var dragging = false
var start_pos = Vector2()
var max_distance = 50  # Adjust joystick range

@onready var screen_width = get_viewport().get_visible_rect().size.x

func _ready():
	start_pos = $JoystickBase.position  # Save initial joystick position

func _input(event):
	var offset = Vector2.ZERO
	
	if event.position.x < screen_width / 2:
		# Handle joystick input
		if event is InputEventScreenTouch:
			if event.pressed:
				drag_position = event.position - global_position + self.position
				start_pos = drag_position
				dragging = true
			else:
				player.move_left = false
				player.move_right = false
				dragging = false
				$JoystickKnob.position = Vector2()

		if event is InputEventScreenDrag and dragging:
			offset = event.position - start_pos

			if offset.length() > max_distance:
				offset = offset.normalized() * max_distance  # Limit movement

			$JoystickKnob.position = offset

			# Move player
			if player:
				if offset.x < -10:
					player.move_left = true
					player.move_right = false
				elif offset.x > 10:
					player.move_right = true
					player.move_left = false
				else:
					player.move_left = false
					player.move_right = false

	# Handle jump input separately
	if event is InputEventScreenTouch and event.pressed:
		if event.position.x > screen_width / 2:  # Assuming jump button is on the right side of the screen
			player.jump_pressed = true
