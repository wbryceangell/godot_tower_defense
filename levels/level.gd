extends Node

@export var mob_scene: PackedScene


func _ready():
	$MobTimer.start(5)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta / 10


func _on_mob_timer_timeout():
	var mob: Mob = mob_scene.instantiate()
	
	add_child(mob)
	
	mob.set_path_to_follow($Path2D/PathFollow2D)
