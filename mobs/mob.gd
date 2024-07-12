class_name Mob extends CharacterBody2D

var path_to_follow: PathFollow2D
var life = 10

func damage(amount: int):
	life -= amount
	if (life <= 0):
		queue_free()


func follow_path(path: Path2D):
	if (!path_to_follow):
		path_to_follow = PathFollow2D.new()
		path_to_follow.position = path.curve.get_point_position(0)
		path.add_child(path_to_follow)
		
		
func _process(delta):
	path_to_follow.progress_ratio += delta / 10
	global_position = path_to_follow.global_position
	
