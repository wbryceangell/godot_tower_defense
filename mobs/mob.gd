class_name Mob extends CharacterBody2D

signal reached_end

var path_to_follow: PathFollow2D
var life_bar_size_x
var life = 10.0
var damage_taken = 0.0
var decrease_life_amount = 5

func _ready():
	life_bar_size_x = $LifeBar.size.x


func damage(amount: int):
	damage_taken += amount
	$LifeBar.size.x = life_bar_size_x * ((life - damage_taken) / life)
	if (damage_taken >= life):
		queue_free()


func follow_path(path: Path2D):
	if (!path_to_follow):
		path_to_follow = PathFollow2D.new()
		path_to_follow.position = path.curve.get_point_position(0)
		path.add_child(path_to_follow)
		

func _process(delta):
	var path_move_amount = delta / 10
	
	if (path_to_follow.progress_ratio + path_move_amount >= 1.0):
		path_to_follow.progress_ratio = 1.0
	else:
		path_to_follow.progress_ratio += path_move_amount

	global_position = path_to_follow.global_position
	
	if (path_to_follow.progress_ratio == 1.0):
		reached_end.emit(decrease_life_amount)
		queue_free()
	

	
