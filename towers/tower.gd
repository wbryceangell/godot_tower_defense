class_name Tower extends Area2D

@export var ball_scene: PackedScene
var time_between_shots = 1

func _process(_delta):
	if ($ShotTimer.is_stopped() && has_overlapping_bodies()):
		_shoot(get_overlapping_bodies().front())
		$ShotTimer.start(time_between_shots)


func _shoot(mob: Mob):
	var ball: Ball = ball_scene.instantiate()
	ball.target = mob
	add_child(ball)
	
