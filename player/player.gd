class_name Player extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO

@export var speed: int = 300

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _process(_delta):
	direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	direction.normalized()
	velocity = direction * speed
	move_and_slide()
	pass
	
	
func _input(event):
	if event is InputEventMouseMotion:
		look_at(get_global_mouse_position())
	elif  event is InputEventJoypadMotion:
		var joystick_horizontal = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
		var joystick_vertical = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
		rotation = atan2(joystick_vertical, joystick_horizontal)
	pass
