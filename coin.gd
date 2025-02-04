extends Area2D

signal coin_collected  # Signal to notify collection

func _ready():
	# Make the coin "active" by enabling its collision
	set_deferred("collision_layer", 0)

func _on_Coin_body_entered(body):
	print("body running")
	if body.name == "Player":
		emit_signal("coin_collected")  # Emit signal when the player collects the coin
		#queue_free()  # Remove the coin from the scene
