class_name Mob extends CharacterBody2D

var path_to_follow: PathFollow2D
var lifeBarSizeX
var life = 10.0
var damageTaken = 0.0

func _ready():
	lifeBarSizeX = $LifeBar.size.x

func damage(amount: int):
	damageTaken += amount
	$LifeBar.size.x = lifeBarSizeX * ((life - damageTaken) / life)
	if (damageTaken >= life):
		queue_free()


func follow_path(path: Path2D):
	if (!path_to_follow):
		path_to_follow = PathFollow2D.new()
		path_to_follow.position = path.curve.get_point_position(0)
		path.add_child(path_to_follow)
		
		
func _process(delta):
	path_to_follow.progress_ratio += delta / 10
	global_position = path_to_follow.global_position
	
