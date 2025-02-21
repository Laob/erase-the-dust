extends Node2D
var cleaner_bag_scene = load("res://components/bag/cleaner-bag.tscn")


# leaves a cleaner_bag in the level when triggered
func _on_vacuum_cleaner_bag_leaved(position:Vector2) -> void:
	var level_scene = find_child("Level1")	
	var cleaner_bag = cleaner_bag_scene.instantiate()
	cleaner_bag.position = position
	level_scene.add_child(cleaner_bag)
