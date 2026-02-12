extends Node

var current_level: int = 1
var area_path: String = "res://Scenes/Areas/"
var energy_cells_collected: int = 0
var energy_cells_to_collect: int = 0

func _ready() -> void:
	reset_energy_cells()

func next_level() -> void:
	current_level += 1
	var full_path = area_path + "area_" + str(current_level) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	set_up_level()
	
func set_up_level():
	reset_energy_cells()
	
func set_energy_cells_area(amount: int):
	energy_cells_to_collect = amount
	
func reset_energy_cells():
	energy_cells_collected = 0
	
func collect_energy_cell():
	energy_cells_collected += 1
	if energy_cells_collected >= energy_cells_to_collect:
		var area_exit = get_tree().get_first_node_in_group("area_exits") as AreaExit
		area_exit.open_portal()
	
