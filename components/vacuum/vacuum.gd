extends Node2D

@onready var collection_area = $Collection

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for area in collection_area.get_overlapping_areas():
		if area.has_method("clean"):
			area.clean(delta)
	


func _on_collection_area_entered(area: Area2D) -> void:
	pass
