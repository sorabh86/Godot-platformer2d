extends CharacterBody2D

@onready var score_label = $"../CanvasLayer/HUD/ScoreLabel"
@export var speed = 200
@export var jump_force = -400
@export var gravity = 800
@export var jump_cutoff = 0.5  # Allows variable jump height

var score = 0

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Left & Right movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# Jumping with variable height
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force
	elif Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y *= jump_cutoff
		
	#print("player script runs")

	move_and_slide()

func _on_coin_coin_collected() -> void:
	score += 1  # Increase score by 1
	print("Score: ", score)  # You can replace this with a UI label later
	score_label.text = "Score: " + str(score) 
