extends Area2D

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	# in pixels
	const SPEED = 1000.0
	const RANGE = 1200.0
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta #delta - time dependent
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
