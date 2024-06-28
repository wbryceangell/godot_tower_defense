extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	PathUtils.add_line_points($Path2D.curve, $Line2D)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta / 10
	$Sprite2D.position = $Path2D/PathFollow2D.position
