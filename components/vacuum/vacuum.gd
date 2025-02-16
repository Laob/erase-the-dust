extends Node2D

const GREEN_THRESHOLD = 40
const ORANGE_THRESHOLD = 80

const FILL_INC = 0.25
@onready var collection_area = $Collection


@export var max_fill_level = 100
var current_fill_level = 0
@onready var color_rect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_fill_rect()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for area in collection_area.get_overlapping_areas():
		if area.has_method("clean") and current_fill_level <= max_fill_level:
			area.clean(delta)
			current_fill_level += FILL_INC
			update_fill_rect()
	

func update_fill_rect():
	if current_fill_level < GREEN_THRESHOLD:
		color_rect.color = "#00ff00"
	elif current_fill_level <= ORANGE_THRESHOLD:
		color_rect.color = "ff9c00"
	else:
		color_rect.color = "#ff0000"

func _on_collection_area_entered(area: Area2D) -> void:
	pass
