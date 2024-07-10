class_name Mob extends CharacterBody2D

var path_to_follow: PathFollow2D

func damage():
	queue_free()

func set_path_to_follow(path: PathFollow2D):
	if (!path_to_follow):
		path_to_follow = path
		
func _process(_delta):
	global_position = path_to_follow.global_position
	
