extends Area2D

func _physics_process(delta):
	var enemies_in_range=get_overlapping_bodies()
	if enemies_in_range.size()>0:
		var target_enemy=enemies_in_range.front()
		look_at(target_enemy.global_position)
 
func shoot():
	const BULLET=preload("res://bullet.tscn")
	var newbullet=BULLET.instantiate()
	newbullet.global_position=%bullet.global_position
	newbullet.global_rotation=%bullet.global_rotation
	%bullet.add_child(newbullet)

func _on_timer_timeout() -> void:
	shoot() # Replace with function body.
