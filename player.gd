extends CharacterBody2D

@onready var score_label = $"../CanvasLayer/HUD/ScoreLabel"
@export var speed = 200
@export var jump_force = -400
@export var gravity = 600
@export var jump_cutoff = 0.5  # Allows variable jump height

var score = 0

var move_left = false
var move_right = false
var jump_pressed = false

func _physics_process(delta):
	var direction = 0
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	 # Check keyboard and joystick input
	if Input.is_action_pressed("move_left") or move_left:
		direction = -1
	elif Input.is_action_pressed("move_right") or move_right:
		direction = 1

	velocity.x = direction * speed

	# Jump with touch or keyboard
	if (Input.is_action_just_pressed("jump") or jump_pressed) and is_on_floor():
		velocity.y = jump_force
		jump_pressed = false

	move_and_slide()
	
func _on_JumpButton_pressed():
	jump_pressed = true

func _on_coin_coin_collected() -> void:
	score += 1  # Increase score by 1
	print("Score: ", score)  # You can replace this with a UI label later
	score_label.text = "Score: " + str(score) 
