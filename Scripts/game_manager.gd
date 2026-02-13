extends Node

var starting_area: int = 1
var current_area: int = 1
var area_path: String = "res://Scenes/Areas/"
var energy_cells_collected: int = 0
var energy_cells_to_collect: int = 0

var area_container: Node2D
var player: PlayerController

func _ready() -> void:
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")
	load_area(starting_area)
	reset_energy_cells()

func next_area() -> void:
	current_area += 1
	load_area(current_area)
	
func load_area(area_number: int):
	# Check path of new scene
	var full_path = area_path + "area_" + str(area_number) + ".tscn"
	var scene = load(full_path) as PackedScene
	if !scene:
		return
	
	# Removing previous scene
	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited
		
	# Set up new scene
	var instance = scene.instantiate()
	area_container.add_child(instance)
	reset_energy_cells()
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	player.teleport_to_location(player_start_position.position)

func set_energy_cells_area(amount: int):
	energy_cells_to_collect = amount
	
func reset_energy_cells():
	energy_cells_collected = 0
	
func collect_energy_cell():
	energy_cells_collected += 1
	if energy_cells_collected >= energy_cells_to_collect:
		var area_exit = get_tree().get_first_node_in_group("area_exits") as AreaExit
		area_exit.open_portal()
	
