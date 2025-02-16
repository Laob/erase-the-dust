extends Area2D

const MAX_DIRTYNESS = 1.0

var dirtyness:float = MAX_DIRTYNESS
var is_dead = false;
@onready var initial_dirt_scale = $Dirt.scale
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.dirtyness <= 0 and not $CPUParticles2D.emitting:
		self.queue_free()

func clean(amount:float = 1.0):
	if self.dirtyness > 0:
		self.dirtyness -= amount
	$Dirt.scale = initial_dirt_scale * (dirtyness / MAX_DIRTYNESS)
	if self.dirtyness <= 0 and not is_dead:
		is_dead = true;
		$CPUParticles2D.restart()
