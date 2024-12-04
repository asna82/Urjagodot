extends Area2D
var travelled_distance=0
func _physics_process(delta):
	const SPE=1000
	const RGE=1200
	var direction=Vector2.RIGHT.rotated(rotation)
	position+=direction*SPE*delta
	travelled_distance+=SPE*delta
	if travelled_distance>RGE:
		queue_free()
		
func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
