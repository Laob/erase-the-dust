class_name Player extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO

@export var speed: int = 300
@export var push_force: float = 10

var friction = 0.18

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

#
#func _physics_process(delta):
	#direction = Vector2(
		#Input.get_axis("ui_left", "ui_right"),
		#Input.get_axis("ui_down", "ui_up")
	#)
	#
	#
	#direction.normalized()
	#velocity = direction * speed
	#for index in get_slide_collision_count():
		#var collision = get_slide_collision(index)
		#var collison_body = collision.get_collider()
		#if collison_body is RigidBody2D:			
			#collison_body.apply_central_impulse(-collision.get_normal() * push_force)
	#
	#move_and_slide()
	#pass
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	var move_input = Input.get_axis("ui_down", "ui_up")
	velocity = transform.x * move_input * speed
	move_and_slide()
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		var collison_body = collision.get_collider()
		if collison_body is RigidBody2D:			
			collison_body.apply_central_impulse(-collision.get_normal() * push_force)
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		look_at(get_global_mouse_position())
	elif  event is InputEventJoypadMotion:
		var joystick_horizontal = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
		var joystick_vertical = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
		rotation = atan2(joystick_vertical, joystick_horizontal)
	pass
