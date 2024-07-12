extends Node

@export var mob_scene: PackedScene

func _ready():
	_spawn_mob()
	$MobTimer.start(1)
	
	
func _on_mob_timer_timeout():
	_spawn_mob()
	
	
func _spawn_mob():
	var mob: Mob = mob_scene.instantiate()
	add_child(mob)
	mob.follow_path($Path2D)
