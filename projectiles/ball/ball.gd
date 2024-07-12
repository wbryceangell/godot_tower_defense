class_name Ball extends Area2D

@export var target: Mob
var damageAmount = 2
var speed = 150

func _process(delta):
	global_position = global_position.move_toward(target.global_position, delta * speed)
	
		
func _on_body_entered(mob):
	if (target == mob):
		queue_free()
		target.damage(damageAmount)
