extends Node

func add_line_points(curve: Curve2D, line: Line2D):
	for point in curve.get_baked_points():
		line.add_point(point)
