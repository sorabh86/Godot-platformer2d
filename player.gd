extends CharacterBody2D

@export var speed = 200
@export var jump_force = -400
@export var gravity = 800
@export var jump_cutoff = 0.5  # Allows variable jump height

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

	move_and_slide()
