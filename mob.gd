extends CharacterBody2D
var health=3
var player

func _ready():
	player = get_node("Player")
	%Slime.play_walk()

	

func _physics_process(delta):
	if player:
		var direction= global_position.direction_to(player.global_position)
		velocity=direction*300.0
		move_and_slide()
	
func take_damage():
	health=health-1
	%Slime.play_hurt()
	if health==0:
		queue_free()
		const SMOKESCENE=preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke=SMOKESCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position=global_position
