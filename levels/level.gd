extends Node

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta / 10
	$Mob.position = $Path2D/PathFollow2D.position	
