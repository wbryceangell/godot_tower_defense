extends Line2D

@export var path : Path2D

func _ready():
	for point in path.curve.get_baked_points():
		add_point(point)
