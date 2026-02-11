extends Node

var current_level = 1
var area_path = "res://Scenes/Areas/"

func next_level() -> void:
	current_level += 1
	var full_path = area_path + "area_" + str(current_level) + ".tscn"
	get_tree().change_scene_to_file(full_path)
