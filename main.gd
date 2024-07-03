extends Node

func _on_tower_zapping(mob: Node2D):
	$Zap.zap_something(mob.position, $Tower.position)
	mob.hide()
