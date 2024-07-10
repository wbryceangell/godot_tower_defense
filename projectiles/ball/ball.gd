class_name Ball extends Area2D

var target: Mob

func set_target(mob: Mob):
	if (target):
		return
	target = mob

func _process(_delta):
	if (target):
		global_position = global_position.move_toward(target.global_position, 5)
	
		
func _on_body_entered(mob):
	if (mob == target):
		queue_free()
		target.damage()
