extends Node

@export_group("scenes")
@export var mob_scene: PackedScene
@export var tower_scene: PackedScene

var life = 20


func _ready():
	$Hud.set_life_total(life)

	
func _on_mob_timer_timeout():
	_spawn_mob()
	$MobTimer.start(1)
	
	
func _on_tower_plot_clicked():
	$TowerPlot.disable_clicking()
	_spawn_tower()
	
	
func _spawn_mob():
	var mob: Mob = mob_scene.instantiate()
	mob.connect("reached_end", _decrease_life)
	add_child(mob)
	mob.follow_path($Path2D)
	
	
func _spawn_tower() -> void:
	var tower: Tower = tower_scene.instantiate()
	tower.global_position = $TowerPlot.position
	add_child(tower)
		

func _decrease_life(amount: int):
	if (life - amount <= 0):
		life = 0
	else:
		life -= amount 
		
	$Hud.set_life_total(life)
	
	if (life == 0):
		_lose_level()
		
	
func _lose_level():
	$MobTimer.stop()
	get_tree().call_group("mobs", "queue_free")
	get_tree().call_group("towers", "queue_free")
	$TowerPlot.enable_clicking()
	$Hud.set_message("You Lost!")
	$Hud.show_message()
	$Hud.show_start_button()
	

func _on_hud_start_level():
	life = 20
	$Hud.set_life_total(life)
	$Hud.hide_message()
	_spawn_mob()
	$MobTimer.start(1)
