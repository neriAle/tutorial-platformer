extends Node2D

func _ready() -> void:
	var num_energy_cells = $EnergyCells.get_child_count()
	GameManager.set_energy_cells_area(num_energy_cells)
