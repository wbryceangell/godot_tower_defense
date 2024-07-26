class_name Ball extends Area2D

@export var target: Mob
var damageAmount = 2
var speed = 150
var initial_rotation

func _ready():
	initial_rotation = rotation
	_rotate_toward_target()
	$AnimatedSprite2D.play("default")
	

func _process(delta):
	if (target == null):
		queue_free()
		return
	
	_rotate_toward_target()
	global_position = global_position.move_toward(target.global_position, delta * speed)
	
		
func _on_body_entered(mob):
	if (target == mob):
		queue_free()
		target.damage(damageAmount)
		
		
func _rotate_toward_target():
	var angle = global_position.angle_to_point(target.global_position) + initial_rotation
	print(angle)
	rotation = angle
	
