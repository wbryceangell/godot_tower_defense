extends Node

@export_group("scenes")
@export var mob_scene: PackedScene
@export var tower_scene: PackedScene

var life = 20


func _ready():
	_set_life_total(life)

	
func _set_life_total(lifeTotal: int):
	$LifeTotal.text = String.num_uint64(lifeTotal)
	
	
func _on_mob_timer_timeout():
	_spawn_mob()
	
	
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
	life -= amount
	_set_life_total(life)
	

func _on_start_button_pressed():
	$StartButton.hide()
	_spawn_mob()
	$MobTimer.start(1)
	
