extends Area2D

@export var ball_scene: PackedScene


func _on_body_entered(mob: Mob):
	var ball: Ball = ball_scene.instantiate()
	
	call_deferred("add_child", ball)

	ball.set_target(mob)
