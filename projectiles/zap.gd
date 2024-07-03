extends Line2D

@export var zap_time_secs: float = 1

func zap_something(point1: Vector2, point2: Vector2):
	$Timer.start(zap_time_secs)
	add_point(point1)
	add_point(point2)

func _on_timer_timeout():
	clear_points()
