class_name HUD extends Control

signal start_level


func set_life_total(lifeTotal: int):
	$LifeTotal.text = String.num_uint64(lifeTotal)
	
	
func set_message(message: String):
	$Message.text = message


func show_message():
	$Message.show()
	
	
func hide_message():
	$Message.hide()
	

func show_start_button():
	$StartButton.show()
	

func _on_start_button_pressed():
	$StartButton.hide()
	start_level.emit()
