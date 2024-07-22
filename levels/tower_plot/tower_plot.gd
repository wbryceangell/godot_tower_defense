class_name TowerPlot extends Node2D

signal clicked


func _on_button_pressed():
	clicked.emit()
	

func disable_clicking():
	$Button.disabled = true
	

func enable_clicking():
	$Button.disabled = false

