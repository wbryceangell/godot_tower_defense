extends Node

@export var mob_scene: PackedScene


func _ready():
	$MobTimer.start(5)
	
	
func _on_mob_timer_timeout():
	var mob: Mob = mob_scene.instantiate()
	
	add_child(mob)
	
	mob.follow_path($Path2D)
