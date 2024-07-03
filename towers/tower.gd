extends Node

signal zapping

func _on_body_entered(body: Node2D):
	zapping.emit(body)
