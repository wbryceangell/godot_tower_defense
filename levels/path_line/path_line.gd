extends Node

@export var path : Path2D

func _ready():
	for point in path.curve.get_baked_points():
		$Line2D.add_point(point)
