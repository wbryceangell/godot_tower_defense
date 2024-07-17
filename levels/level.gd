extends Node

@export_group("scenes")
@export var mob_scene: PackedScene
@export var tower_scene: PackedScene


func _ready():
	_spawn_mob()
	$MobTimer.start(1)
	
	
func _on_mob_timer_timeout():
	_spawn_mob()
	
	
func _on_tower_plot_clicked():
	$TowerPlot.disable_clicking()
	_spawn_tower()
	
	
func _spawn_mob():
	var mob: Mob = mob_scene.instantiate()
	add_child(mob)
	mob.follow_path($Path2D)
	
	
func _spawn_tower() -> void:
	var tower: Tower = tower_scene.instantiate()
	tower.global_position = $TowerPlot.position
	add_child(tower)
		
