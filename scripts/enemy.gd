extends CharacterBody2D

@export var speed = 100  # Movement speed
@export var move_distance = 100  # How far it moves before turning
var direction = -1  # 1 = right, -1 = left
var start_position

func _ready():
	start_position = position.x  # Store initial position

func _physics_process(delta):
	velocity.x = direction * speed
	move_and_slide()

	# Change direction when reaching the movement limit
	if abs(position.x - start_position) > move_distance:
		direction *= -1  # Reverse direction
		scale.x *= -1  # Flip sprite horizontally


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player hit!")  # Should print when the player touches the enemy
